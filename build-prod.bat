@echo off
echo Building Angular Spotify for Production...
echo This will take 10-15 minutes (installing, building, and creating nginx image)
echo.
docker build -t angular-spotify:prod .
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Production build successful!
    echo.
    echo To run the container:
    echo   docker run -d -p 8080:80 --name angular-spotify-prod angular-spotify:prod
    echo.
    echo Then access at: http://localhost:8080
) else (
    echo.
    echo Build failed. Check errors above.
    exit /b 1
)
