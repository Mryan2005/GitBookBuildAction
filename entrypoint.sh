RUN npm install -g gitbook-cli
RUN gitbook fetch 3.2.3
RUN gitbook -V
RUN apt-get clean && apt-get update
RUN apt-get install -y calibre
cd ${INPUT_GITBOOK_INPUT}
RUN gitbook build
RUN gitbook pdf
RUN gitbook epub
RUN gitbook mobi