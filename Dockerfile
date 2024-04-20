FROM node:10.15.3
COPY ${INPUT_GITBOOK_INPUT} /workspace
WORKDIR /workspace/${INPUT_GITBOOK_INPUT}
VOLUME [ "/${INPUT_GITBOOK_INPUT}" ]
RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list;
RUN apt-get update
RUN apt-get install -y calibre
RUN gitbook build
RUN gitbook pdf
RUN gitbook epub
RUN gitbook mobi