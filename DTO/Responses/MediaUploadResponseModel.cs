namespace portfolio_api.DTO.Responses
{
    public class MediaUploadResponseModel
    {
        public string FileName { get; set; } = null!;
        public string OriginalFileName { get; set; } = null!;
        public string Folder { get; set; } = null!;
        public string Url { get; set; } = null!;
        public string ContentType { get; set; } = null!;
        public long Size { get; set; }
    }
}
