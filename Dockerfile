FROM debian:stable
MAINTAINER Kamil Domanski <kamil@domanski.co>

RUN apt-get update && apt-get install -yq samba vim
COPY entrypoint.sh /entrypoint.sh
COPY smb.conf /etc/samba/smb.conf
