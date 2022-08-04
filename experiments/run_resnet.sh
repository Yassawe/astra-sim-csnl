#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/analytical/switch.json
SYSTEM="${SCRIPT_DIR:?}"/../inputs/system/switch.txt
WORKLOAD_DIR="${SCRIPT_DIR:?}"/../inputs/workload
STATS="${SCRIPT_DIR:?}"/results/resnet50

rm -rf "${STATS}"
mkdir -p "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/Resnet50_vanilla.txt \
--path="${STATS}/" \
--run-name="resnet_vanilla" \
--num-passes=10 \
--total-stat-rows=3 \
--stat-row=0 


"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/Resnet50_nooverlap.txt \
--path="${STATS}/" \
--run-name="resnet_nooverlap" \
--num-passes=10 \
--total-stat-rows=3 \
--stat-row=1 

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/Resnet50_forward.txt \
--path="${STATS}/" \
--run-name="resnet_forward_overlap" \
--num-passes=10 \
--total-stat-rows=3 \
--stat-row=2 