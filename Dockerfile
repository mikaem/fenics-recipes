FROM continuumio/anaconda:latest
USER root
RUN export DEBIAN_FRONTEND=noninteractive && \
    conda config --set always_yes yes && \
    apt-get -y install build-essential && \
    mkdir /home/travis && cd /home/travis && \
    git clone https://github.com/mikaem/conda-recipes.git && cd conda-recipes && git checkout docker-travis && cd .. && \
    git clone https://github.com/mikaem/fenics-recipes.git && cd fenics-recipes && git checkout docker-travis && \
    chmod a+x build_fenics_deps.sh && \
    #./build_fenics_deps.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \   
    conda clean --all && rm -rf /opt/conda/miniconda/conda-bld/git-cache/*

    
COPY travis.conf /home/travis/travis.conf

USER travis
RUN echo '. ~/travis.conf' >> /home/travis/.profile

USER root

