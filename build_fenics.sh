export CONDA_BUILD_DIR=$HOME/miniconda/conda-bld/linux-64
export FENICS_VERSION=2016.2.dev
export FENICS_GIT_TAG=2016.1.0
export CONDA_BUILD_NUMBER=13
export CONDA_BUILD_LABEL=docker-dev

conda config --add channels mikaem/label/${CONDA_BUILD_LABEL}

# All dependencies from docker
conda build instant
anaconda upload --force ${CONDA_BUILD_DIR}/instant-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build dijitso
anaconda upload --force ${CONDA_BUILD_DIR}/dijitso-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build ufl
anaconda upload --force ${CONDA_BUILD_DIR}/ufl-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build fiat
anaconda upload --force ${CONDA_BUILD_DIR}/fiat-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build ffc
anaconda upload --force ${CONDA_BUILD_DIR}/ffc-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build dolfin
anaconda upload --force ${CONDA_BUILD_DIR}/dolfin-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build fenics
anaconda upload --force ${CONDA_BUILD_DIR}/fenics-${FENICS_VERSION}-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
