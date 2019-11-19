ARG distro=stretch
FROM resin/rpi-raspbian:$distro

RUN apt-get update \
    && apt-get -y install curl gnupg2 --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

#RUN wget -O - http://www.linux-projects.org/listing/uv4l_repo/lrkey.asc | apt-key add -
RUN curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | apt-key add -

RUN echo 'deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main' >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y install uv4l uv4l-raspicam uv4l-uvc uv4l-mjpegstream uv4l-dummy uv4l-xscreen uv4l-server uv4l-webrtc uv4l-demos --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
    
#CMD uv4l -f --auto-video_nr --driver uvc --device-id 05a3:9230