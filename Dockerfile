FROM alpine:3.19.0

COPY main.c /tmp

RUN addgroup -g 1000 mygroup && \
    mkdir /myuser && \
    adduser -G mygroup -u 1000 -h /myuser -D myuser && \
    chown -R myuser:mygroup /myuser && \
    apk add git build-base tzdata zlib-dev && \
    wget https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-latest.tar.gz && \
    tar xfvz libmicrohttpd-latest.tar.gz && \
    (cd libmicrohttpd*; ./configure; make install)

RUN cd /tmp && \
    cc main.c -o /main -I/usr/local/include -L/usr/local/lib -lmicrohttpd && \
    chmod 755 /main

RUN apk add curl

USER 1000 
ENTRYPOINT ["/main"]
EXPOSE 8888
