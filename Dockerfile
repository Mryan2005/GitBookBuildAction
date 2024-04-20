FROM node:10.15.3
COPY ${INPUT_GITBOOK_INPUT} /workspace
WORKDIR /workspace/${INPUT_GITBOOK_INPUT}

RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN gitbook build
COPY /workspace/${INPUT_GITBOOK_INPUT} ./output