FROM golang:bullseye
ENV REPO=$GOPATH/pixlet

RUN apt-get update && apt-get install -y libwebp-dev npm

RUN git clone https://github.com/tidbyt/pixlet.git $REPO 
WORKDIR $REPO
RUN npm install && npm run build && make build
ENV PATH="${REPO}:${PATH}"

EXPOSE 8080