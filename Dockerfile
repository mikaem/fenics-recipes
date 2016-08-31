FROM continuumio/anaconda:latest
USER root
RUN export DEBIAN_FRONTEND=noninteractive && \
    conda config --set always_yes yes && \
    anaconda login --hostname docker --username mikaem --password petpet08 && \
    apt-get -y install build-essential && \
    mkdir /home/travis && cd /home/travis && \
    git clone https://github.com/mikaem/conda-recipes.git && cd conda-recipes && git checkout docker-travis && cd .. && \
    git clone https://github.com/mikaem/fenics-recipes.git && cd fenics-recipes && git checkout docker-travis && \
    chmod a+x build_fenics_deps.sh && \
    ./build_fenics_deps.sh && \
    conda clean --all && rm /opt/conda/conda-bld/linux-64/*.tar.bz2 && rm -rf /opt/conda/miniconda/conda-bld/git-cache/*
USER root
