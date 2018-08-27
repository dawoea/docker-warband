FROM ubuntu:latest 

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		unzip \
		wget \
		screen \
        dos2unix \
        git 

RUN dpkg --add-architecture i386  \
        && wget -nc https://dl.winehq.org/wine-builds/Release.key \
        && apt-key add Release.key \
        && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
		&& apt-get update \
		&& apt-get install --install-recommends \
			winehq-stable \
        && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/Fmods/Dedicated.git --recursive

ENV WARBAND_DIR Dedicated/

WORKDIR Dedicated/
EXPOSE 7240/udp
COPY run.sh $WARBAND_DIR
RUN chmod +x run.sh
ENTRYPOINT [ "run.sh" ]