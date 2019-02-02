FROM debian:latest

WORKDIR "/home/gnucap"
VOLUME "/home/gnucap/work"

# build-essential
RUN apt-get update && \
    apt-get -y install \
        g++ \
        make \
        autotools-dev \
        autoconf \
        libtool \
        libreadline-dev \
        git \
        python3 \
        swig \
        python3-dev \
        python3-pip \
        vim
        

RUN git clone https://git.savannah.gnu.org/r/gnucap /home/gnucap/gnucap
RUN cd /home/gnucap/gnucap && ./configure && make && make install && ldconfig
RUN git clone https://gitlab.com/gnucap/gnucap-python /home/gnucap/gnucap-python
RUN cd /home/gnucap/gnucap && ./bootstrap && ./configure && make && make install && ldconfig

RUN python3 -m pip install numpy
RUN ln -sf /usr/local/lib/python3.5/dist-packages/numpy/core/include/numpy /usr/include/
RUN python3 -m pip install jupyter

EXPOSE 8888

