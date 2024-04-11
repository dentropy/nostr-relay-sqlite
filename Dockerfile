# Building layer
FROM node:18-alpine as build

WORKDIR /app

# Copy configuration files
COPY tsconfig*.json ./
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN npm run build

# Set environment variables
ARG GIT_COMMIT_SHA
ENV GIT_COMMIT_SHA $GIT_COMMIT_SHA
