# Remember
# Fresh Anaconda 2.5.0
# Check that gfortran version is anaconda 4.8.5
# With Anaconda 4.0.0 gfortran picks up native compiler and messes up.
# Fixed with
# conda remove libgfortran
# conda install gcc --force
# anaconda openblas installs with libgfortran and as such it must be reinstalled from conda-recipes
# May have to clean out conda-bld/linux64 as well, because wrong packages may be picked up from there

export CONDA_BUILD_NUMBER=10
export CONDA_BUILD_LABEL=docker-travis
export CONDA_BUILD_DIR=$HOME/miniconda/conda-bld/linux-64
export FENICS_VERSION=2016.1
export FENICS_GIT_TAG=2016.1.0

conda config --add channels mikaem/label/${CONDA_BUILD_LABEL}

# Fenics
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
