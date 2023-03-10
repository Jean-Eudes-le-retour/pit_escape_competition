FROM cyberbotics/webots.cloud:R2023a-ubuntu20.04

# Copy all the competition files into a project folder
# in webots.yml this folder is referenced in the "dockerCompose" field to be used by the theia IDE when testing the competition online
RUN mkdir -p /usr/local/webots-project
WORKDIR /usr/local/webots-project
COPY . .

# The world file path is extracted from webots.yml and is given by the build-arg:
ARG WORLD_PATH
ENV WORLD_PATH=${WORLD_PATH}

# Compile supervisor controller
RUN make

# If called with no arguments, launch in headless mode
# (for instance, on the simulation server of webots.cloud, the GUI is launched to stream it to the user and a different command is used)
# - Launching Webots in shell mode to be able to read stdout from competition_record_action script
CMD xvfb-run -e /dev/stdout -a webots --stdout --stderr --batch --mode=fast --no-rendering ${WORLD_PATH}
