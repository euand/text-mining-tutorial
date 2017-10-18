from ubuntu:trusty

RUN apt-get update && \
    apt-get install -y vim \
                        python-dev \
                        python-pip \
                        gcc \
                        gsl-bin \
                        libgsl0-dev \
                        build-essential \
                        clang && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/* \
            /tmp/* \
            /var/tmp/*

RUN pip install cython \
                numpy \
                jupyter \
                nltk \
                pandas

ADD . /text-mining-tutorial/

RUN cd /text-mining-tutorial && \
      python setup.py build_ext --inplace && \
      python setup.py install

EXPOSE 8080
