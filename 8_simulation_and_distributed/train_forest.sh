#!/bin/bash
#SBATCH -a 1-50
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=00:10:00
#SBATCH --partition=sched_mit_sloan_batch

module load engaging/julia/0.6.1
julia train_forest.jl $SLURM_ARRAY_TASK_ID 10 listings_clean_train.csv