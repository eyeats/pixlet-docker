FROM golang:bullseye

ENV WEBP_VERSION libwebp-1.2.2-rc1
ENV REPO=$GOPATH/pixlet

RUN apt-get update \
 && apt-get install -y ca-certificates tzdata openssl libwebp-dev bash npm

RUN apt-get update && apt-get install -y cron && which cron && \
    rm -rf /etc/cron.*/*

RUN git clone https://github.com/tidbyt/pixlet.git $REPO 
WORKDIR $REPO
RUN npm install && npm run build && make build
ENV PATH="${REPO}:${PATH}"

EXPOSE 8080