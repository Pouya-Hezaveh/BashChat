#!/bin/bash

source ./lib/utility.sh

CHAT_FILE=$1
USERS_FILE=$2

warn "Someone trying to authenticate..." >&2
success "Connected to the server!"

# احراز هویت ساده
ask "Enter username: "
read -r username
ask "Enter password: "
read -r password

if ! grep -qFx "$username:$password" "$USERS_FILE"; then
    error "Authentication failed!"
    exit 1
fi

greet "=== $username logged in at $(date '+%Y-%m-%d %H:%M:%S') ===" >&2
echo "=== $username logged in at $(date '+%Y-%m-%d %H:%M:%S') ===" >> "$CHAT_FILE"

greet "Welcome, $username! You are now in the chat room."

info "Here you can read the last 100 messages:"
# ارسال پیام‌های قبلی
tail -n 100 "$CHAT_FILE" 2>/dev/null

# در پس-زمینه به عنوان یه پروسه جدا اجرا می‌شه که هر چه به CHAT_FILE اضافه شد در لحظه برای کاربر ارسال می‌کنه
tail -n 0 -f "$CHAT_FILE" &
# آیدی فرآیند (پروسه) رو ذخیره می‌کنیم تا بتوانیم آن را مدیریت کنیم
TAIL_PID=$! # $! ==> The process ID (PID) of the most recently started background job

# تمیز کردن هنگام خروج
cleanup() {
    kill "$TAIL_PID" 2>/dev/null
}

# پاکسازی پروسه های اضافی هنگام خروج
trap cleanup INT TERM EXIT

# خواندن پیام از کاربر و ذخیره در فایل چت
while read -r line; do
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    msg="[$timestamp] $username: $line"

    # نوشتن پیام آماده شده به فایل
    printf '%s\n' "$msg" >> "$CHAT_FILE"
done



: << 'NOTEPAD'

# فرآیند background برای ارسال پیام‌های broadcast به کاربران
tail -f "$CHAT_FILE" &
TAIL_PID=$! # $! ==> The process ID (PID) of the most recently started background job

# پاکسازی هنگام خروج
trap "kill $TAIL_PID; exit" INT TERM EXIT

# خواندن از کلاینت و broadcast به CHAT_FILE
while read -r line; do
    echo "$username: $line" > "$CHAT_FILE"
    
    [[ "$line" =~ ^/quit$|^/exit$ ]] && {
        echo "$username left the chat."
        exit 0
    }
done

NOTEPAD