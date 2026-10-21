namespace portfolio_api.DTO.Models
{
    public class LanguageSummaryModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string Code { get; set; } = null!;
        public string Direction { get; set; } = null!;
        public string? Flag { get; set; }
        public bool IsDefault { get; set; }
    }
}
