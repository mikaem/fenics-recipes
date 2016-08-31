FROM quay.io/fenicsproject/dev-env:latest
USER root
RUN su -u fenics && \
    export DEBIAN_FRONTEND=noninteractive && \
    wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /home/fenics/miniconda && \
    export PATH=/home/fenics/miniconda/bin:$PATH && \
    unset PYTHONPATH && \
    conda config --set always_yes yes && \
    conda install anaconda conda-build=1.21.4 && \
    export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH && \
    ./build_fenics.sh && \
    conda clean --all && rm /home/fenics/miniconda/conda-bld/linux-64/*.tar.bz2 && rm -rf /home/fenics/miniconda/conda-bld/git-cache/*
USER root
