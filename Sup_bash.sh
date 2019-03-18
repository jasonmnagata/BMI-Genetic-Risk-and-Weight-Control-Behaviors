#!/bin/bash
#SBATCH --job-name=WeightLoss_sup_030819
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=braudt@unc.edu  # email address to send job notification to 

stata15-se -b do AH_WeightLossBehav_SupplementalAnalysis_030819.do 