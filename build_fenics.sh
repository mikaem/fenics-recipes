export CONDA_BUILD_NUMBER=2
export CONDA_BUILD_LABEL=dev

conda build instant
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/instant-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build ufl
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/ufl-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build fiat
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/fiat-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build ffc
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/ffc-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build dolfin
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/dolfin-1.7.0-py27_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
conda build dolfin-vtk
anaconda upload --force /home/mikael/anaconda2/conda-bld/linux-64/dolfin-1.7.0-py27_vtk_${CONDA_BUILD_NUMBER}.tar.bz2 --label ${CONDA_BUILD_LABEL}
