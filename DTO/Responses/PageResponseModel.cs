using portfolio_api.DTO.Models;

namespace portfolio_api.DTO.Responses
{
    public class PageResponseModel
    {
        public LanguageSummaryModel Language { get; set; } = null!;
        public PageContentModel Data { get; set; } = null!;
    }
}
