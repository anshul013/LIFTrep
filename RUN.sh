#!/bin/bash
#SBATCH --job-name=LIFT
#SBATCH --output=LIFTrun1.log
#SBATCH --error=LIFTrun1.err
#SBATCH --mail-user=shroff@master.ismll.de
#SBATCH --partition=STUD
#SBATCH --gres=gpu:1
source activate LIFT
sh LIFT-MAIN/Weather.sh
