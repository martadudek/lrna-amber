# lrna-amber
Correction to AMBER force field for simulating L-RNA. 

This repository contains the following files: 
- leaprc.ff14SB: leap file for loading the force field
- parm10_LRNA.dat: leap file corrected for l-RNA
- nucleic12_LRNA.lib: leap new library for l-RNA
- nucleic10.in: leap file with l-ribonucleotides added
- executable script (install.sh)
- exemplary .pdb file to test the modified force field

All these files can be readily used with AMBER 14 package.

# Installation
Prerequisites: bash and Amber14 installed (not tested with Amber15). $AMBERHOME must be set properly.

I. Automatic: ./install.sh.
The script will handle all the steps mentioned in manual installation. It will also backup leaprc.ff14SB and nucleic10.in before overwriting.

II. Manual installation.
Copy the following files to appropriate Amber directories:
- leaprc.ff14SB to  $AMBERHOME/dat/leap/cmd (OVERWRITE)
- parm10_LRNA.dat to  $AMBERHOME/dat/leap/parm
- nucleic12_LRNA.lib to  $AMBERHOME/dat/leap/lib
- nucleic10.in to  $AMBERHOME/dat/leap/prep (OVERWRITE)

# Using

The topology and coordinates (*.top and *.crd) of systems containing L-RNA can be later used with other MD packages (e.g. NAMD).
Please see the example in example directory.

# Citing
If you find it useful, please acknowledge its use by citing: 
Marta Dudek, Joanna Trylska, Molecular dynamics simulations of L-RNA involving homo and heterochiral complexes.

IF you need further assistance, feel free to contact me at mdudek at cent dot uw dot edu dot pl.
