# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
# Choose the Server and Node Version
FROM node:20-alpine

# Create and change to the app directory.
RUN mkdir -p /usr/src/myapp
WORKDIR /usr/src/myapp

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# Copy the local source code from the folder to the container
COPY . .

#ENVIRONMENTS
ENV PORT=8002

# Install production dependencies.
RUN yarn install

# Build the production Version of the Application
RUN yarn build

# Expose the Port Outside the container to the localhost
EXPOSE 8002

# Run Command after building the container
CMD [ "yarn", "run", "dev" ]  # Use CMD for running the app