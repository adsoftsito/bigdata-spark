# we use debian
FROM debian:bullseye

# refresh apt-get
RUN apt-get update

# install some utilities
RUN apt-get install -y curl make g++

# install node, npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# install dependencies
ADD package.json /package.json
RUN npm install

# set /src as the working directory for this container
WORKDIR /src

# open up external access to port 8082
EXPOSE 8082

# RUN startup command
CMD ["node", "/src/server.js"]
