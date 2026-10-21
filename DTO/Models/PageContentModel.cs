namespace portfolio_api.DTO.Models
{
    public class PageContentModel
    {
        public int Id { get; set; }
        public string Key { get; set; } = null!;
        public string Slug { get; set; } = null!;
        public string? Content { get; set; }
        public string? SeoData { get; set; }
        public List<SectionContentModel> Sections { get; set; } = new();
    }
}
