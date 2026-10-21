using DotNetEnv;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using portfolio_api.Auth;
using portfolio_api.Services;


Env.Load();

var builder = WebApplication.CreateBuilder(args);

builder.Logging.ClearProviders();
builder.Logging.AddConsole();

if (builder.Environment.IsDevelopment())
{
    builder.Services.AddDataProtection().UseEphemeralDataProtectionProvider();
}

var connectionString = Environment.GetEnvironmentVariable("DATABASE_URL");
var allowedOrigins = Environment
    .GetEnvironmentVariable("CORS_ORIGINS")?
    .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
    ?? Array.Empty<string>();

builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(connectionString));

builder.Services.AddScoped<DataService>(); 
builder.Services.AddScoped<SiteMediaService>();
builder.Services.AddSingleton<ImageVariantService>();
builder.Services.AddSingleton<AuthTokenService>();

builder.Services
    .AddAuthentication(AuthConstants.Scheme)
    .AddScheme<AuthenticationSchemeOptions, PortfolioAuthHandler>(AuthConstants.Scheme, null);
builder.Services.AddAuthorization();

builder.Services.AddCors(options =>
{
    options.AddPolicy("ClientOrigins", policy =>
    {
        policy
            .WithOrigins(allowedOrigins)
            .AllowAnyHeader()
            .AllowAnyMethod();
    });
});

// Swagger configuration
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddControllers();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors("ClientOrigins");
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(Path.Combine(builder.Environment.ContentRootPath, "Uploads")),
    RequestPath = "/Uploads",
    // Uploaded images are named by GUID, so a week of browser caching is safe.
    OnPrepareResponse = context =>
        context.Context.Response.Headers.CacheControl = "public, max-age=604800"
});
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
