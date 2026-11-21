# Stage 1: Build the static website with Node.js and Parcel.
FROM node:22-alpine AS builder

# Set the working directory inside the builder container.
WORKDIR /app

# Copy dependency manifests first to make Docker layer caching effective.
COPY package*.json ./

# Install exactly the dependencies recorded in package-lock.json.
RUN npm ci

# Copy website source files and the shared stylesheet.
COPY src/ ./src/
COPY styles/ ./styles/

# Build all five HTML pages into the dist/ directory.
RUN npm run build

# Stage 2: Serve only the generated static files with lightweight Nginx.
FROM nginx:1.27-alpine

# Copy the production build from the builder stage into Nginx's web root.
COPY --from=builder /app/dist /usr/share/nginx/html

# Document that Nginx listens on port 80.
EXPOSE 80

# Keep Nginx running in the foreground as the container's main process.
CMD ["nginx", "-g", "daemon off;"]
