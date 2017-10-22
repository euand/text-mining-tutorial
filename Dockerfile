from ubuntu:trusty

RUN apt-get update && \
    apt-get install -y vim \
                        python-dev \
                        python-pip \
                        gcc \
                        gsl-bin \
                        libgsl0-dev \
                        build-essential \
                        clang \
                        libpng12-dev \
                        libfreetype6-dev \
                        pkg-config \
                        && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/* \
            /tmp/* \
            /var/tmp/*

RUN pip install pip==9.0.1
RUN pip install jupyter
RUN pip install cython \
                numpy \
                setuptools \
                ipywidgets \
                jupyter \
                nltk \
                pandas \
                matplotlib \
                scipy

RUN apt-get update && \
    apt-get install -y python-scipy

RUN pip install six==1.10

ADD . /text-mining-tutorial/

RUN cd /text-mining-tutorial && \
      python setup.py build_ext --inplace && \
      python setup.py install

EXPOSE 8888
