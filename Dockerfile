FROM continuumio/anaconda:latest
USER root
RUN export DEBIAN_FRONTEND=noninteractive && \
    conda config --set always_yes yes && \
    apt-get -y install build-essential

COPY set-home-permissions.sh /etc/my_init.d/set-home-permissions.sh

# Set up user so that we do not run as root
# See https://github.com/phusion/baseimage-docker/issues/186
# Disable forward logging
# Add script to set up permissions of home directory on myinit
RUN useradd -m -s /bin/bash -G sudo travis && \
    echo "travis:docker" | chpasswd && \
    echo "travis ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chmod +x /etc/my_init.d/set-home-permissions.sh

USER travis
ENV HOME /home/travis
RUN touch $HOME/.sudo_as_admin_successful && \
    mkdir $HOME/shared
VOLUME /home/travis/shared

WORKDIR /home/travis
USER root
ENTRYPOINT ["/sbin/my_init","--quiet","--","/sbin/setuser","travis","/bin/bash","-l","-c"]
CMD ["/bin/bash","-i"]

USER travis
COPY travis.conf /home/travis/travis.conf
RUN . /home/travis/travis.conf
    echo '. ~/travis.conf' >> /home/travis/.profile

USER root
RUN git clone https://github.com/mikaem/conda-recipes.git && cd conda-recipes && git checkout docker-travis && cd .. && \
    git clone https://github.com/mikaem/fenics-recipes.git && cd fenics-recipes && git checkout docker-travis && \
    chmod a+x build_fenics_deps.sh && \
    #./build_fenics_deps.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \   
    conda clean --all && rm -rf /opt/conda/miniconda/conda-bld/git-cache/*

USER root

