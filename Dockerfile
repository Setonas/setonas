FROM alpine:3.4

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

RUN apk add --no-cache ca-certificates

ENV SETONAS_VERSION 3.4.0


RUN set -ex \
	&& apk add --no-cache --virtual .fetch-deps \
		gnupg \
		openssl \
		tar \
		xz \
	\
	&& wget -O setonas.tar.gz "https://github.com/Setonas/setonas/archive/$SETONAS_VERSION.tar.gz" \
	&& mkdir -p /usr/src/setonas \
	&& tar -xzC /usr/src/setonas --strip-components=1 -f setonas.tar.gz \
	&& rm setonas.tar.gz \
	\
	&& apk add --no-cache --virtual .build-deps  \
		bzip2-dev \
		gcc \
		gdbm-dev \
		libc-dev \
		linux-headers \
		make \
		ncurses-dev \
		openssl \
		openssl-dev \
		pax-utils \
		readline-dev \
		sqlite-dev \
		tcl-dev \
		tk \
		tk-dev \
		xz-dev \
		zlib-dev \
# add build deps before removing fetch deps in case there's overlap
	&& apk del .fetch-deps \
	\
	&& cd /usr/src/setonas \
	&& ./configure \
		--enable-loadable-sqlite-extensions \
		--enable-shared \
	&& make -j$(getconf _NPROCESSORS_ONLN) \
	&& make install \
	\
	&& apk add --virtual .python-rundeps $runDeps \
	&& apk del .build-deps \
	&& rm -rf /usr/src/setonas ~/.cache

CMD ["setonas"]