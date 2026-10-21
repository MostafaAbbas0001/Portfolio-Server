using portfolio_api.DTO.Responses;

namespace portfolio_api.Services
{
    public class SiteMediaService
    {
        private static readonly string[] AllowedImageExtensions =
        {
            ".jpg", ".jpeg", ".png", ".webp", ".gif", ".bmp", ".tiff", ".tif", ".avif"
        };

        private const string ResumeExtension = ".pdf";
        private const long MaxFileSize = 10 * 1024 * 1024;

        public SiteMediaService(IWebHostEnvironment environment)
        {
        }

        public async Task<MediaUploadResponseModel> UploadMediaAsync(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                throw new InvalidOperationException("No file was uploaded");
            }

            if (file.Length > MaxFileSize)
            {
                throw new InvalidOperationException("File is too large");
            }

            var extension = Path.GetExtension(file.FileName).ToLowerInvariant();
            var folder = GetUploadFolderName(extension);

            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Uploads", folder);
            Directory.CreateDirectory(uploadsFolder);

            var fileName = folder == "resume" ? "Mostafa Abbas Resume.pdf" : $"{Guid.NewGuid():N}{extension}";
            var filePath = Path.Combine(uploadsFolder, fileName);

            if (folder == "resume")
            {
                foreach (var existingFile in Directory.GetFiles(uploadsFolder, "*.pdf"))
                {
                    File.Delete(existingFile);
                }
            }

            await using var stream = new FileStream(filePath, FileMode.Create);
            await file.CopyToAsync(stream);

            return new MediaUploadResponseModel
            {
                FileName = fileName,
                OriginalFileName = file.FileName,
                Folder = folder,
                Url = $"/Uploads/{folder}/{fileName}",
                ContentType = file.ContentType,
                Size = file.Length
            };
        }

        public void DeleteImage(string fileName)
        {
            if (string.IsNullOrWhiteSpace(fileName))
            {
                throw new InvalidOperationException("File name is required");
            }

            var safeFileName = Path.GetFileName(fileName);
            var extension = Path.GetExtension(safeFileName).ToLowerInvariant();

            if (!AllowedImageExtensions.Contains(extension))
            {
                throw new InvalidOperationException("Only image files can be deleted from this endpoint");
            }

            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Uploads", "images");
            var filePath = Path.Combine(uploadsFolder, safeFileName);

            if (!File.Exists(filePath))
            {
                throw new FileNotFoundException("Image not found");
            }

            File.Delete(filePath);
        }

        private static string GetUploadFolderName(string extension)
        {
            if (AllowedImageExtensions.Contains(extension))
            {
                return "images";
            }

            if (extension == ResumeExtension)
            {
                return "resume";
            }

            throw new InvalidOperationException("File type is not allowed");
        }
    }
}
