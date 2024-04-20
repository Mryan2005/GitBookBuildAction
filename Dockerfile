FROM node:10.15.3
COPY ${INPUT_GITBOOK_INPUT} /workspace
WORKDIR /workspace/${INPUT_GITBOOK_INPUT}
VOLUME [ "/${INPUT_GITBOOK_INPUT}" ]
RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN apt-get update
RUN apt-get install -y calibre
RUN gitbook build
RUN gitbook pdf
RUN gitbook epub
RUN gitbook mobi