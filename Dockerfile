# Use the official Node.js 18 image as the base
FROM node:18.12.1

# Import the MongoDB public GPG key
RUN apt-get update && \
    apt-get install -y gnupg && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -

# Add the MongoDB repository
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Install MongoDB
RUN apt-get update && \
    apt-get install -y mongodb-org

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any additional dependencies here if needed

# Set the working directory
WORKDIR /app

# Copy the application code to the working directory
COPY . .

# Expose ports for Node.js (change this if your app uses a different port)
EXPOSE 3000 27017

# Start MongoDB service
RUN /etc/init.d/mongodb start

# Start MongoDB and run the Node.js application
CMD mongod --fork --logpath /var/log/mongodb.log && \
    npm install && \
    npm start
