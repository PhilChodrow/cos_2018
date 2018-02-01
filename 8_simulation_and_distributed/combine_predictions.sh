#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=00:10:00
#SBATCH --partition=sched_mit_sloan_batch

module load engaging/julia/0.6.1
julia combine_predictions.jl 50 listings_clean_test.csv predictions > random_forest_r2.txt
