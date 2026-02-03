#!/bin/bash

source ./lib/utility.sh

warn_connecting() {
    local ip=$1
    local port=$2
    local message="Establishing connection to $ip:$port"
    warn "$message"
}

if [ $# -eq 0 ]; then
    IP=0.0.0.0
    PORT=1234
    info "Note: If you wanna set the address of your desired server,
        then call the script like this: $0 <desired-IP> <desired-port>"
elif [ $# -eq 1 ]; then
    IP=$1
    PORT=1234
    info "Note: Connecting to the default port..."
elif [ $# -eq 2 ]; then
    IP=$1
    PORT=$2
else
    error "Usage: $0 <desired-IP> <desired-port>"
fi

warn_connecting $IP $PORT

# اتصال به سرور با nc (سوکت کلاینت)
nc $IP $PORT

# $? ==> Exit status of the most recent (foreground) command
if [ $? -eq 1 ]; then
    error "Couldn't connect to that port."
fi