FROM ubuntu:artful
# apt-get install
RUN apt-get update && apt-get install -y \
    git vim coreutils binutils zip \
    python python3 \
    python-pip python3-pip \
    ipython ipython3 \
    socat nmap tcpdump curl wget \
    gcc clang llvm php-cli nasm qemu \
    radare2 ltrace strace gdb \
    foremost volatility binwalk zip
# pip install
RUN pip install hashid scapy pwn && \
    pip3 install hashid scapy 
# rp ++
RUN wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x64 \
    && wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x86 \
    && chmod +x rp-lin-x64 rp-lin-x86 \
    && mv rp-lin-x64 rp-lin-x86 /usr/local/bin
# mgpeda
RUN git clone https://github.com/miyagaw61/exgdb
WORKDIR ./exgdb
RUN yes | ./install.sh

WORKDIR /root/
CMD ["bash", "--version"]

