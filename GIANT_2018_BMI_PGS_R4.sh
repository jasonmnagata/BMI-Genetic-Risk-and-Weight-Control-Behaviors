#!/bin/bash
#SBATCH -o /ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Logs/BMI_2018_Master_Script.out # Standard out goes to this file
#SBATCH -e /ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Logs/BMI_2018_Master_Script_err.out # Standard err goes to this file

# Date
NOW=$(date +"%m-%d-%Y")
# Working directory
wd="/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Syntax"
# Log directory
LOGS="/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Logs"
# Source files and directories 
RFILE="/ifs/sec/cpc/addhealth/users/dbraudt/Keep/PGS_release/Syntax/PRSice_v1-25_AH_master_edited.R" 
PLINK="/ifs/sec/cpc/addhealth/apps/bin/plink" 
GENE="/ifs/sec/cpc/addhealth/gwas/final/data/omni_joined.freeze3.sharedMarkers" 

# ID files
EA_KEEP="/ifs/sec/cpc/addhealth/users/dbraudt/Keep/AH_genotyped_ids/EA_Mean-ids.txt"

# GWAS summary files 
BMI_2018_file="/ifs/sec/cpc/addhealth/users/dbraudt/Keep/PGS_Data_Downloads/GIANT_BMI_2018/GIANT_BMI_2018.basefile_increasing_allele.txt"

SAVE_geno="/ifs/sec/cpc/addhealth/users/dbraudt/Keep/WeightLossBehaviors/Data/GIANT_BMI_2018_PGS"


######################################################################
#					Reviewer's desired clumping
######################################################################
for i in 1 
do
for j in 250
do
mkdir /${SAVE_geno}/clump_LD.${i}_${j}/
echo "#!/bin/bash
#SBATCH --job-name=EA_BMI_2018_Mean
#SBATCH -o $LOGS/BMI_2018_EA_GC_LD_"$i"_"$j".out # Standard out goes to this file
#SBATCH -e $LOGS/BMI_2018_EA_GC_LD_"$i"_"$j"_err.out # Standard err goes to this file
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=braudt@unc.edu  # email address to send job notification to 

R --file="$RFILE" -q --args \
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
