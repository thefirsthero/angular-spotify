# Multi-stage build for Angular Spotify app

# Stage 1: Build the Angular application
# Using slim instead of alpine for Nx compatibility
FROM node:18-slim AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (production only, skip Cypress)
ENV CYPRESS_INSTALL_BINARY=0
RUN npm install --legacy-peer-deps --production=false --omit=optional

# Copy all source files
COPY . .

# Build the Angular app for production
RUN npm run build:prod

# Stage 2: Serve the app with nginx
FROM nginx:alpine

# Copy custom nginx configuration
COPY --from=builder /app/nginx.conf /etc/nginx/nginx.conf

# Copy built app from builder stage
COPY --from=builder /app/dist/apps/angular-spotify /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
