using System.Text.Json;

namespace portfolio_api.DTO.Requests
{
    public class UpdatePageRequestModel
    {
        public JsonElement? Content { get; set; }
        public JsonElement? SeoData { get; set; }
        public List<UpdateSectionRequestModel>? Sections { get; set; }
    }

    public class UpdateSectionRequestModel
    {
        public int Id { get; set; }
        public JsonElement Content { get; set; }
    }
}
