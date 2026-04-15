#!/bin/bash
#SBATCH --job-name=rs2_cpu_benchmark
#SBATCH --output=cpu_benchmark.out
#SBATCH --reservation=fri
#...
GEM5_WORKSPACE=/d/hpc/projects/FRI/GEM5/gem5_workspace
GEM5_ROOT=$GEM5_WORKSPACE/gem5
GEM_PATH=$GEM5_ROOT/build/RISCV_ALL_RUBY

#!PART 2
# pprefix_falsesharing.bin
for cores in 2 4 8 16
do
    echo "Running with $cores cores..."
    start=$(date +%s.%N)
    srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_ruby/${cores}cores_falsesharing ./smp_ruby/ruby_benchmark.py --num_cores=${cores}
    end=$(date +%s.%N)
    real_time=$(echo "$end - $start" | bc)
    sim_time=$(grep simSeconds ./smp_ruby/${cores}cores_falsesharing/${cores}cores/stats.txt | awk '{print $2}')
    echo "$cores,$bin,$real_time,$sim_time" >> ${cores}results.txt

    #!OPTIMIZED RUN
    echo "Running with $cores cores..."
    start=$(date +%s.%N)
    srun apptainer exec $GEM5_WORKSPACE/gem5.sif $GEM_PATH/gem5.opt  --outdir=./smp_ruby/${cores}cores_optimized ./smp_ruby/ruby_benchmark.py --num_cores=${cores}
    end=$(date +%s.%N)
    real_time=$(echo "$end - $start" | bc)
    sim_time=$(grep simSeconds ./smp_ruby/${cores}cores_optimized/${cores}cores/stats.txt | awk '{print $2}')
    echo "$cores,$bin,$real_time,$sim_time" >> ${cores}_optimized_results.txt
done
