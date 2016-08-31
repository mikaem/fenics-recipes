FROM continuumio/anaconda:latest
USER root
RUN export DEBIAN_FRONTEND=noninteractive && \
    conda config --set always_yes yes && \
    apt-get -y install build-essential && \
    mkdir /home/travis

WORKDIR /home/travis
COPY travis.conf /home/travis/travis.conf

RUN cd /home/travis && \
    . travis.conf && \
    echo $CONDA_BUILD_LABEL && \
    git clone https://github.com/mikaem/conda-recipes.git && cd conda-recipes && git checkout docker-travis && cd .. && \
    git clone https://github.com/mikaem/fenics-recipes.git && cd fenics-recipes && git checkout docker-travis && \
    chmod a+x build_fenics_deps.sh && \
    ./build_fenics_deps.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \   
    conda clean --all && rm -rf /opt/conda/miniconda/conda-bld/git-cache/*

USER root

