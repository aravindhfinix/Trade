# Use the official Node.js base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Install MongoDB
RUN apt-get update && apt-get install -y gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update && apt-get install -y mongodb-org

# Expose the desired ports for your Node.js and MongoDB applications
EXPOSE 3000 27017

# Copy the rest of the application code to the working directory
COPY . .

# Start MongoDB service
CMD ["mongod", "--fork", "--logpath", "/var/log/mongodb.log", "--bind_ip", "0.0.0.0", "--port", "27017"] && \
    npm start
