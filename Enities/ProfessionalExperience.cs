namespace portfolio_api.Entities
{
    public class ProfessionalExperience
    {
        public int id { get; set; }
        public DateOnly startDate { get; set; }
        public DateTime createdAt { get; set; }
        public DateTime updatedAt { get; set; }
    }
}
