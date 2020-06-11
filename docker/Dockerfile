FROM docker.io/kevopsoficial/metasploit

RUN apt-get update && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/debian vs-buster main" | tee /etc/apt/sources.list.d/mono-official-vs.list && \
    apt-get update && \
    apt-get -y install monodevelop \
        apt-transport-https \
        dirmngr \
        git \
        dnsutils \
        build-essential \
        apache2 \
        gnome-terminal \
        upx-ucl \
        ruby-full \
        default-jre default-jdk \
        unzip mingw-w64 xterm backdoor-factory && \
    git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database && \
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit && \
    git clone https://github.com/Screetsec/TheFatRat.git /opt/thefatrat && \
    chmod +x /opt/thefatrat/setup.sh