# Stage 1: Build stage
FROM node:18-alpine AS builder

WORKDIR /app

# Disable husky hooks during CI/Docker builds
ENV HUSKY=0

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies (skip scripts to avoid husky install in CI)
RUN yarn install --frozen-lockfile --ignore-scripts

# Copy source code
COPY . .

# Build the Angular app
RUN yarn build:prod angular-spotify

# Stage 2: Runtime stage
FROM nginx:alpine

# Install envsubst for runtime env injection
RUN apk add --no-cache gettext

# Copy built app from builder
COPY --from=builder /app/dist/apps/angular-spotify /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port
EXPOSE 4200

# Health check
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=5 \
  CMD wget --quiet --tries=1 --spider http://127.0.0.1:4200/health || exit 1

CMD ["/bin/sh", "-c", "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && nginx -g 'daemon off;'"]
