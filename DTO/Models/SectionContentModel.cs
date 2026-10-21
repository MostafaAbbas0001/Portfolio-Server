namespace portfolio_api.DTO.Models
{
    public class SectionContentModel
    {
        public int Id { get; set; }
        public int PageId { get; set; }
        public string Key { get; set; } = null!;
        public string? Content { get; set; }
    }
}
