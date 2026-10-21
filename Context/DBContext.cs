using Microsoft.EntityFrameworkCore;
using portfolio_api.Entities;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public DbSet<Language> Languages { get; set; }
    public DbSet<Page> Pages { get; set; }
    public DbSet<Section> Sections { get; set; }
    public DbSet<Global> Globals { get; set; }
    public DbSet<Technologies> Technologies { get; set; }
    public DbSet<ProfessionalExperience> ProfessionalExperiences { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        var professionalExperience = modelBuilder.Entity<ProfessionalExperience>();
        professionalExperience.Property(item => item.startDate).HasColumnName("start_date");
        professionalExperience.Property(item => item.createdAt)
            .HasColumnName("created_at")
            .HasDefaultValueSql("CURRENT_TIMESTAMP");
        professionalExperience.Property(item => item.updatedAt)
            .HasColumnName("updated_at")
            .HasDefaultValueSql("CURRENT_TIMESTAMP");
        professionalExperience.ToTable(table =>
        {
            table.HasCheckConstraint("CK_ProfessionalExperiences_SingleRecord", "id = 1");
            table.HasCheckConstraint(
                "CK_ProfessionalExperiences_StartDate_NotFuture",
                "start_date <= CURRENT_DATE");
        });
    }
}
