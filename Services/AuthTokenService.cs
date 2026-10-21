using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace portfolio_api.Services;

public class AuthTokenService
{
    private readonly string _secret;

    public AuthTokenService()
    {
        _secret = Environment.GetEnvironmentVariable("AUTH_TOKEN_SECRET")
            ?? throw new InvalidOperationException("AUTH_TOKEN_SECRET is not configured.");
    }

    public string CreateToken(string email, TimeSpan lifetime)
    {
        var issuedAt = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
        var expiresAt = DateTimeOffset.UtcNow.Add(lifetime).ToUnixTimeSeconds();
        var header = Base64UrlEncode(JsonSerializer.SerializeToUtf8Bytes(new JwtHeader("HS256", "JWT")));
        var payload = Base64UrlEncode(
            JsonSerializer.SerializeToUtf8Bytes(new JwtPayload(email, email, "Admin", issuedAt, expiresAt)));
        var signature = Sign($"{header}.{payload}");

        return $"{header}.{payload}.{signature}";
    }

    public bool TryValidateToken(string token, out AuthTokenPayload payload)
    {
        payload = new AuthTokenPayload("", 0);
        var parts = token.Split('.', 3);
        if (parts.Length != 3) return false;

        var expectedSignature = Sign($"{parts[0]}.{parts[1]}");
        if (!CryptographicOperations.FixedTimeEquals(
                Encoding.UTF8.GetBytes(parts[2]),
                Encoding.UTF8.GetBytes(expectedSignature)))
        {
            return false;
        }

        try
        {
            var headerJson = Base64UrlDecode(parts[0]);
            var header = JsonSerializer.Deserialize<JwtHeader>(headerJson);
            if (header is not { Algorithm: "HS256", Type: "JWT" }) return false;

            var payloadJson = Base64UrlDecode(parts[1]);
            var jwtPayload = JsonSerializer.Deserialize<JwtPayload>(payloadJson);
            if (jwtPayload is null) return false;

            payload = new AuthTokenPayload(jwtPayload.Email, jwtPayload.ExpiresAt);
        }
        catch
        {
            return false;
        }

        return !string.IsNullOrWhiteSpace(payload.Email)
            && payload.ExpiresAt > DateTimeOffset.UtcNow.ToUnixTimeSeconds();
    }

    private string Sign(string payload)
    {
        using var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(_secret));
        return Base64UrlEncode(hmac.ComputeHash(Encoding.UTF8.GetBytes(payload)));
    }

    private static string Base64UrlEncode(byte[] bytes)
    {
        return Convert.ToBase64String(bytes).TrimEnd('=').Replace('+', '-').Replace('/', '_');
    }

    private static byte[] Base64UrlDecode(string value)
    {
        var padded = value.Replace('-', '+').Replace('_', '/');
        padded = padded.PadRight(padded.Length + (4 - padded.Length % 4) % 4, '=');
        return Convert.FromBase64String(padded);
    }
}

public record AuthTokenPayload(string Email, long ExpiresAt);

public record JwtHeader(
    [property: JsonPropertyName("alg")] string Algorithm,
    [property: JsonPropertyName("typ")] string Type);

public record JwtPayload(
    [property: JsonPropertyName("sub")] string Subject,
    [property: JsonPropertyName("email")] string Email,
    [property: JsonPropertyName("role")] string Role,
    [property: JsonPropertyName("iat")] long IssuedAt,
    [property: JsonPropertyName("exp")] long ExpiresAt);
