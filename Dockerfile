# Stage 1: build the application
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy only the project file first so Docker can cache package restore
COPY portfolio-api.csproj ./
RUN dotnet restore

# Copy the rest of the server code
COPY . ./

# Compile and publish the app into /app/publish
RUN dotnet publish -c Release -o /app/publish --no-restore


# Stage 2: run the application
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app

# ASP.NET listens on port 8080 inside the container
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production

COPY --from=build /app/publish ./

# The API serves static files from /app/Uploads. Create it even when no files
# are copied into the container, otherwise startup fails.
RUN mkdir -p /app/Uploads/images /app/Uploads/resume /app/Uploads/.cache/images

EXPOSE 8080

ENTRYPOINT ["dotnet", "portfolio-api.dll"]
