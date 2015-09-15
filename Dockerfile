FROM alpine:3.2

ENV USER apkbuild
RUN apk --update add alpine-sdk
RUN adduser -D ${USER}
RUN echo "${USER}    ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER ${USER}
WORKDIR /home/${USER}
RUN git clone git://dev.alpinelinux.org/aports

RUN sudo mkdir -p /var/cache/distfiles
RUN sudo chmod a+w /var/cache/distfiles
RUN sudo addgroup ${USER} abuild
RUN sudo chgrp abuild /var/cache/distfiles
RUN sudo chmod g+w /var/cache/distfiles
