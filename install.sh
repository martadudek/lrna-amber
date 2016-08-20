#!/bin/bash
set -e

[[ -z $AMBERHOME ]] && echo "ERROR: AMBERHOME is not set"  && exit 1
[[ ! -d $AMBERHOME ]] && echo "ERROR: AMBERHOME points to invalid location: $AMBERHOME" && exit 1

echo "Creating backup for $AMBERHOME/dat/leap/cmd/leaprc.ff14SB as $AMBERHOME/dat/leap/cmd/leaprc_BACKUP.ff14SB"
cp $AMBERHOME/dat/leap/cmd/leaprc.ff14SB $AMBERHOME/dat/leap/cmd/leaprc_BACKUP.ff14SB
echo "Creating backup for $AMBERHOME/dat/leap/prep/nucleic10.in as $AMBERHOME/dat/leap/prep/nucleic10_BACKUP.in"
cp $AMBERHOME/dat/leap/prep/nucleic10.in $AMBERHOME/dat/leap/prep/nucleic10_BACKUP.in
echo "Overwriting $AMBERHOME/dat/leap/cmd/leaprc.ff14SB with L-RNA-friendly version" 
cp leaprc.ff14SB $AMBERHOME/dat/leap/cmd/leaprc.ff14SB
echo "Overwriting $AMBERHOME/dat/leap/prep/nucleic10.in with L-RNA-friendly version"
cp nucleic10.in $AMBERHOME/dat/leap/prep/nucleic10.in

echo "Copying parm10_LRNA.dat to $AMBERHOME/dat/leap/parm/"
cp parm10_LRNA.dat $AMBERHOME/dat/leap/parm/
echo "Copying nucleic12_LRNA.lib to $AMBERHOME/dat/leap/lib/"
cp nucleic12_LRNA.lib $AMBERHOME/dat/leap/lib/

echo "Success"
