namespace portfolio_api.Entities
{
    public class Global
    {
        public int id { get; set; }
        public int languageId { get; set; }
        public string key { get; set; } = null!;
        public string? content { get; set; }
    }
}