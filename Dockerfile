FROM quay.io/travisci/travis-python:latest
USER root
RUN su -u travis && \
    export DEBIAN_FRONTEND=noninteractive && \
    wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /home/travis/miniconda && \
    export PATH=/home/travis/miniconda/bin:$PATH && \
    unset PYTHONPATH && \
    conda config --set always_yes yes && \
    conda install anaconda conda-build=1.21.4 && \
    cd /home/travis && \
    git clone https://github.com/mikaem/fenics-recipes.git && \
    cd fenics-recipes && \
    git checkout docker-travis && \
    ./build_fenics_deps.sh && \
    conda clean --all && rm /home/travis/miniconda/conda-bld/linux-64/*.tar.bz2 && rm -rf /home/travis/miniconda/conda-bld/git-cache/*
USER root
