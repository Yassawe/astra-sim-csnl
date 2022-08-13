#! /bin/bash -x

SCRIPT_DIR=$(dirname "$(realpath $0)")

for i in {0..99}
do 
    "$SCRIPT_DIR"/python3 modify_compute.py --scaleindex "$i"
    "$SCRIPT_DIR"/run_cnn.sh
    "$SCRIPT_DIR"/python3 get_iter_time.py
done 


