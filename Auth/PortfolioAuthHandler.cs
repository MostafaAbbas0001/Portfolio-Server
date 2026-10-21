using System.Security.Claims;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Options;
using portfolio_api.Services;

namespace portfolio_api.Auth;

public class PortfolioAuthHandler : AuthenticationHandler<AuthenticationSchemeOptions>
{
    private readonly AuthTokenService _authTokenService;

    public PortfolioAuthHandler(
        IOptionsMonitor<AuthenticationSchemeOptions> options,
        ILoggerFactory logger,
        UrlEncoder encoder,
        AuthTokenService authTokenService)
        : base(options, logger, encoder)
    {
        _authTokenService = authTokenService;
    }

    protected override Task<AuthenticateResult> HandleAuthenticateAsync()
    {
        var authorization = Request.Headers.Authorization.ToString();
        if (string.IsNullOrWhiteSpace(authorization) || !authorization.StartsWith("Bearer "))
        {
            return Task.FromResult(AuthenticateResult.NoResult());
        }

        var token = authorization["Bearer ".Length..].Trim();
        if (!_authTokenService.TryValidateToken(token, out var payload))
        {
            return Task.FromResult(AuthenticateResult.Fail("Invalid token."));
        }

        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, payload.Email),
            new Claim(ClaimTypes.Email, payload.Email),
            new Claim(ClaimTypes.Role, "Admin"),
        };
        var identity = new ClaimsIdentity(claims, AuthConstants.Scheme);
        var principal = new ClaimsPrincipal(identity);
        var ticket = new AuthenticationTicket(principal, AuthConstants.Scheme);

        return Task.FromResult(AuthenticateResult.Success(ticket));
    }
}
