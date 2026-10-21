using System.Text.Json;

namespace portfolio_api.DTO.Requests
{
    public class UpdateGlobalRequestModel
    {
        public JsonElement? Content { get; set; }
    }
}
