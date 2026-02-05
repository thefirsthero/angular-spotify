# Build and Run Scripts for Angular Spotify Docker

## Quick Start

### For Development (with hot reload):
```powershell
docker-compose up angular-spotify-dev --build
```

### For Production (nginx):
```powershell
docker-compose up angular-spotify-prod --build --profile prod
```

### Or use docker directly:
```powershell
# Development
docker build -t angular-spotify:dev -f Dockerfile.dev .
docker run -p 4200:4200 -v ${PWD}:/app -v /app/node_modules angular-spotify:dev

# Production
docker build -t angular-spotify:prod -f Dockerfile .
docker run -p 8080:80 angular-spotify:prod
```

## Access the app:
- Development: http://localhost:4200
- Production: http://localhost:8080

## Notes:
- The build will take 5-10 minutes on first run (installing node_modules)
- Make sure Docker Desktop is running
- The app requires Spotify Premium to play music (but browsing works with free accounts)

## For Coolify Deployment:
Use the production Dockerfile. Coolify will automatically:
1. Build the Docker image
2. Deploy it to your VPS
3. Handle environment variables and networking

You can push this repository to GitHub and connect it to Coolify for automatic deployments.
