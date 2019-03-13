#!/bin/bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# NOTE: Directory paths have been removed to  
# 		preserve work space security
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cd $wd
###########################################################################################################
### 								 			BMI 2018	   											###
###########################################################################################################
#European Ancestry (EA) 
echo "R --file="$RFILE" -q --args \
plink "$PLINK"  \
target "$GENE" \
base "$BMI_2018_file" \
keep "$EA_KEEP" \
binary.target F \
debug.mode T plink.slient F \
report.best.score.only F report.individual.scores T fastscore T \
no.regression T cleanup F clump.snps F prune.snps F \
covary F figname AH_BMI_2018_EA \
wd $SAVE_geno" > EA_BMI_2018.sh
#Change properties
chmod 700 EA_BMI_2018.sh
dos2unix EA_BMI_2018.sh
# Submit the SLURM job
sbatch EA_BMI_2018.sh


######################################################################
#					CLUMPING
######################################################################
for i in 1 5 
do
for j in 500
do
mkdir /${SAVE_geno}/clump_LD.${i}_${j}/
echo "R --file="$RFILE" -q --args \
plink "$PLINK"  \
target "$GENE" \
base "$BMI_2018_file" \
keep "$EA_KEEP" \
binary.target F \
debug.mode T plink.slient F \
report.best.score.only F report.individual.scores T fastscore T \
no.regression T cleanup F clump.snps F prune.snps F \
clump.snps T clump.p1 1 clump.p2 1 clump.r2 0."$i" clump.kb "$j" \
covary F \
figname AH_BMI_2018_EA_GC_LD."$i"_"$j" \
wd "$SAVE_geno"/clump_LD."$i"_"$j"/" > EA_BMI_GC_LD.${i}_${j}.sh
#Change properties
chmod 700 EA_BMI_GC_LD.${i}_${j}.sh
dos2unix EA_BMI_GC_LD.${i}_${j}.sh
#Submit code
./EA_BMI_GC_LD.${i}_${j}.sh
done
done


