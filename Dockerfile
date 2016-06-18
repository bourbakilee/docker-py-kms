FROM ubuntu:latest
MAINTAINER James Swineson <jamesswineson@gmail.com>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git python2\
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/{{lib,share}/locale,share/{man,doc,info,gnome/help,cracklib,il8n},{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive}

PWD /usr/local/src
RUN git clone https://github.com/dzacharo/py-kms.git --branch patch-1

EXPOSE 1688
CMD ["python2" "server.py" "0.0.0.0" "1688"]
