#! /bin/bash -x

SCRIPT_DIR=$(dirname "$(realpath $0)")

for i in {0..99}
do 
    python3 "$SCRIPT_DIR"/modify_compute.py --scaleindex "$i"
    "$SCRIPT_DIR"/run_cnn.sh
    python3 "$SCRIPT_DIR"/get_iter_time.py
done 


