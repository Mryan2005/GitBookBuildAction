FROM node:10.15.3
COPY . /workspace
WORKDIR /workspace

RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN ls ./workspace

ENTRYPOINT ["gitbook", "build"]