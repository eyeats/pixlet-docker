# pixlet-docker
A dockerfile for [Tidbyt Pixlet](https://github.com/tidbyt/pixlet) 

This allows you to develop pixlet apps in any host OS, then render and serve those apps within this container. 

## Build 

``` dockerfile
docker build -t pixlet  .
```

## Run

``` bash
docker run --rm -it -p 8080:8080 pixlet
```

## Serving pixlet from within the container

By default pixlet serves on 127.0.0.1, to expose this to the host container we must change the host IP to 0.0.0.0. 

``` bash
pixlet serve examples/sunrise.star -i 0.0.0.0
```

Navigate to localhost:8080 on your host machine. 

## All-in-one Example

If you are developing a tidbyt pixlet app in a local folder, you can run this container and serve it automatically to port 8080, automatically refreshing with local changes:

``` bash
docker run --rm -it -p 8080:8080 -v C:\src\pixlet-docker\examples:/srv pixlet pixlet serve -i 0.0.0.0 -w /srv/clock.star
```
