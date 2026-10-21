namespace portfolio_api.Entities
{
    public class Section
    {
        public int id { get; set; }
        public int pageId { get; set; }
        public string key { get; set; } = null!;
        public string? content { get; set; }
    }
}