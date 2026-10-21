namespace portfolio_api.DTO.Models
{
    public class TechnologyContentModel
    {
        public int Id { get; set; }
        public string Key { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? ImageUrl { get; set; }
    }
}
