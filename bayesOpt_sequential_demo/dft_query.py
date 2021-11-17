#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
adopted from dakota/6.15/dakota-6.15.0-public-src-cli/dakota-examples/official/global_sensitivity/Ishigami.py
"""
from __future__ import division, print_function, unicode_literals, absolute_import
from io import open

from math import sin
import sys
import numpy as np

params_file, output_file = sys.argv[1:]


# i_ = np.loadtxt('params.in')

i_ = np.empty(2)
with open(params_file,'rt',encoding='utf8') as FF:
  FF.readline() # Skip first line
  i_[0] = float(FF.readline().split()[0])
  i_[1] = float(FF.readline().split()[0])

if len(i_) != 2:
  print('len(i_) != 2. Error!')

# round to nearest integer
i_ = np.round(i_, 0)

# get the last component
i = np.empty(3)
i[:2] = i_
i[2] = 54 - np.sum(i_)

# look up result
inTable = np.loadtxt('input.hf.dat')
outTable = np.loadtxt('output.hf.dat')

# specify constraint: c must be negative
tol = 1e-1
c = np.sum(i[:2]) - 54 - tol
print(c)
print(i)
if c < 0:
  right_index = np.where(np.all(inTable==i,axis=1))[0][0]
  o = outTable[right_index]
  o *= -1
else:
  o = 0 # violated constraint

# constraint definition

# oFile = open('results.out', 'w')
oFile = open(output_file, 'w')
oFile.write('%.6e %d' % (o, c))
oFile.close()
 
# with open(output_file,'wt',encoding='utf8') as FF:
#   FF.write('{:0.15e} dft_query'.format(o))

# print('dft_query.py: input  = [%d, %d, %d]\n' (i[0], i[1], i[2]))
# print('dft_query.py: output = %.6f\n' (o)
# print('\n')

# logFile = open('debug.log', 'a')
# logFile.write('dft_query.py: input  = [%d, %d, %d]\n' (i[0], i[1], i[2]))
# logFile.write('dft_query.py: output = %.6f\n' (o)
# logFile.write('\n')
# logFile.close()
