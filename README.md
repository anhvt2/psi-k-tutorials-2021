# Psi-k Workshop 2021 - Tutorials - Machine learning interatomic potentials

Authors: Anh Tran (anhtran@sandia.gov), Julien Tranchida (Julien.TRANCHIDA@cea.fr)

Official workshop website: https://www.mlip-workshop-2021.xyz/schedule

## File/Folder Structures
```
.
├── bayesOpt_batchParallel_demo
│             ├── dakota_dft.in
│             ├── dakota.rst
│             ├── dft_opt.dat
│             ├── dft_query.py
│             ├── fort.13
│             ├── input.hf.dat
│             ├── LHS_2.out
│             ├── LHS_3.out
│             ├── LHS_7.out
│             ├── LHS_8.out
│             ├── LHS_9.out
│             ├── LHS_distributions.out
│             ├── LHS_samples.out
│             ├── output.hf.dat
│             ├── params.in
│             ├── params.in.1
│             ├── results.out
│             ├── rosen_opt_dft.dat
│             └── run.sh
├── bayesOpt_sequential_demo
│             ├── dakota_dft.in
│             ├── dakota.rst
│             ├── dft_opt.dat
│             ├── dft_opt.dat.bak
│             ├── dft_query.py
│             ├── fort.13
│             ├── input.hf.dat
│             ├── LHS_2.out
│             ├── LHS_3.out
│             ├── LHS_7.out
│             ├── LHS_8.out
│             ├── LHS_9.out
│             ├── LHS_distributions.out
│             ├── LHS_samples.out
│             ├── output.hf.dat
│             ├── params.in
│             ├── params.in.1
│             ├── results.out
│             ├── rosen_opt_dft.dat
│             └── run.sh
├── bo.gif
├── dakota_dft.in
├── dataHf
│             ├── dft_query.py
│             ├── input.hf.dat
│             ├── output.hf.dat
│             ├── params.in
│             └── results.out
├── dataLf
│             ├── input.lf.dat
│             ├── output.lf.dat
│             ├── params.in
│             ├── results.out
│             └── snap_query.py
├── LICENSE
├── output-1200.gif
├── output-720.gif
├── psi-k-9Nov21.odp
├── psi-k-9Nov21.pdf
├── README.md
└── test
    ├── dakota_dft.in
    ├── dakota.rst
    ├── dft_opt.dat
    ├── dft_query.py
    ├── fort.13
    ├── input.hf.dat
    ├── LHS_2.out
    ├── LHS_3.out
    ├── LHS_7.out
    ├── LHS_8.out
    ├── LHS_9.out
    ├── LHS_distributions.out
    ├── LHS_samples.out
    ├── output.hf.dat
    ├── params.in
    ├── params.in.1
    ├── results.out
    ├── rosen_opt_dft.dat
    └── run.sh
```

* Input: chemical composition, or more precisely, number of atoms in a simulation cell
* Output: bulk modulus

## `dataHf`

DFT materials properties prediction using Quantum ESPRESSO

`dataHf/dft_query.py`: pseudo-simulation

## `dataLf`

MD materials properties using LAMMPS + SNAP ML-IAP

`dataLf/snap_query.py`: pseudo-simulation

## Dakota

Official website: [https://dakota.sandia.gov/](https://dakota.sandia.gov/)

* Publicly available source code
* Focus on EGO in this paper
* version 6.15

```shell
cmake  \
  -D CMAKE_C_FLAGS="-O2 -fextended-identifiers -finput-charset=UTF-8 -fPIC"  \
  -D CMAKE_CXX_FLAGS="-O2 -fPIC"  \
  -D CMAKE_Fortran_FLAGS="-O2 -fallow-argument-mismatch -fPIC"  \
  -D DAKOTA_HAVE_GSL:BOOL=TRUE  \
  -D HAVE_QUESO:BOOL=TRUE  \
  -D DAKOTA_HAVE_MPI:BOOL=TRUE  \
  -D DAKOTA_HDF5:BOOL=TRUE  \
  -D Boost_NO_BOOST_CMAKE:BOOL=TRUE  \
  -D ENABLE_SPEC_MAINT:BOOL=TRUE  \
  -D DevDebug=ON  \
  -D DAKOTA_PYTHON=ON  \
  -D CMAKE_CXX_COMPILER:FILEPATH=/usr/bin/mpicxx  \
  -D MPI_LIBRARY:FILEPATH=/usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi_cxx.so  \
  -D DAKOTA_HAVE_GSL:BOOL=TRUE  \
  -D Trilinos_VERBOSE_CONFIGURE:BOOL=FALSE  \
  -D DAKOTA_NO_FIND_TRILINOS:BOOL=TRUE  \
  -D DAKOTA_PYTHON=TRUE \
  -D DAKOTA_PYTHON_SURROGATES=TRUE \
  -D DAKOTA_PYTHON_DIRECT_INTERFACE=TRUE \
  -D DAKOTA_PYTHON_DIRECT_INTERFACE_NUMPY=TRUE \
  ../dakota-6.15.0-public-src-cli
```

How to run (sequential / parallel on multi-core architecture): 
```
$ dakota -i dakota_input.in # sequential
$ mpirun -np 4 dakota -i dakota_input.in # parallel
```


