FROM node:10.15.3
COPY . /GitBookBuildAction
WORKDIR /GitBookBuildAction

RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V

ENTRYPOINT ["gitbook", "build"]