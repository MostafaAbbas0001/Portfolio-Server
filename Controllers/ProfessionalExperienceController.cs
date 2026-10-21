using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using portfolio_api.DTO.Requests;
using portfolio_api.DTO.Responses;
using portfolio_api.Services;

namespace portfolio_api.Controllers
{
    [ApiController]
    [Route("api/professional-experience")]
    public class ProfessionalExperienceController : ControllerBase
    {
        private readonly DataService _dataService;

        public ProfessionalExperienceController(DataService dataService)
        {
            _dataService = dataService;
        }

        [HttpGet]
        public async Task<ActionResult<ProfessionalExperienceResponseModel>> Get()
        {
            var professionalExperience = await _dataService.GetProfessionalExperienceAsync();

            if (professionalExperience == null)
            {
                return NotFound();
            }

            return Ok(professionalExperience);
        }

        [Authorize]
        [HttpPatch]
        public async Task<ActionResult<ProfessionalExperienceResponseModel>> Update(
            UpdateProfessionalExperienceRequestModel request)
        {
            if (request.StartDate is not DateOnly startDate ||
                startDate > DateOnly.FromDateTime(DateTime.UtcNow))
            {
                return BadRequest("Choose a valid start date that is not in the future.");
            }

            return Ok(await _dataService.UpdateProfessionalExperienceAsync(startDate));
        }
    }
}
