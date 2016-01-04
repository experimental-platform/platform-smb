#!/usr/bin/env bash

/etc/init.d/samba start
tail -f /var/log/samba/*
