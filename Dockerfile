# Use an official Node.js image as the base image
FROM node:14


WORKDIR /app


COPY package*.json ./

RUN npm install

COPY . .

# Build the React application
RUN npm run build

# Install serve globally to serve the production build
RUN npm install -g serve

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the application
CMD ["serve", "-s", "build"]
