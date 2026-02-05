# Run Angular Spotify in Docker
# Make sure you've built the image first with build-docker.ps1

Write-Host "Starting Angular Spotify..." -ForegroundColor Green

# Stop and remove existing container if it exists
docker stop angular-spotify-dev 2>$null
docker rm angular-spotify-dev 2>$null

# Run the container
Write-Host "Starting container on port 4200..." -ForegroundColor Cyan
docker run -d -p 4200:4200 --name angular-spotify-dev angular-spotify:dev

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Angular Spotify is running!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Access the app at: http://localhost:4200" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To view logs:" -ForegroundColor Yellow
    Write-Host "  docker logs -f angular-spotify-dev" -ForegroundColor White
    Write-Host ""
    Write-Host "To stop:" -ForegroundColor Yellow
    Write-Host "  docker stop angular-spotify-dev" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "Failed to start container." -ForegroundColor Red
    exit 1
}
