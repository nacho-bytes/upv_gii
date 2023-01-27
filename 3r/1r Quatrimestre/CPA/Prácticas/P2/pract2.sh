#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa
OMP_NUM_THREADS=4 OMP_SCHEDULE=dynamic ./restore3 -i grande.ppm -o restore3.ppm -b 2