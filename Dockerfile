# Use an official Node.js runtime as a parent image
FROM node:18.12.1

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the application will run
EXPOSE 4000

# Start the application
CMD ["npm", "start"]