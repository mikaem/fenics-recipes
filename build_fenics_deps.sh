
export CONDA_BUILD_NUMBER=10
export CONDA_BUILD_LABEL=docker-travis
export CONDA_BUILD_DIR=$HOME/miniconda/conda-bld/linux-64
export FENICS_VERSION=2016.1
export FENICS_GIT_TAG=2016.1.0

conda config --add channels mikaem/label/${CONDA_BUILD_LABEL}

# # Weak dependencies
cd ../conda-recipes
conda build boost
anaconda upload /home/travis/miniconda/conda-bld/linux-64/boost-1.60.0-py27_11.tar.bz2 --label ${CONDA_BUILD_NUMBER}
conda build hdf5-parallel
anaconda upload --force ${CONDA_BUILD_DIR}/hdf5-parallel-1.8.14-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build h5py-parallel
anaconda upload --force ${CONDA_BUILD_DIR}/h5py-parallel-2.6.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
cd ../fenics-recipes
conda build eigen3
anaconda upload --force ${CONDA_BUILD_DIR}/eigen3-3.2.1-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build hwloc
anaconda upload --force ${CONDA_BUILD_DIR}/hwloc-1.11.2-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build petsc
anaconda upload --force ${CONDA_BUILD_DIR}/petsc-3.7.3-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build petsc4py
anaconda upload --force ${CONDA_BUILD_DIR}/petsc4py-3.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build slepc
anaconda upload --force ${CONDA_BUILD_DIR}/slepc-3.7.2-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
