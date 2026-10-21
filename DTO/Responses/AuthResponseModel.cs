namespace portfolio_api.DTO.Responses;

public class AuthResponseModel
{
    public string Token { get; set; } = null!;
    public string Email { get; set; } = null!;
    public long ExpiresAt { get; set; }
}
