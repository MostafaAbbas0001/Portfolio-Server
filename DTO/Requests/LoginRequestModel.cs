namespace portfolio_api.DTO.Requests;

public class LoginRequestModel
{
    public string Email { get; set; } = null!;
    public string Password { get; set; } = null!;
}
