using portfolio_api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using portfolio_api.DTO.Requests;
using portfolio_api.DTO.Responses;
using portfolio_api.DTO.Models;


namespace portfolio_api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SiteController : ControllerBase
    {
        private readonly DataService _pageService;
        private readonly SiteMediaService _siteMediaService;
        private readonly ImageVariantService _imageVariantService;

        public SiteController(
            DataService pageService,
            SiteMediaService siteMediaService,
            ImageVariantService imageVariantService)
        {
            _pageService = pageService;
            _siteMediaService = siteMediaService;
            _imageVariantService = imageVariantService;
        }

        [HttpGet("page-data")]
        public async Task<ActionResult<PageResponseModel>> GetPageData(string language, string pagekey)
        {
            var siteData = await _pageService.GetPageDataAsync(language, pagekey);

            return Ok(siteData);
        }

        [Authorize]
        [HttpPatch("page-data")]
        public async Task<IActionResult> UpdatePageData(string language, int pageId, UpdatePageRequestModel request)
        {
            await _pageService.UpdatePageDataAsync(language, pageId, request);

            return Ok("Page data updated successfully");
        }

        [HttpGet("global-data")]
        public async Task<ActionResult<GlobalResponseModel>> GetGlobalDataAsync(string language)
        {
            var globalData = await _pageService.GetGlobalDataAsync(language);

            return Ok(globalData);
        }

        [HttpGet("technologies")]
        public async Task<ActionResult<List<TechnologyContentModel>>> GetTechnologies()
        {
            return Ok(await _pageService.GetTechnologiesAsync());
        }

        [Authorize]
        [HttpPost("technologies")]
        public async Task<ActionResult<TechnologyContentModel>> CreateTechnology(
            UpsertTechnologyRequestModel request)
        {
            return Ok(await _pageService.CreateTechnologyAsync(request));
        }

        [Authorize]
        [HttpPatch("technologies/{id:int}")]
        public async Task<ActionResult<TechnologyContentModel>> UpdateTechnology(
            int id,
            UpsertTechnologyRequestModel request)
        {
            return Ok(await _pageService.UpdateTechnologyAsync(id, request));
        }

        [Authorize]
        [HttpDelete("technologies/{id:int}")]
        public async Task<IActionResult> DeleteTechnology(int id)
        {
            await _pageService.DeleteTechnologyAsync(id);
            return Ok("Technology deleted successfully");
        }

        [Authorize]
        [HttpPatch("global-data")]
        public async Task<IActionResult> UpdateGlobalData(string language, string key, UpdateGlobalRequestModel request)
        {
            await _pageService.UpdateGlobalDataAsync(language, key, request);

            return Ok("Global data updated successfully");
        }

        [Authorize]
        [HttpPost("upload-media")]
        public async Task<ActionResult<MediaUploadResponseModel>> UploadMedia(IFormFile file)
        {
            var uploadedFile = await _siteMediaService.UploadMediaAsync(file);

            return Ok(uploadedFile);
        }

        [HttpGet("media/images")]
        public IActionResult GetImageFiles()
        {
            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Uploads", "images");
            if (!Directory.Exists(uploadsFolder))
            {
                return Ok(new List<string>());
            }

            var files = Directory.GetFiles(uploadsFolder)
                .Where(file => !Path.GetFileName(file).StartsWith('.'))
                .Select(Path.GetFileName)
                .ToList();

            return Ok(files);
        }

        [Authorize]
        [HttpDelete("media/images/{fileName}")]
        public IActionResult DeleteImage(string fileName)
        {
            try
            {
                _siteMediaService.DeleteImage(fileName);
                _imageVariantService.DeleteVariants(fileName);

                return Ok("Image deleted successfully");
            }
            catch (FileNotFoundException)
            {
                return NotFound("Image not found");
            }
        }

        /// <summary>
        /// Resized WebP copy of an uploaded image, e.g. /Site/image?src=/Uploads/images/a.png&amp;w=960
        /// </summary>
        [HttpGet("image")]
        public async Task<IActionResult> GetImageVariant(
            [FromQuery] string? src,
            [FromQuery] int w,
            CancellationToken cancellationToken)
        {
            if (!ImageVariantService.AllowedWidths.Contains(w))
            {
                return BadRequest($"Width must be one of: {string.Join(", ", ImageVariantService.AllowedWidths)}");
            }

            var variant = await _imageVariantService.GetVariantAsync(src, w, cancellationToken);
            if (variant == null)
            {
                return NotFound();
            }

            Response.Headers.CacheControl = "public, max-age=604800, stale-while-revalidate=86400";
            return PhysicalFile(
                variant.FullName,
                "image/webp",
                lastModified: variant.LastWriteTimeUtc,
                entityTag: new Microsoft.Net.Http.Headers.EntityTagHeaderValue($"\"{variant.Name}\""));
        }

        [HttpGet("media/resume")]
        public IActionResult DownloadResume()
        {
            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "Uploads", "resume");
            var fileName = "Mostafa Abbas Resume.pdf";
            var filePath = Path.Combine(uploadsFolder, fileName);

            if (!System.IO.File.Exists(filePath))
            {
                return NotFound("Resume not found");
            }

            return PhysicalFile(filePath, "application/pdf", fileName);
        }
    }
}
