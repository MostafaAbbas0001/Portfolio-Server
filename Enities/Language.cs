namespace portfolio_api.Entities
{
    public class Language
    {
        public int id { get; set; }
        public string? name { get; set; }
        public string code { get; set; } = null!;
        public string direction { get; set; } = null!;
        public string? flag { get; set; }
        public bool isDefault { get; set; }
    }
}