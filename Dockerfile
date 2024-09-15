FROM kalilinux/kali-rolling AS base

LABEL version="1.0" \
    author="fibonascii" \
    description="Custom kali docker image for pentesting, HTB, and OSCP"

# Enable noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /app

RUN apt update -y && apt install gpg ca-certificates curl git -y

FROM base as psqlSTAGE
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8881B2A8210976F2 

RUN curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub |\
    gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

RUN apt-key export 7FCC7D46ACCC4CF8 | \
    gpg --dearmor -o /usr/share/keyrings/postgres-bookworm.gpg

COPY sources.list.d/ /etc/apt/sources.list.d/

RUN apt update -y

FROM base AS utilitiesSTAGE

# Install official metapackages
RUN apt install -y kali-linux-headless

# Install documentation
RUN apt install -y man-db

# Install Security
RUN apt install -y apparmor rkhunter

# Install tools
RUN apt install -y gobuster cupp mongodb rustup rsync iputils-ping dirbuster \
    hydra

# Add Impacket Here

# Add WinPEASS here

# Add webshells here - github.com/blackarch/webshells

# Add php-reverse-shell.php here

# Setup neovim
RUN apt install -y neovim
