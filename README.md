# BashChat

A simple, multi-user, real-time terminal chat system built with Bash scripts.
سیستم چت ترمینالی ساده، چندکاربره و درلحظه، ساخته‌شده با اسکریپت‌های بَش

**Developer:** Pouya Hezaveh  
**توسعه‌دهنده:** پویا هزاوه

## Description / توضیحات

This project implements a client-server chatroom using Bash, supporting multiple users with real-time messaging, simple authentication, and concurrency via tools like `ncat`. It uses a log file for message broadcasting and a users database for authentication.

این پروژه یک چت‌روم کلاینت-سرور را با استفاده از Bash پیاده‌سازی می‌کند که از چندین کاربر با پیام‌رسانی درلحظه احراز هویت ساده و concurrency با ابزارهایی مانند `ncat` پشتیبانی می‌کند. از فایل لاگ برای پخش پیام‌ها و پایگاه داده کاربران برای احراز هویت استفاده می‌شود.

## Features | ویژگی‌ها

- Multi-user chat room (چندکاربره)
- Real-time messaging (پیام‌رسانی لحظه‌ای)
- Simple authentication (احراز هویت ساده)
- Pure Bash + ncat (بدون وابستگی سنگین)
- Shared log file for broadcasting (استفاده از فایل لاگ برای پخش پیام‌ها)
- Cross-platform (Linux/macOS with ncat)

## Requirements | پیش‌نیازها

- Bash 4.0+
- `ncat`

## Steps / مراحل

### Installation / نصب پیش‌نیازها

The project requires a modern `ncat` (from Nmap) for socket handling.

- **Debian / Debian-based (Ubuntu, Mint, Kali, etc.)**
  
  ```bash
  sudo apt update
  sudo apt install ncat
  ```

- **Fedora / RHEL-based (CentOS Stream, Rocky, AlmaLinux, etc.)**
  
  ```bash
  sudo dnf install nmap-ncat
  ```

- **macOS (with Homebrew)**
  
  ```bash
  brew install nmap
  ```

- **Arch Linux / Manjaro**
  
  ```bash
  sudo pacman -S nmap
  ```


### 2. Firewall Configuration / پیکربندی فایروال
If you want to allow connections from other devices to the server host, identify your firewall and ensure the server port (default: 1234) is exempted from restrictions. Check the server script for the default port.  
اگر می‌خواهید امکان اتصال از دستگاه‌های دیگر به دستگاهی که اسکریپت سرور را اجرا می‌کند فراهم باشد، ابتدا فایروال سیستم را شناسایی نموده و مطمئن شوید که پورتی که قرار است سرور روی آن اجرا شود (پیش‌فرض: 1234) از اعمال محدودیت مستثنا است. پورت پیش‌فرض را در اسکریپت سرور مشاهده کنید.

### 3. Grant Permissions to Scripts / دادن دسترسی به اسکریپت‌ها
To avoid permission errors, open a terminal in the project folder and run:  
برای جلوگیری از خطاهای مربوط به سطوح دسترسی، ترمینال را در پوشه پروژه باز کرده و دستور زیر را اجرا کنید:

```bash
chmod +x *.sh
```

### 4. Run the Server / اجرای سرور
Open a terminal in the project folder and start the server:  
ترمینالی در پوشه پروژه باز نموده و اسکریپت سرور را اجرا کنید:

```bash
cd path/to/project
./server.sh
```
Or with a custom port:  
یا با پورت دلخواه:
```bash
./server.sh <port-number>
```

### 5. Run the Client / اجرای کلاینت
For each client, open a terminal in the project folder and start the client:

برای اجرای هر کلاینت، ترمینالی را در پوشه پروژه باز نموده و اسکریپت کلاینت را اجرا کنید:

```bash
cd path/to/project
./client.sh
```

Or with custom server IP and port:  
یا با آی-پی سرور و پورت دلخواه:

```bash
./client.sh <server-ip> <port>
```

**Note:** Accounts are defined by username and password in the file: `/path/to/project/data/users.db`

**نکته:** اکانت‌ها به وسیله نام‌کاربری و رمز‌عبور در فایل زیر تعریف شده‌اند `/path/to/project/data/users.db`
