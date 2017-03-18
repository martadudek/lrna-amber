# lrna-amber
Correction to AMBER force field for simulating L-RNA. 
THIS IS A NEW, RELEASE-CANDIDATE VERSION, DEDICATED FOR AMBER16. FOR AMBER14 PLEASE REFER TO THE `master' BRANCH.

This repository contains the following files: 
- leaprc.ff14SB: leap file for loading the force field
- parm10_LRNA.dat: leap file corrected for L-RNA
- nucleic12_LRNA.lib: new leap library for L-RNA
- nucleic10.in: leap file with L-ribonucleotides
- executable script (install.sh)
- exemplary .pdb file to test the modified force field

All these files can be readily used with Amber16 package.

# Installation
Prerequisites: bash and Amber16. $AMBERHOME must be set properly.

I. Automatic (recommended): ./install.sh
The script will handle all the steps mentioned below as "manual installation". It will also backup leaprc.ff14SB and nucleic10.in before overwriting them.

II. Manual installation.
Copy the following files to appropriate Amber directories:
- leaprc.ff14SB to  $AMBERHOME/dat/leap/cmd/oldff (OVERWRITE)
- parm10_LRNA.dat to  $AMBERHOME/dat/leap/parm
- nucleic12_LRNA.lib to  $AMBERHOME/dat/leap/lib
- nucleic10.in to  $AMBERHOME/dat/leap/prep (OVERWRITE)

# Using
Please see the example in "example" directory. It consists of a small PDB file with 4-nt long heterochiral duplex + a LEaP script.
Please note that my L-RNA correction to Amber14 slightly differs from this one. Here, L-nucleosides have PDB codes such as LA0, LC0, LG0, LU0 (previously: LA, LC, LG, LU). This had to be done due to a name clash (LA and LU were introduced in Amber16 to denote lanthane and lutetium, respectively). The example accounts for this, so have a look at it.

The topology and coordinates (*.top and *.crd) of systems containing L-RNA can be later used with other MD packages (e.g. NAMD).

# Citing
If you find my work useful, please acknowledge the source by citing:

Marta Dudek, Joanna Trylska
,,Molecular Dynamics Simulations of L-RNA Involving Homo- and Heterochiral Complexes''
Journal of Chemical Theory and Computation, February 2017
DOI: 10.1021/acs.jctc.6b01075
link: http://pubs.acs.org/doi/abs/10.1021/acs.jctc.6b01075

If you need further assistance, feel free to contact me at mdudek at cent dot uw dot edu dot pl
