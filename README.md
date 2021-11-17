# Psi-k Workshop 2021 - Tutorials - Machine learning interatomic potentials

Authors: Anh Tran (anhtran@sandia.gov), Julien Tranchida (Julien.TRANCHIDA@cea.fr)

Official workshop website: https://www.mlip-workshop-2021.xyz/schedule

## Structures
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

## `dataHf/`

DFT materials properties prediction using Quantum ESPRESSO

`dataHf/dft_query.py`: pseudo-simulation

## `dataLf/`

MD materials properties using LAMMPS + SNAP ML-IAP

`dataLf/snap_query.py`: pseudo-simulation

## Dakota software

Official website: [https://dakota.sandia.gov/](https://dakota.sandia.gov/)

* Publicly available source code
* Focus on EGO in this paper
* version 6.15
* require GCC, MPI, BOOST library, GSL, numpy (Python): for Ubuntu, some may require only one command

```
sudo apt-get install libgsl-dev
```

```shell
mkdir build-6.15
cd build-6.15
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

make
sudo ln -sf $(pwd)/test/dakota /usr/bin # or simply put somewhere under $PATH
```

How to run (sequential / parallel on multi-core architecture): 
```
$ dakota -i dakota_input.in # sequential
$ mpirun -np 4 dakota -i dakota_input.in # parallel
```

## Multi-fidelity results

![MFBO](output-1200.gif)

## References

If you find this repository helpful, please consider citing one of these references, ranking from top to bottom in a decreasing order.

1. https://aip.scitation.org/doi/abs/10.1063/5.0015672
```
@article{tran2020multi,
  title={Multi-fidelity machine-learning with uncertainty quantification and {B}ayesian optimization for materials design: {A}pplication to ternary random alloys},
  author={Tran, Anh and Tranchida, Julien and Wildey, Tim and Thompson, Aidan P},
  journal={The Journal of Chemical Physics},
  volume={153},
  issue={7},
  pages={074705},
  year={2020},
  publisher={AIP Publishing}
}
```


2. https://asmedigitalcollection.asme.org/computingengineering/article-abstract/20/3/031007/1081854
```
@article{tran2020smfbo2cogp,
  title={{sMF-BO-2CoGP: A sequential multi-fidelity constrained Bayesian optimization for design applications}},
  author={Tran, Anh and Wildey, Tim and McCann, Scott},
  journal = {Journal of Computing and Information Science in Engineering},
  year={2020},
  volume={20},
  number={3},
  pages={1--15},
}
```

3. https://asmedigitalcollection.asme.org/IDETC-CIE/proceedings-abstract/IDETC-CIE2019/V001T02A073/1069648
```
@inproceedings{tran2019sbfbo2cogp,
  title={{sBF-BO-2CoGP: A sequential bi-fidelity constrained Bayesian optimization for design applications}},
  author={Tran, Anh and Wildey, Tim and McCann, Scott},
  booktitle={Proceedings of the ASME 2019 IDETC/CIE},
  year = {2019},
  month = {08},
  volume = {Volume 1: 39th Computers and Information in Engineering Conference},
  series = {International Design Engineering Technical Conferences and Computers and Information in Engineering Conference},
  organization={American Society of Mechanical Engineers},
  note = {V001T02A073},
}
```

## Acknowledgment

The views expressed in the article do not necessarily represent the views of the U.S. Department of Energy or the United States Government. Sandia National Laboratories is a multimission laboratory managed and operated by National Technology and Engineering Solutions of Sandia, LLC., a wholly owned subsidiary of Honeywell International, Inc., for the U.S. Department of Energy’s National Nuclear Security Administration under Contract No. DE-NA-0003525.