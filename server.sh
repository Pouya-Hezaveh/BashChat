#!/bin/bash

source ./lib/utility.sh

PORT=1234
CHAT_FILE="./data/chat.log"
USERS_FILE="./data/users.db"

if [ $# -eq 0 ]; then
    info "Note: If you wanna run the server on another port,
        then call the script like this: $0 <desired-port>"
elif [ $# -eq 1 ]; then
    PORT=$1I
    info "Note: Connecting to the default port..."
elif [ $# -eq 2 ]; then
    IP=$1
    PORT=$2
else
    error "Usage: $0 <desired-IP> <desired-port>"
fi

# پاک‌سازی هنگام خروج
# trap "rm -f $CHAT_FILE" EXIT
touch "$CHAT_FILE"

# اعلام وضعیت سرور شامل آیپی لوکال و پورت
success "The server started on: $(hostname -I | awk '{print $1}'):$PORT"

# باز کردن سوکت برای دریافت درخواست های کاربران و اجرا نمودن اسکریپت هندل-کلاینت روی آن‌ها
ncat --listen --keep-open --exec "./handle_client.sh $CHAT_FILE $USERS_FILE" $PORT
# socat TCP-LISTEN:$PORT,reuseaddr,fork EXEC:"./handle_client.sh $CHAT_FILE $USERS_FILE"