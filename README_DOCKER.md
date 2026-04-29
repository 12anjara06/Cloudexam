# Docker Setup for HTML/CSS Project

## Files Created

- **Dockerfile** - Defines the nginx:alpine container to serve static files
- **docker-compose.yml** - Container orchestration configuration
- **nginx.conf** - Nginx configuration with caching and security headers
- **.dockerignore** - Excludes unnecessary files from build context
- **docker-setup.ps1** - PowerShell script for easy setup on Windows

## Prerequisites

1. Docker Desktop must be installed and running
2. Docker daemon must be active (check system tray icon)

## Quick Start (Windows PowerShell)

Run the setup script:
```powershell
.\docker-setup.ps1
```

Then start the container:
```powershell
docker-compose up -d
```

Access your site at: http://localhost:8080

## Manual Commands

### Build the image:
```bash
docker build -t anjara1204/kotrana:latest .
```

### Run with docker-compose:
```bash
docker-compose up -d
```

### Run with docker run:
```bash
docker run -d -p 8080:80 --name kotrana-container anjara1204/kotrana:latest
```

### Stop the container:
```bash
docker-compose down
# or
docker stop kotrana-container && docker rm kotrana-container
```

### Push to Docker Hub:
```bash
docker push anjara1204/kotrana:latest
```

## Troubleshooting

### Docker daemon not running
- Start Docker Desktop from Start Menu
- Wait for the whale icon to appear in system tray
- Ensure it shows "Docker Desktop is running"

### PowerShell execution policy
If you get script execution errors, run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Port already in use
Change the port mapping in docker-compose.yml:
```yaml
ports:
  - "8081:80"  # Use a different port
```

## Project Structure

```
.
├── index.html          # Main HTML file
├── style.css           # CSS styles
├── assets/             # Image assets
├── Dockerfile          # Docker image definition
├── docker-compose.yml  # Container orchestration
├── nginx.conf          # Nginx configuration
├── .dockerignore       # Build exclusions
└── docker-setup.ps1    # Windows setup script