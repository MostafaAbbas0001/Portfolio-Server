namespace portfolio_api.DTO.Requests
{
    public class UpsertTechnologyRequestModel
    {
        public string Key { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? ImageUrl { get; set; }
    }
}
