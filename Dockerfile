FROM ubuntu:latest
COPY ${INPUT_GITBOOK_INPUT} /workspace
WORKDIR /workspace/${INPUT_GITBOOK_INPUT}
VOLUME [ "/${INPUT_GITBOOK_INPUT}" ]
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
RUN sudo apt update
RUN sudo apt install nodejs
RUN apt-get install -y npm
RUN apt-get install -y git
RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN apt-get clean && apt-get update
RUN apt-get install -y calibre
RUN gitbook build
RUN gitbook pdf
RUN gitbook epub
RUN gitbook mobi