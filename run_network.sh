#!/bin/bash
#SBATCH --job-name=rs2_cpu_benchmark
#SBATCH --output=cpu_benchmark.out
#SBATCH --reservation=fri
#...
GEM5_WORKSPACE=/d/hpc/projects/FRI/GEM5/gem5_workspace
GEM5_ROOT=$GEM5_WORKSPACE/gem5
GEM_PATH=$GEM5_ROOT/build/RISCV_ALL_RUBY

for cores in 2 4 8 16
do
    # srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_network_out/${cores}network_pt2pt ./network/network_benchmark.py --num_cores=${cores} --network=pt2pt
    srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_network_out/${cores}network_circle ./network/network_benchmark.py --num_cores=${cores} --network=circle
    # srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_network_out/${cores}network_crossbar ./network/network_benchmark.py --num_cores=${cores} --network=crossbar
done