# lists_buy_app

lists_buy_app

## Code

- Written in C

- Leverages libmicrohttpd



## Compiling, Executing & Testing on MacOS

Assumes libmicrohttpd 0.9.77 was installed via homebrew on MacOS

### Installing libmicrohttpd via homebrew

```
brew install libmicrohttpd
```

### Compiling using gcc

```
cc main.c -o main -I/opt/homebrew/Cellar/libmicrohttpd/0.9.77/include -L/opt/homebrew/Cellar/libmicrohttpd/0.9.77/lib -lmicrohttpd
file main
```

### 

### Execute

Start the app in a terminal

```
./main
```

### 

### Test

Test the app from another terminal or use your web browser to http://localhost:8888

```
curl http://localhost:8888
```

## 

## Container

- Uses alpine

- Copies source code to /tmp for compilation

- Compiles to /

- Entrypoint for the container is /main

- Exposes port 8888

- Includes curl utility to debug via curl http://localhost:8888

### 

### Container - Building

Assumes GitHub Container Registry aka ghcr is being used

#### Login to ghcr

Reference [Working with the Container registry - GitHub Docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry) for information about the personal access token.

```
GH_USERNAME=someusername
GKEY=XXX
echo $GKEY | docker login ghcr.io -u $GH_USERNAME  --password-stdin
```

#### Build, tag and push container to ghcr

Assumes you have Docker Desktop on Mac

```
MYAPP="`pwd | sed 's#.*/##' | cut -d_ -f2`"
MYVER="1.0"
docker build -t $MYAPP .
docker tag buy ghcr.io/$GH_USERNAME/$MYAPP:$MYVER
docker push ghcr.io/$GH_USERNAME/$MYAPP:$MYVER
```
