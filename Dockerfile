FROM alpine:latest
RUN apk add --update git autoconf libtool automake build-base python texinfo
RUN git clone https://github.com/Traumflug/simulavr.git
WORKDIR simulavr
RUN ./bootstrap
RUN ./configure --disable-doxygen-doc --enable-dependency-tracking
RUN make
RUN make install
RUN rm -rf simulavr
RUN apk del git autoconf automake
WORKDIR ~/
