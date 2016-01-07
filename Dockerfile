FROM experimentalplatform/ubuntu:latest


RUN apt-get update && \
    apt-get install -y libnss-extrausers samba && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# build-essential

RUN cp /etc/nsswitch.conf /etc/nsswitch.conf.backup
ADD nsswitch.conf /etc/nsswitch.conf
ADD smbpasswd /etc/samba/smbpasswd
ADD shadow /var/lib/extrausers/shadow
ADD passwd /var/lib/extrausers/passwd
ADD smb.conf /etc/samba/smb.conf

CMD ["/usr/sbin/smbd", "-F", "-S"]
