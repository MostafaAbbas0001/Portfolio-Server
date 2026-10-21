using Microsoft.EntityFrameworkCore;
using portfolio_api.DTO.Models;
using portfolio_api.DTO.Responses;
using System.Text.Json;
using portfolio_api.DTO.Requests;
using System.Text.Json.Nodes;
using System.Text.RegularExpressions;

namespace portfolio_api.Services
{
    public class DataService
    {
        private readonly AppDbContext _db;

        public DataService(AppDbContext db)
        {
            _db = db;
        }

        public async Task<ProfessionalExperienceResponseModel?> GetProfessionalExperienceAsync()
        {
            return await _db.ProfessionalExperiences
                .AsNoTracking()
                .Where(item => item.id == 1)
                .Select(item => new ProfessionalExperienceResponseModel
                {
                    StartDate = item.startDate
                })
                .SingleOrDefaultAsync();
        }

        public async Task<ProfessionalExperienceResponseModel> UpdateProfessionalExperienceAsync(DateOnly startDate)
        {
            var record = await _db.ProfessionalExperiences.SingleOrDefaultAsync(item => item.id == 1);
            if (record == null)
            {
                record = new portfolio_api.Entities.ProfessionalExperience
                {
                    id = 1,
                    createdAt = DateTime.UtcNow
                };
                _db.ProfessionalExperiences.Add(record);
            }

            record.startDate = startDate;
            record.updatedAt = DateTime.UtcNow;
            await _db.SaveChangesAsync();
            return new ProfessionalExperienceResponseModel { StartDate = record.startDate };
        }

        public async Task<PageResponseModel> GetPageDataAsync(string languageCode, string pageKey)
        {
            var language = await _db.Languages
                .AsNoTracking()
                .FirstOrDefaultAsync(l => l.code == languageCode);

            if (language == null)
            {
                throw new InvalidOperationException("Language not found");
            }

            var page = await _db.Pages
                .AsNoTracking()
                .FirstOrDefaultAsync(p => p.languageId == language.id && p.key == pageKey);

            if (page == null)
            {
                throw new InvalidOperationException("Page not found");
            }

            var sections = await _db.Sections
                .AsNoTracking()
                .Where(s => s.pageId == page.id)
                .OrderBy(s => s.id)
                .ToListAsync();

            return new PageResponseModel
            {
                Language = new LanguageSummaryModel
                {
                    Id = language.id,
                    Name = language.name,
                    Code = language.code,
                    Direction = language.direction,
                    Flag = language.flag,
                    IsDefault = language.isDefault
                },
                Data = new PageContentModel
                {
                    Id = page.id,
                    Key = page.key,
                    Slug = page.slug,
                    Content = page.content,
                    SeoData = page.seoData,
                    Sections = sections.Select(section => new SectionContentModel
                    {
                        Id = section.id,
                        PageId = section.pageId,
                        Key = section.key,
                        Content = section.content
                    }).ToList()
                }
            };
        }

        public async Task<GlobalResponseModel> GetGlobalDataAsync(string languageCode)
        {
            var language = await _db.Languages
                .AsNoTracking()
                .FirstOrDefaultAsync(l => l.code == languageCode);

            if (language == null)
            {
                throw new InvalidOperationException("Language not found");
            }

            var globalData = await _db.Globals
                .AsNoTracking()
                .Where(g => g.languageId == language.id)
                .OrderBy(g => g.id)
                .ToListAsync();

            return new GlobalResponseModel
            {
                Language = new LanguageSummaryModel
                {
                    Id = language.id,
                    Name = language.name,
                    Code = language.code,
                    Direction = language.direction,
                    Flag = language.flag,
                    IsDefault = language.isDefault
                },
                Data = globalData.Select(global => new GlobalContentModel
                {
                    Id = global.id,
                    Key = global.key,
                    Content = global.content
                }).ToList()
            };
        }

        public async Task<List<TechnologyContentModel>> GetTechnologiesAsync()
        {
            return await _db.Technologies
                .AsNoTracking()
                .OrderBy(technology => technology.name)
                .Select(technology => new TechnologyContentModel
                {
                    Id = technology.id,
                    Key = technology.key,
                    Name = technology.name,
                    ImageUrl = technology.imageUrl
                })
                .ToListAsync();
        }

        public async Task<TechnologyContentModel> CreateTechnologyAsync(
            UpsertTechnologyRequestModel request)
        {
            var normalized = NormalizeTechnologyRequest(request);
            if (await _db.Technologies.AnyAsync(technology => technology.key == normalized.Key))
            {
                throw new InvalidOperationException("Technology key already exists");
            }

            var technology = new portfolio_api.Entities.Technologies
            {
                key = normalized.Key,
                name = normalized.Name,
                imageUrl = normalized.ImageUrl
            };
            _db.Technologies.Add(technology);
            await _db.SaveChangesAsync();
            return ToTechnologyContentModel(technology);
        }

        public async Task<TechnologyContentModel> UpdateTechnologyAsync(
            int id,
            UpsertTechnologyRequestModel request)
        {
            var technology = await _db.Technologies.FirstOrDefaultAsync(item => item.id == id);
            if (technology == null) throw new InvalidOperationException("Technology not found");

            var normalized = NormalizeTechnologyRequest(request);
            if (await _db.Technologies.AnyAsync(item =>
                    item.id != id && item.key == normalized.Key))
            {
                throw new InvalidOperationException("Technology key already exists");
            }

            if (!string.Equals(technology.key, normalized.Key, StringComparison.OrdinalIgnoreCase) &&
                await IsTechnologyReferencedAsync(technology.key))
            {
                throw new InvalidOperationException(
                    "This technology key is referenced by content. Update those references first.");
            }

            technology.key = normalized.Key;
            technology.name = normalized.Name;
            technology.imageUrl = normalized.ImageUrl;
            await _db.SaveChangesAsync();
            return ToTechnologyContentModel(technology);
        }

        public async Task DeleteTechnologyAsync(int id)
        {
            var technology = await _db.Technologies.FirstOrDefaultAsync(item => item.id == id);
            if (technology == null) throw new InvalidOperationException("Technology not found");
            if (await IsTechnologyReferencedAsync(technology.key))
            {
                throw new InvalidOperationException(
                    "This technology is still referenced by page or global content.");
            }

            _db.Technologies.Remove(technology);
            await _db.SaveChangesAsync();
        }

        private static UpsertTechnologyRequestModel NormalizeTechnologyRequest(
            UpsertTechnologyRequestModel request)
        {
            var key = request.Key?.Trim().ToLowerInvariant() ?? "";
            var name = request.Name?.Trim() ?? "";
            if (!Regex.IsMatch(key, "^[a-z0-9]+(?:-[a-z0-9]+)*$"))
            {
                throw new InvalidOperationException(
                    "Technology key must contain lowercase letters, numbers, and single hyphens.");
            }
            if (string.IsNullOrWhiteSpace(name))
            {
                throw new InvalidOperationException("Technology name is required");
            }

            return new UpsertTechnologyRequestModel
            {
                Key = key,
                Name = name,
                ImageUrl = string.IsNullOrWhiteSpace(request.ImageUrl) ? null : request.ImageUrl.Trim()
            };
        }

        private async Task<bool> IsTechnologyReferencedAsync(string key)
        {
            var sectionContents = await _db.Sections
                .AsNoTracking()
                .Where(section => section.content != null)
                .Select(section => section.content!)
                .ToListAsync();
            var globalContents = await _db.Globals
                .AsNoTracking()
                .Where(global => global.content != null)
                .Select(global => global.content!)
                .ToListAsync();

            return sectionContents.Concat(globalContents).Any(content =>
                ContainsTechnologyKey(JsonNode.Parse(content), key));
        }

        private static bool ContainsTechnologyKey(JsonNode? node, string key)
        {
            if (node is JsonObject jsonObject)
            {
                foreach (var propertyName in new[] { "technologyKeys", "heroTechnologyKeys" })
                {
                    if (jsonObject[propertyName] is JsonArray keys && keys.Any(item =>
                            item is JsonValue value &&
                            value.TryGetValue<string>(out var candidate) &&
                            string.Equals(candidate, key, StringComparison.OrdinalIgnoreCase)))
                    {
                        return true;
                    }
                }

                return jsonObject.Any(child => ContainsTechnologyKey(child.Value, key));
            }

            return node is JsonArray array && array.Any(child => ContainsTechnologyKey(child, key));
        }

        private static TechnologyContentModel ToTechnologyContentModel(
            portfolio_api.Entities.Technologies technology)
        {
            return new TechnologyContentModel
            {
                Id = technology.id,
                Key = technology.key,
                Name = technology.name,
                ImageUrl = technology.imageUrl
            };
        }

        public async Task UpdatePageDataAsync(string languageCode, int pageId, UpdatePageRequestModel request)
        {
            var language = await _db.Languages
                .FirstOrDefaultAsync(l => l.code == languageCode);

            if (language == null)
            {
                throw new InvalidOperationException("Language not found");
            }

            var page = await _db.Pages
                .FirstOrDefaultAsync(p => p.languageId == language.id && p.id == pageId);

            if (page == null)
            {
                throw new InvalidOperationException("Page not found");
            }

            if (request.Content.HasValue)
            {
                await ValidateTechnologyReferencesAsync(request.Content.Value);
                page.content = SerializeStoredContent(request.Content.Value);
            }

            if (request.SeoData.HasValue)
            {
                page.seoData = JsonSerializer.Serialize(request.SeoData.Value);
            }

            if (request.Sections is { Count: > 0 })
            {
                var sectionIds = request.Sections.Select(section => section.Id).ToList();
                var sections = await _db.Sections
                    .Where(section => section.pageId == page.id && sectionIds.Contains(section.id))
                    .ToDictionaryAsync(section => section.id);

                if (sections.Count != sectionIds.Distinct().Count())
                {
                    throw new InvalidOperationException("One or more sections do not belong to this page");
                }

                foreach (var sectionRequest in request.Sections)
                {
                    await ValidateTechnologyReferencesAsync(sectionRequest.Content);
                    sections[sectionRequest.Id].content = SerializeStoredContent(sectionRequest.Content);
                }
            }

            await _db.SaveChangesAsync();
        }

        public async Task UpdateGlobalDataAsync(string languageCode, string globalKey, UpdateGlobalRequestModel request)
        {
            var language = await _db.Languages
                .FirstOrDefaultAsync(l => l.code == languageCode);

            if (language == null)
            {
                throw new InvalidOperationException("Language not found");
            }

            var globalData = await _db.Globals
                .FirstOrDefaultAsync(g => g.languageId == language.id && g.key == globalKey);

            if (globalData == null)
            {
                throw new InvalidOperationException("Global data not found");
            }

            if (request.Content.HasValue)
            {
                await ValidateTechnologyReferencesAsync(request.Content.Value);
                globalData.content = SerializeStoredContent(request.Content.Value);
            }

            await _db.SaveChangesAsync();
        }

        private async Task<Dictionary<int, TechnologyContentModel>> GetTechnologyLookupAsync()
        {
            return await _db.Technologies
                .AsNoTracking()
                .OrderBy(technology => technology.id)
                .Select(technology => new TechnologyContentModel
                {
                    Id = technology.id,
                    Key = technology.key,
                    Name = technology.name,
                    ImageUrl = technology.imageUrl
                })
                .ToDictionaryAsync(technology => technology.Id);
        }

        private static string? ExpandTechnologyReferences(
            string? content,
            IReadOnlyDictionary<int, TechnologyContentModel> technologies)
        {
            if (string.IsNullOrWhiteSpace(content)) return content;

            var root = JsonNode.Parse(content);
            if (root == null) return content;

            ExpandTechnologyReferences(root, technologies);
            return root.ToJsonString();
        }

        private static void ExpandTechnologyReferences(
            JsonNode node,
            IReadOnlyDictionary<int, TechnologyContentModel> technologies)
        {
            if (node is JsonObject jsonObject)
            {
                AddExpandedTechnologies(jsonObject, "technologyIds", "technologies", technologies);
                AddExpandedTechnologiesByKey(
                    jsonObject,
                    "technologyKeys",
                    "technologies",
                    technologies);
                AddExpandedTechnologies(
                    jsonObject,
                    "heroTechnologyIds",
                    "heroTechnologies",
                    technologies);
                AddExpandedTechnologiesByKey(
                    jsonObject,
                    "heroTechnologyKeys",
                    "heroTechnologies",
                    technologies);

                foreach (var child in jsonObject.ToList())
                {
                    if (child.Value != null) ExpandTechnologyReferences(child.Value, technologies);
                }
            }
            else if (node is JsonArray jsonArray)
            {
                foreach (var child in jsonArray)
                {
                    if (child != null) ExpandTechnologyReferences(child, technologies);
                }
            }
        }

        private static void AddExpandedTechnologies(
            JsonObject jsonObject,
            string idProperty,
            string resultProperty,
            IReadOnlyDictionary<int, TechnologyContentModel> technologies)
        {
            if (jsonObject[idProperty] is not JsonArray technologyIds) return;

            var expanded = new JsonArray();
            foreach (var idNode in technologyIds)
            {
                if (idNode is not JsonValue idValue || !idValue.TryGetValue<int>(out var id))
                {
                    continue;
                }
                if (!technologies.TryGetValue(id, out var technology)) continue;

                expanded.Add(new JsonObject
                {
                    ["id"] = technology.Id,
                    ["key"] = technology.Key,
                    ["name"] = technology.Name,
                    ["imageUrl"] = technology.ImageUrl
                });
            }

            jsonObject[resultProperty] = expanded;
        }

        private static void AddExpandedTechnologiesByKey(
            JsonObject jsonObject,
            string keyProperty,
            string resultProperty,
            IReadOnlyDictionary<int, TechnologyContentModel> technologies)
        {
            if (jsonObject[keyProperty] is not JsonArray technologyKeys) return;

            var technologiesByKey = technologies.Values.ToDictionary(
                technology => technology.Key,
                StringComparer.OrdinalIgnoreCase);
            var expanded = new JsonArray();
            foreach (var keyNode in technologyKeys)
            {
                if (keyNode is not JsonValue keyValue || !keyValue.TryGetValue<string>(out var key))
                {
                    continue;
                }

                if (!technologiesByKey.TryGetValue(key, out var technology)) continue;
                expanded.Add(CreateTechnologyNode(technology));
            }

            jsonObject[resultProperty] = expanded;
        }

        private static JsonObject CreateTechnologyNode(TechnologyContentModel technology)
        {
            return new JsonObject
            {
                ["id"] = technology.Id,
                ["key"] = technology.Key,
                ["name"] = technology.Name,
                ["imageUrl"] = technology.ImageUrl
            };
        }

        private async Task ValidateTechnologyReferencesAsync(JsonElement content)
        {
            var referencedIds = new HashSet<int>();
            var referencedKeys = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            CollectTechnologyReferences(
                JsonNode.Parse(content.GetRawText()),
                referencedIds,
                referencedKeys);
            if (referencedIds.Count == 0 && referencedKeys.Count == 0) return;

            var existingIds = await _db.Technologies
                .AsNoTracking()
                .Where(technology => referencedIds.Contains(technology.id))
                .Select(technology => technology.id)
                .ToListAsync();

            var missingIds = referencedIds.Except(existingIds).OrderBy(id => id).ToList();
            if (missingIds.Count > 0)
            {
                throw new InvalidOperationException(
                    $"Unknown technology IDs: {string.Join(", ", missingIds)}");
            }

            var existingKeys = await _db.Technologies
                .AsNoTracking()
                .Where(technology => referencedKeys.Contains(technology.key))
                .Select(technology => technology.key)
                .ToListAsync();
            var missingKeys = referencedKeys
                .Except(existingKeys, StringComparer.OrdinalIgnoreCase)
                .OrderBy(key => key)
                .ToList();
            if (missingKeys.Count > 0)
            {
                throw new InvalidOperationException(
                    $"Unknown technology keys: {string.Join(", ", missingKeys)}");
            }
        }

        private static void CollectTechnologyReferences(
            JsonNode? node,
            ISet<int> ids,
            ISet<string> keys)
        {
            if (node is JsonObject jsonObject)
            {
                foreach (var propertyName in new[] { "technologyIds", "heroTechnologyIds" })
                {
                    if (jsonObject[propertyName] is not JsonArray technologyIds) continue;
                    foreach (var idNode in technologyIds)
                    {
                        if (idNode is JsonValue idValue && idValue.TryGetValue<int>(out var id))
                        {
                            ids.Add(id);
                        }
                    }
                }

                foreach (var propertyName in new[] { "technologyKeys", "heroTechnologyKeys" })
                {
                    if (jsonObject[propertyName] is not JsonArray technologyKeys) continue;
                    foreach (var keyNode in technologyKeys)
                    {
                        if (keyNode is JsonValue keyValue &&
                            keyValue.TryGetValue<string>(out var key) &&
                            !string.IsNullOrWhiteSpace(key))
                        {
                            keys.Add(key);
                        }
                    }
                }

                foreach (var child in jsonObject)
                {
                    CollectTechnologyReferences(child.Value, ids, keys);
                }
            }
            else if (node is JsonArray jsonArray)
            {
                foreach (var child in jsonArray) CollectTechnologyReferences(child, ids, keys);
            }
        }

        private static string SerializeStoredContent(JsonElement content)
        {
            var root = JsonNode.Parse(content.GetRawText());
            if (root == null) return content.GetRawText();

            RemoveExpandedTechnologies(root);
            return root.ToJsonString();
        }

        private static void RemoveExpandedTechnologies(JsonNode node)
        {
            if (node is JsonObject jsonObject)
            {
                if (jsonObject.ContainsKey("technologyIds")) jsonObject.Remove("technologies");
                if (jsonObject.ContainsKey("technologyKeys")) jsonObject.Remove("technologies");
                if (jsonObject.ContainsKey("heroTechnologyIds"))
                {
                    jsonObject.Remove("heroTechnologies");
                }
                if (jsonObject.ContainsKey("heroTechnologyKeys"))
                {
                    jsonObject.Remove("heroTechnologies");
                }

                foreach (var child in jsonObject.ToList())
                {
                    if (child.Value != null) RemoveExpandedTechnologies(child.Value);
                }
            }
            else if (node is JsonArray jsonArray)
            {
                foreach (var child in jsonArray)
                {
                    if (child != null) RemoveExpandedTechnologies(child);
                }
            }
        }
    }
}
