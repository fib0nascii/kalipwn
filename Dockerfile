FROM kalilinux/kali-rolling

LABEL version="1.0" \
    author="fibonascii" \
    description="Custom kali docker image for pentesting, HTB, and OSCP"

# Enable noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

# Install official metapackages

RUN apt update && apt install -y kali-linux-headless

# Install documentation
RUN apt install -y man-db

# Install Security
RUN apt install -y apparmor rkhunter

# Install tools
RUN apt install -y gobuster cupp mongodb rustup rsync iputils-ping dirbuster

# Setup neovim
RUN apt install -y neovim
