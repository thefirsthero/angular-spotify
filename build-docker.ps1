# Build Angular Spotify Docker Image
# This script builds the Docker image and can take 5-10 minutes

Write-Host "Building Angular Spotify Docker Image..." -ForegroundColor Green
Write-Host "This will take 5-10 minutes for first build (installing dependencies)..." -ForegroundColor Yellow
Write-Host ""

# Build development image
Write-Host "Building development image..." -ForegroundColor Cyan
docker build -t angular-spotify:dev -f Dockerfile.dev .

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Development image built successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "To run the development server:" -ForegroundColor Cyan
    Write-Host "  docker run -d -p 4200:4200 --name angular-spotify-dev angular-spotify:dev" -ForegroundColor White
    Write-Host ""
    Write-Host "Then access the app at: http://localhost:4200" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Build failed. Check the error messages above." -ForegroundColor Red
    exit 1
}
