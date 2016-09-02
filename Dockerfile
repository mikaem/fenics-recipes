# image containing Fenics dependencies built with conda

FROM continuumio/anaconda:latest
USER root

RUN export DEBIAN_FRONTEND=noninteractive && \
    conda config --set always_yes yes && \
    apt-get -y install build-essential && \
    mkdir ${HOME} && \
    cd ${HOME} && \
    git clone https://github.com/mikaem/conda-recipes.git && cd conda-recipes && git checkout host-gcc && cd .. && \
    git clone https://github.com/mikaem/fenics-recipes.git && cd fenics-recipes && git checkout host-gcc && \
    chmod a+x build_fenics_deps.sh && \
    ./build_fenics_deps.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \   
    conda clean --all && rm -rf /opt/conda/conda-bld/git-cache/*

WORKDIR ${HOME}

USER root
