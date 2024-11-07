FROM golang:alpine
ENV REPO $GOPATH/pixlet

#install prereqs
RUN apk update && \
    apk upgrade -U && \
    apk add curl wget git make libc-dev gcc npm libwebp-dev libwebp-tools patchelf gcompat && \
    rm -rf /var/cache/*

#Download Pixlet
RUN git clone https://github.com/tidbyt/pixlet.git $REPO 
WORKDIR $REPO

#Build Pixlet
RUN npm install && npm run build
RUN make build

#clean up build prereqs
RUN apk del -r curl wget git make gcc patchelf libc-dev 

EXPOSE 8080