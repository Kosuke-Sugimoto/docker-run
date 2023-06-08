#!/bin/bash
NOW="$(pwd)/"
DATA_DIR="/mnt/hdd1/Datasets/Raw"
CHECK_DIR="/mnt/hdd1/Checkpoints/m1_research"
RESULT_DIR="/mnt/hdd2/Results/m1_research"

docker build -t vc:latest .
docker run --rm -it --name vc --ipc=host \
           --ulimit memlock=-1 --ulimit stack=67108864 \
           --gpus all -p 10000:6006 \
           --mount type=bind,src=$NOW,dst=/work/ \
           --mount type=bind,src=$DATA_DIR,dst=/work/Datasets,readonly \
           --mount type=bind,src=$CHECK_DIR,dst=/work/Checkpoints \
           --mount type=bind,src=$RESULT_DIR,dst=/work/Results \
           vc:latest