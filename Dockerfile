FROM photon:latest

LABEL org.opencontainers.image.authors="mackid1993"

ENV FFMPEG_PKG=ffmpeg-master-latest-linux64-gpl.tar.xz

WORKDIR "/root"

RUN tdnf update -y \
        && tdnf -y install sudo bzip2 cifs-utils alsa-utils wget icu xz

RUN curl -L -o ${FFMPEG_PKG} https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/${FFMPEG_PKG}

RUN mkdir -p /var/lib/ffmpeg && \
    tar -xf ${FFMPEG_PKG} && \
    cp ffmpeg-*/bin/ffmpeg ffmpeg-*/bin/ffprobe /var/lib/ffmpeg/ && \
    rm -rf ffmpeg-* ${FFMPEG_PKG} && \
    ln -s /var/lib/ffmpeg/ffmpeg /usr/local/bin/ffmpeg && \
    ln -s /var/lib/ffmpeg/ffprobe /usr/local/bin/ffprobe

RUN ffmpeg -version && \
    for codec in libvorbis libmp3lame aac flac; do \
        ffmpeg -hide_banner -encoders | grep -q "$codec" || (echo "Missing FFmpeg encoder: $codec" && exit 1); \
    done

ENV ROON_SERVER_PKG=RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL=https://download.roonlabs.net/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT=/data
ENV ROON_ID_DIR=/data

VOLUME [ "/app", "/data", "/music", "/backup" ]

WORKDIR "/root"

ADD run.sh /root

RUN chmod +x /root/run.sh

ENTRYPOINT ["/root/run.sh"]
