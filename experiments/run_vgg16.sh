#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/analytical/dgx1.json
SYSTEM="${SCRIPT_DIR:?}"/../inputs/system/dgx1.txt
WORKLOAD_DIR="${SCRIPT_DIR:?}"/../inputs/workload
STATS="${SCRIPT_DIR:?}"/results/vgg16

rm -rf "${STATS}"
mkdir -p "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/vgg16_vanilla_b32.txt \
--path="${STATS}/" \
--run-name="vgg16_vanilla" \
--num-passes=3 \
--total-stat-rows=3 \
--stat-row=0

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/vgg16_nooverlap_b32.txt \
--path="${STATS}/" \
--run-name="vgg16_nooverlap" \
--num-passes=3 \
--total-stat-rows=3 \
--stat-row=1

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/vgg16_forward_b32.txt \
--path="${STATS}/" \
--run-name="vgg16_forward_overlap" \
--num-passes=3 \
--total-stat-rows=3 \
--stat-row=2 

