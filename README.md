# lrna-amber
Correction to AMBER force field for simulating L-RNA. 

This repository contains the following files: 
- leaprc.ff14SB: leap file for loading the force field
- parm10_LRNA.dat: leap file corrected for L-RNA
- nucleic12_LRNA.lib: leap new library for L-RNA
- nucleic10.in: leap file with L-ribonucleotides added
- executable script (install.sh)
- exemplary .pdb file to test the modified force field

All these files can be readily used with AMBER 14 package.

# Installation
Prerequisites: bash and Amber14 installed (not tested with Amber15). $AMBERHOME must be set properly.

I. Automatic (recommended): ./install.sh
The script will handle all the steps mentioned below as "manual installation". It will also backup leaprc.ff14SB and nucleic10.in before overwriting them.

II. Manual installation.
Copy the following files to appropriate Amber directories:
- leaprc.ff14SB to  $AMBERHOME/dat/leap/cmd (OVERWRITE)
- parm10_LRNA.dat to  $AMBERHOME/dat/leap/parm
- nucleic12_LRNA.lib to  $AMBERHOME/dat/leap/lib
- nucleic10.in to  $AMBERHOME/dat/leap/prep (OVERWRITE)

# Using

Please see the example in "example" directory. It consists of a small PDB file with 4-nt long heterochiral duplex + a LEaP script.

The topology and coordinates (*.top and *.crd) of systems containing L-RNA can be later used with other MD packages (e.g. NAMD).

# Citing
If you find my work useful, please acknowledge the source by citing:
Marta Dudek, Joanna Trylska, Molecular dynamics simulations of L-RNA involving homo and heterochiral complexes.

If you need further assistance, feel free to contact me at mdudek at cent dot uw dot edu dot pl.
