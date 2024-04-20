FROM ubuntu:latest
COPY ${INPUT_GITBOOK_INPUT} /workspace
WORKDIR /workspace/${INPUT_GITBOOK_INPUT}
VOLUME [ "/${INPUT_GITBOOK_INPUT}" ]
RUN apt-get update
RUN apt-get install -y curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
RUN nvm install 10.21.0
RUN nvm use 10.21.0
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