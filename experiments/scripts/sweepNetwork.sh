#! /bin/bash -x

SCRIPT_DIR=$(dirname "$(realpath $0)")
OUT_DIR = "$SCRIPT_DIR"/../output/sweepNetwork

rm "$OUT_DIR"/output.txt

for i in {0..6}
do 
    python3 "$SCRIPT_DIR"/modify_network.py --index "$i"
    "$SCRIPT_DIR"/run_cnn.sh
    python3 "$SCRIPT_DIR"/get_iter_time.py
done 


