# lrna-amber
Correction to AMBER force field for simulating L-RNA. 

This repository contains the following files: 
- leaprc.ff14SB: leap file for loading the force field
- parm10_LRNA.dat: leap file corrected for L-RNA
- nucleic12_LRNA.lib: new leap library for L-RNA
- nucleic10.in: leap file with L-ribonucleotides
- executable script (install.sh)
- exemplary .pdb file to test the modified force field

All these files can be readily used with AMBER 14 package.

# Rationale
Upon inversion of the system all dihedrals change their sign. Mirror-reflected molecules can be successfully simulated in Amber ff as long as the energy of every torsional angle is symmetric around 0, which used to be the case in the past.
Unfortunately, recent correction to Amber ff (ChiOL3) introduced a few dihedrals that break this fundamental symmetry. Specifically: Amber energies for D-ribose and L-ribose now differ, while they should not. With L-RNA ('Spiegelmers') gaining much traction nowadays, I find it very important to fix this issue. There were two possible ways to do this:

a) symmetrize the ChiOL3 dihedrals, or

b) introduce 'mirror counterpart' for every ChiOL3 dihedral.

I chose the latter way, mostly because ChiOL3 is generally approved and changing it would break backward compatibility. Luckily, it turned out that all nonsymmetric dihedrals contain at least one atom of 'OS' or 'OH' type. I was able to introduce mirror images of ChiOL3 dihedrals, with 'OS' and 'OH' atoms renamed to 'LD' and 'LH'. Then I defined enantiomers of standard nucleotides (LA, LC, LG, LU) and pointed them to use my new dihedral parameters. 
Now single-point energies for RNA enantiomers do agree and MD simulations can benefit from both: 1) ChiOL3 and 2) symmetry upon parity transformation.

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

Marta Dudek, Joanna Trylska
,,Molecular Dynamics Simulations of L-RNA Involving Homo- and Heterochiral Complexes''
Journal of Chemical Theory and Computation, February 2017
DOI: 10.1021/acs.jctc.6b01075
link: http://pubs.acs.org/doi/abs/10.1021/acs.jctc.6b01075

If you need further assistance, feel free to contact me at mdudek at cent dot uw dot edu dot pl
