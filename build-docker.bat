@echo off
echo Building Angular Spotify Docker Image...
echo This will take 5-10 minutes (installing dependencies and building)
echo.
docker build -t angular-spotify:dev -f Dockerfile.dev .
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Build successful!
    echo.
    echo To run the container:
    echo   docker run -d -p 4200:4200 --name angular-spotify-dev angular-spotify:dev
    echo.
    echo Then access at: http://localhost:4200
) else (
    echo.
    echo Build failed. Check errors above.
    exit /b 1
)
