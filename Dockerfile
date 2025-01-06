# Use Node.js 16.18.0 as the base image
FROM node:16.18.0 AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli@15.1.6

# Install project dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Angular project
RUN ng build --prod

# Serve the app using a simple HTTP server
RUN npm install -g http-server
CMD ["http-server", "dist/"]

# Expose the port the app will run on
EXPOSE 8080
