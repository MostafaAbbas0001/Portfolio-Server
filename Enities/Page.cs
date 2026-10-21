namespace portfolio_api.Entities
{
    public class Page
    {
        public int id { get; set; }
        public int languageId { get; set; }
        public string key { get; set; } = null!;
         public string slug { get; set; } = null!;
        public string? content { get; set; }
        public string? seoData { get; set; }
    }
}