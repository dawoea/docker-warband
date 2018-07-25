FROM ubuntu:latest 

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		wget \
		screen \
        dos2unix \
    && wget http://pcdamtjko.bkt.clouddn.com/mb_warband_dedicated_1171u.zip \
    && unzip mb_warband_dedicated_1171u.zip

RUN dpkg --add-architecture i386 \
		&& apt-get update \
		&& apt-get install -y --no-install-recommends \
			wine-stable \
        && rm -rf /var/lib/apt/lists/* 

ENV WARBAND_DIR /Mount\&Blade\ Warband\ Dedicated/

WORKDIR Mount\&Blade\ Warband\ Dedicated/
EXPOSE 7240/udp
COPY run.sh $WARBAND_DIR
RUN chmod +x run.sh
ENTRYPOINT [ "run.sh" ]