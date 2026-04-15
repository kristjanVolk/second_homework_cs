#!/bin/bash
#SBATCH --job-name=rs2_cpu_benchmark
#SBATCH --output=cpu_benchmark.out
#SBATCH --reservation=fri
#...
GEM5_WORKSPACE=/d/hpc/projects/FRI/GEM5/gem5_workspace
GEM5_ROOT=$GEM5_WORKSPACE/gem5
GEM_PATH=$GEM5_ROOT/build/RISCV

#srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_classic_out/2cores ./smp_classic/smp_benchmark.py --num_cores=2
#srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_classic_out/4cores ./smp_classic/smp_benchmark.py --num_cores=4
#srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_classic_out/8cores ./smp_classic/smp_benchmark.py --num_cores=8
#srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_classic_out/16cores ./smp_classic/smp_benchmark.py --num_cores=16

