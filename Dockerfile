FROM ubuntu
ENV TZ=Pacific/Auckland
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y git make autoconf automake gcc libtool pkg-config python python3 yasm nasm libfreetype6-dev libfribidi-dev libfontconfig-dev libzvbi-dev libasound2-dev libgnutls28-dev libpulse-dev libva-dev libvdpau-dev libx11-dev libxext-dev libxinerama-dev libxrandr-dev libharfbuzz-dev
RUN git clone https://github.com/mpv-player/mpv-build.git
WORKDIR /mpv-build
RUN echo --enable-libzvbi > ffmpeg_options
RUN echo --enable-libmpv-shared > mpv_options
RUN echo --disable-build-date >> mpv_options
RUN echo --disable-debug-build >> mpv_options
RUN ./use-ffmpeg-release
RUN ./use-mpv-master