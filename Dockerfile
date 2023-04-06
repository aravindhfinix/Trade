# Use the official Node.js base image
FROM node:18.15.0

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Expose the desired ports for your Node.js and MongoDB applications
EXPOSE 5000 27017

# Copy the rest of the application code to the working directory
COPY . .

# Start MongoDB service
CMD npm start
