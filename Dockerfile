# FROM node:slim

# WORKDIR /app
# COPY . .

# RUN npm ci

# ARG PORT
# EXPOSE ${PORT:-3000}

# CMD ["npm", "run", "start"]
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies with verbose logging
RUN echo "Installing dependencies..." && \
    npm ci --only=production --verbose && \
    echo "Dependencies installed successfully"

# Copy application code
COPY . .

# Create a healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:${PORT:-3000}/health || exit 1

# Expose port
ARG PORT=3000
EXPOSE ${PORT}

# Add startup logging
CMD echo "Starting server on port ${PORT:-3000}..." && npm start
