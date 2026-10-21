using portfolio_api.DTO.Models;

namespace portfolio_api.DTO.Responses
{
    public class GlobalResponseModel
    {
        public LanguageSummaryModel Language { get; set; } = null!;
        public List<GlobalContentModel> Data { get; set; } = new();
    }
}
