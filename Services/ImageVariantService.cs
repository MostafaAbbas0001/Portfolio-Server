using System.Collections.Concurrent;
using SkiaSharp;

namespace portfolio_api.Services
{
    /// <summary>
    /// Serves resized WebP copies of uploaded images so the site never ships a full-size PNG.
    /// Variants are generated on first request and cached on disk next to the uploads.
    /// </summary>
    public class ImageVariantService
    {
        public static readonly int[] AllowedWidths = { 64, 128, 256, 384, 480, 640, 768, 960, 1280, 1600 };

        private const string UploadsPrefix = "/Uploads/images/";
        private static readonly string[] ResizableExtensions =
        {
            ".jpg", ".jpeg", ".png", ".webp", ".gif", ".bmp", ".tiff", ".tif"
        };
        private static readonly ConcurrentDictionary<string, SemaphoreSlim> Locks = new();

        private readonly string _imagesRoot;
        private readonly string _cacheRoot;

        public ImageVariantService(IWebHostEnvironment environment)
        {
            _imagesRoot = Path.Combine(environment.ContentRootPath, "Uploads", "images");
            _cacheRoot = Path.Combine(environment.ContentRootPath, "Uploads", ".cache", "images");
        }

        /// <summary>
        /// Returns the cached WebP variant for an uploaded image, or null when the source
        /// is not a resizable file directly inside /Uploads/images.
        /// </summary>
        public async Task<FileInfo?> GetVariantAsync(string? source, int width, CancellationToken cancellationToken)
        {
            if (string.IsNullOrWhiteSpace(source) || !source.StartsWith(UploadsPrefix, StringComparison.Ordinal))
            {
                return null;
            }

            var fileName = source[UploadsPrefix.Length..];
            if (fileName.Length == 0 || fileName != Path.GetFileName(fileName) || fileName.StartsWith('.'))
            {
                return null;
            }

            var extension = Path.GetExtension(fileName).ToLowerInvariant();
            if (!ResizableExtensions.Contains(extension))
            {
                return null;
            }

            var original = new FileInfo(Path.Combine(_imagesRoot, fileName));
            if (!original.Exists)
            {
                return null;
            }

            var variantName =
                $"{Path.GetFileNameWithoutExtension(fileName)}-{original.LastWriteTimeUtc.Ticks:x}-{width}.webp";
            var variant = new FileInfo(Path.Combine(_cacheRoot, variantName));
            if (variant.Exists)
            {
                return variant;
            }

            var gate = Locks.GetOrAdd(variantName, _ => new SemaphoreSlim(1, 1));
            await gate.WaitAsync(cancellationToken);
            try
            {
                variant.Refresh();
                if (variant.Exists)
                {
                    return variant;
                }

                Directory.CreateDirectory(_cacheRoot);
                var temporaryPath = $"{variant.FullName}.{Guid.NewGuid():N}.tmp";
                var bytes = await Task.Run(() => EncodeWebp(original.FullName, width), cancellationToken);
                await File.WriteAllBytesAsync(temporaryPath, bytes, cancellationToken);
                File.Move(temporaryPath, variant.FullName, overwrite: true);
                variant.Refresh();
                return variant;
            }
            finally
            {
                gate.Release();
            }
        }

        private static byte[] EncodeWebp(string path, int width)
        {
            using var source = SKBitmap.Decode(path)
                ?? throw new InvalidOperationException("Image could not be decoded");

            // Never upscale: small originals are only re-encoded.
            var targetWidth = Math.Min(width, source.Width);
            var targetHeight = Math.Max(1, (int)Math.Round(source.Height * (targetWidth / (double)source.Width)));

            using var resized = targetWidth == source.Width
                ? source.Copy()
                : source.Resize(
                    new SKImageInfo(targetWidth, targetHeight, source.ColorType, source.AlphaType),
                    new SKSamplingOptions(SKCubicResampler.Mitchell));
            using var image = SKImage.FromBitmap(resized);
            using var data = image.Encode(SKEncodedImageFormat.Webp, 80)
                ?? throw new InvalidOperationException("WebP encoding failed");
            return data.ToArray();
        }

        /// <summary>Removes every cached variant of an uploaded image.</summary>
        public void DeleteVariants(string fileName)
        {
            if (!Directory.Exists(_cacheRoot))
            {
                return;
            }

            var prefix = $"{Path.GetFileNameWithoutExtension(Path.GetFileName(fileName))}-";
            foreach (var file in Directory.EnumerateFiles(_cacheRoot, $"{prefix}*.webp"))
            {
                File.Delete(file);
            }
        }
    }
}
