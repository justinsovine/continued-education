FROM node:latest

WORKDIR /home/server

RUN npm install -g json-server

COPY db.json /home/server/db.json

# This expects a port number and gives our container the ability to map a port from our host machine into the Docker container at the port specified.
EXPOSE 3000

# ENTRYPOINT is the main command ran by the docker container. This is what the entire container is built for, and basically it's sole purpose. It cannot be overwritten by CMD on the host machine, instead commands are added to it.

# The shell form
#ENTRYPOINT  /bin/sh -c json-server db.json 

# The exec form
# Notes: 0.0.0.0 is the default Docker bridge network IP, essentially connecting our host machine to the Docker instance
ENTRYPOINT  ["json-server", "db.json", "--host", "0.0.0.0"]

# Additional commands or options run after the initial ENTRYPOINT command
#CMD 

# The actual command (local_port:docker_port)
#docker run --rm -p 3000:3000 047287bb9e61