# Docker Setup Script for HTML/CSS Project
# Run this script in PowerShell to build and deploy your Docker container

# Check if Docker is running
try {
    $dockerInfo = docker info 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Docker daemon is not running." -ForegroundColor Red
        Write-Host "Please start Docker Desktop and try again." -ForegroundColor Yellow
        exit 1
    }
} catch {
    Write-Host "ERROR: Docker is not installed or not accessible." -ForegroundColor Red
    exit 1
}

Write-Host "Docker is running. Building image..." -ForegroundColor Green

# Build the Docker image
docker build -t anjara1204/kotrana:latest .

if ($LASTEXITCODE -eq 0) {
    Write-Host "Image built successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "To run the container, use one of these options:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Option 1 - Using docker-compose (recommended):" -ForegroundColor Yellow
    Write-Host "  docker-compose up -d"
    Write-Host ""
    Write-Host "Option 2 - Using docker run:" -ForegroundColor Yellow
    Write-Host "  docker run -d -p 8080:80 --name kotrana-container anjara1204/kotrana:latest"
    Write-Host ""
    Write-Host "Your site will be available at: http://localhost:8080" -ForegroundColor Green
} else {
    Write-Host "ERROR: Build failed." -ForegroundColor Red
}

# Optional: Push to Docker Hub
# docker push anjara1204/kotrana:latest