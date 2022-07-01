#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/analytical/sample_Switch.json
SYSTEM="${SCRIPT_DIR:?}"/../inputs/system/sample_a2a_sys.txt
WORKLOAD="${SCRIPT_DIR:?}"/../inputs/workload/Resnet50_DataNoOverlap.txt
STATS="${SCRIPT_DIR:?}"/results/run_resnet_nooverlap

rm -rf "${STATS}"
mkdir "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD}" \
--path="${STATS}/" \
--run-name="resnet_nooverlap" \
--num-passes=1 \
--total-stat-rows=1 \
--stat-row=0 

