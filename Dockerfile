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
        

## install gnucap
RUN git clone https://git.savannah.gnu.org/r/gnucap /home/gnucap/gnucap
RUN cd /home/gnucap/gnucap && ./configure && make && make install && ldconfig

## install numpy
RUN python3 -m pip install numpy
RUN ln -sf /usr/local/lib/python3.5/dist-packages/numpy/core/include/numpy /usr/include/

## install gnucap-python
RUN git clone https://gitlab.com/gnucap/gnucap-python /home/gnucap/gnucap-python
RUN cd /home/gnucap/gnucap-python && ./bootstrap && ./configure && make && make install && ldconfig

## install jupyter
RUN python3 -m pip install jupyter matplotlib
RUN jupyter notebook --generate-config

# EXPOSE 8888

