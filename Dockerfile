FROM node:10.15.3
COPY ${INPUT_GITBOOK_INPUT} /workspace
WORKDIR /workspace

RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN ls ${INPUT_GITBOOK_INPUT}

ENTRYPOINT ls ${INPUT_GITBOOK_INPUT} && gitbook build