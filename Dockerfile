FROM experimentalplatform/ubuntu:latest


RUN apt-get update && \
    apt-get install -y libnss-extrausers samba && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cp /etc/nsswitch.conf /etc/nsswitch.conf.backup
ADD nsswitch.conf /etc/nsswitch.conf
# /etc/samba/smb.conf is replaced with /templates/smb.conf in /entrypoint.sh
ADD smb.conf /templates/smb.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh; \
    chmod 0644 /etc/nsswitch.conf /templates/smb.conf; \
    cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

# these will be replaced by a volume mount but are handy for testing purposes
ADD smbpasswd /etc/samba/smbpasswd
ADD shadow /var/lib/extrausers/shadow
ADD passwd /var/lib/extrausers/passwd

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/smbd", "-F", "-S"]
