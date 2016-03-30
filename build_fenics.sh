export CONDA_BUILD_NUMBER=4
export CONDA_BUILD_LABEL=travis


# # Weak dependencies
# conda build hdf5
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/hdf5-1.8.14-${CONDA_BUILD_NUMBER}.tar.bz2
# conda build h5py
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/h5py-2.6.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2
# cd ../conda-recipes; conda build vtk; cd ../fenics-recipes
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/vtk-5.10.1-${CONDA_BUILD_NUMBER}.tar.bz2

# Stronger dependencies
# conda build eigen3
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/eigen3-3.2.1-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build hwloc
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/hwloc-1.11.2-${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build petsc
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/petsc-3.6.2-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build petsc4py
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/petsc4py-3.6.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build slepc
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/slepc-3.6.2-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# 
# # Fenics
# conda build instant
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/instant-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build ufl
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/ufl-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build fiat
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/fiat-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build ffc
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/ffc-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
# conda build dolfin
# anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/dolfin-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}