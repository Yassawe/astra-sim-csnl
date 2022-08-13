#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../../inputs/network/analytical/dgx1.json
SYSTEM="${SCRIPT_DIR:?}"/../../inputs/system/dgx1.txt
WORKLOAD_DIR="${SCRIPT_DIR:?}"/../workload
STATS="${SCRIPT_DIR:?}"/../results

rm -rf "${STATS}"
mkdir "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/out_DATA.txt \
--path="${STATS}/" \
--run-name="backward_overlap" \
--num-passes=5 \
--total-stat-rows=3 \
--stat-row=0

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/out_DATA_NO_OVERLAP.txt \
--path="${STATS}/" \
--run-name="no_overlap" \
--num-passes=5 \
--total-stat-rows=3 \
--stat-row=1

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/out_DATA_FORWARD_OVERLAP.txt \
--path="${STATS}/" \
--run-name="forward_overlap" \
--num-passes=5 \
--total-stat-rows=3 \
--stat-row=2 

