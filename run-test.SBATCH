#!/bin/bash

#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=10:00:00
#SBATCH --mem=128GB
#SBATCH --gres=gpu
#SBATCH --job-name=torch

module purge

singularity exec --nv --overlay \
/scratch/$USER/my_env/overlay-15GB-500K.ext3:rw \
/scratch/work/public/singularity/cuda12.3.2-cudnn9.0.0-ubuntu-22.04.4.sif \
/bin/bash \
-c "source /ext3/env.sh; python scripts/training/train_training_based_vectors_yelp.py; python scripts/training/train_training_based_vectors_shakes.py"
