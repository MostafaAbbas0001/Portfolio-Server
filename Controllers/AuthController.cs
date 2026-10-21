using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using portfolio_api.DTO.Requests;
using portfolio_api.DTO.Responses;
using portfolio_api.Services;

namespace portfolio_api.Controllers;

[ApiController]
[Route("[controller]")]
public class AuthController : ControllerBase
{
    private readonly AuthTokenService _authTokenService;

    public AuthController(AuthTokenService authTokenService)
    {
        _authTokenService = authTokenService;
    }

    [HttpPost("login")]
    public ActionResult<AuthResponseModel> Login(LoginRequestModel request)
    {
        var adminEmail = Environment.GetEnvironmentVariable("ADMIN_EMAIL");
        var adminPassword = Environment.GetEnvironmentVariable("ADMIN_PASSWORD");

        if (string.IsNullOrWhiteSpace(adminEmail) || string.IsNullOrWhiteSpace(adminPassword))
        {
            return StatusCode(StatusCodes.Status500InternalServerError, "Admin credentials are not configured.");
        }

        if (!string.Equals(request.Email, adminEmail, StringComparison.OrdinalIgnoreCase)
            || request.Password != adminPassword)
        {
            return Unauthorized("Invalid email or password.");
        }

        var lifetime = TimeSpan.FromHours(8);
        var token = _authTokenService.CreateToken(adminEmail, lifetime);

        return Ok(new AuthResponseModel
        {
            Token = token,
            Email = adminEmail,
            ExpiresAt = DateTimeOffset.UtcNow.Add(lifetime).ToUnixTimeSeconds(),
        });
    }

    [Authorize]
    [HttpGet("me")]
    public ActionResult<AuthUserResponseModel> Me()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrWhiteSpace(email)) return Unauthorized();

        return Ok(new AuthUserResponseModel { Email = email });
    }
}
