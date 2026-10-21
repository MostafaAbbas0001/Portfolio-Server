using System.ComponentModel.DataAnnotations;

namespace portfolio_api.DTO.Requests
{
    public class UpdateProfessionalExperienceRequestModel
    {
        [Required]
        public DateOnly? StartDate { get; set; }
    }
}
