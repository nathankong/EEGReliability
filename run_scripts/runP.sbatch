#!/bin/bash
#
#SBATCH --job-name=rel_p
#SBATCH --output=run_scripts/rel_p.out
#SBATCH --error=run_scripts/rel_p.err
#SBATCH --time=360
#SBATCH --qos=long
#SBATCH -p normal
#SBATCH --nodes=1
#SBATCH --mem=8G
#SBATCH -c 1
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=nclkong@stanford.edu
module load matlab
matlab -nodesktop <<EOF
runReliabilityTimePerSubjectP
clear
runReliabilityP
EOF
