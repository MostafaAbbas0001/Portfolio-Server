namespace portfolio_api.Entities
{
    public class Technologies
    {
        public int id { get; set; }
        public string key { get; set; } = null!;
        public string name { get; set; } = null!;
        public string? imageUrl { get; set; }
    }
}