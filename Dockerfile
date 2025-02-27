FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt update
RUN apt upgrade -y
RUN apt install -y apt-utils sudo make bc bison build-essential checkinstall libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool lz4 libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools wget xsltproc zip zlib1g-dev
RUN wget https://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.3-2_amd64.deb
RUN sudo dpkg -i libtinfo5_6.3-2_amd64.deb
RUN rm -f libtinfo5_6.3-2_amd64.deb
RUN wget https://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncurses5_6.3-2_amd64.deb
RUN wget https://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncurses5_6.3-2_amd64.deb
RUN sudo dpkg -i libncurses5_6.3-2_amd64.deb
RUN rm -f libncurses5_6.3-2_amd64.deb
RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz && \ 
    tar -xf Python-2.7.18.tgz && \ 
    cd Python-2.7.18 && \ 
    ./configure --enable-optimizations && \ 
    make && \ 
    sudo make install && \ 
    wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \ 
    sudo python2 get-pip.py && \ 
    cd .. && \ 
    sudo rm -rf Python-2.7.18
RUN sudo apt clean
RUN sudo curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN sudo chmod a+x /usr/local/bin/repo

CMD ["bash"]
