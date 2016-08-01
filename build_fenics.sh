# Remember
# Fresh Anaconda 2.5.0
# Check that gfortran version is anaconda 4.8.5
# With Anaconda 4.0.0 gfortran picks up native compiler and messes up.
# Fixed with
# conda remove libgfortran
# conda install gcc --force
# anaconda openblas installs with libgfortran and as such it must be reinstalled from conda-recipes
# May have to clean out conda-bld/linux64 as well, because wrong packages may be picked up from there

export CONDA_BUILD_NUMBER=1
export CONDA_BUILD_LABEL=travis
export FENICS_VERSION=2016.1

conda config --add channels mikaem/label/${CONDA_BUILD_LABEL}

ln -s $HOME/anaconda2/bin/gfortran $HOME/anaconda2/bin/f95

# # Weak dependencies
# conda build hdf5
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/hdf5-1.8.14-${CONDA_BUILD_NUMBER}.tar.bz2
# conda build h5py
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/h5py-2.6.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2
# cd ../conda-recipes; conda build vtk; cd ../fenics-recipes
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/vtk-5.10.1-${CONDA_BUILD_NUMBER}.tar.bz2
#conda build eigen3
#anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/eigen3-3.2.1-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build hwloc
#anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/hwloc-1.11.2-${CONDA_BUILD_NUMBER}.tar.bz2
#conda build petsc
#anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/petsc-3.6.2-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build petsc4py
#anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/petsc4py-3.6.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
#conda build slepc
#anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/slepc-3.6.2-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}

# Fenics
conda build instant
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/instant-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build dijitso
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/dijitso-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build ufl
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/ufl-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build fiat
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/fiat-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build ffc
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/ffc-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build dolfin
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/dolfin-${FENICS_VERSION}-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build fenics
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/fenics-${FENICS_VERSION}-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
