
export CONDA_BUILD_NUMBER=10
export CONDA_BUILD_LABEL=docker-travis
export CONDA_BUILD_DIR=/opt/conda/conda-bld/linux-64
export FENICS_VERSION=2016.1
export FENICS_GIT_TAG=2016.1.0

conda config --add channels mikaem/label/${CONDA_BUILD_LABEL}

# # Weak dependencies
cd ../conda-recipes
conda build boost
cd ../fenics-recipes
conda build hdf5-parallel
conda build h5py-parallel
conda build eigen3
conda build hwloc
conda build petsc
conda build petsc4py
conda build slepc
