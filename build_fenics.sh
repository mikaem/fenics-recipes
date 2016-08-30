# Remember
# Fresh Anaconda 2.5.0
# Check that gfortran version is anaconda 4.8.5
# With Anaconda 4.0.0 gfortran picks up native compiler and messes up.
# Fixed with
# conda remove libgfortran
# conda install gcc --force
# anaconda openblas installs with libgfortran and as such it must be reinstalled from conda-recipes
# May have to clean out conda-bld/linux64 as well, because wrong packages may be picked up from there

export CONDA_BUILD_NUMBER=11
export CONDA_BUILD_LABEL=docker
export CONDA_BUILD_DIR=$HOME/miniconda/conda-bld/linux-64
export FENICS_VERSION=2016.1
export FENICS_GIT_TAG=2016.1.0

conda config --add channels mikaem/label/${CONDA_BUILD_LABEL}

#ln -s $HOME/anaconda2/bin/gfortran $HOME/anaconda2/bin/f95

# # Weak dependencies
#cd ../conda-recipes
#conda build boost
#anaconda upload /home/travis/miniconda/conda-bld/linux-64/boost-1.60.0-py27_11.tar.bz2 --label ${CONDA_BUILD_NUMBER}
#conda build hdf5-parallel
#anaconda upload --force ${CONDA_BUILD_DIR}/hdf5-parallel-1.8.14-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build h5py-parallel
#anaconda upload --force ${CONDA_BUILD_DIR}/h5py-parallel-2.6.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
## cd ../conda-recipes; conda build vtk; cd ../fenics-recipes
## anaconda upload --force ${CONDA_BUILD_DIR}/vtk-5.10.1-${CONDA_BUILD_NUMBER}.tar.bz2
#conda build eigen3
#anaconda upload --force ${CONDA_BUILD_DIR}/eigen3-3.2.1-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build hwloc
#anaconda upload --force ${CONDA_BUILD_DIR}/hwloc-1.11.2-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build petsc
#anaconda upload --force ${CONDA_BUILD_DIR}/petsc-3.7.3-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build petsc4py
#anaconda upload --force ${CONDA_BUILD_DIR}/petsc4py-3.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build slepc
#anaconda upload --force ${CONDA_BUILD_DIR}/slepc-3.7.2-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}

# Fenics
#conda build instant
#anaconda upload --force ${CONDA_BUILD_DIR}/instant-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build dijitso
#anaconda upload --force ${CONDA_BUILD_DIR}/dijitso-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build ufl
#anaconda upload --force ${CONDA_BUILD_DIR}/ufl-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build fiat
#anaconda upload --force ${CONDA_BUILD_DIR}/fiat-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build ffc
#anaconda upload --force ${CONDA_BUILD_DIR}/ffc-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build dolfin
#anaconda upload --force ${CONDA_BUILD_DIR}/dolfin-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build fenics
#anaconda upload --force ${CONDA_BUILD_DIR}/fenics-${FENICS_VERSION}-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
