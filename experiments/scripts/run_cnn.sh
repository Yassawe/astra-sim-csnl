#! /bin/bash -v

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
BINARY="${SCRIPT_DIR:?}"/../../build/astra_analytical/build/AnalyticalAstra/bin/AnalyticalAstra
NETWORK="${SCRIPT_DIR:?}"/../inputs/network/output.json
SYSTEM="${SCRIPT_DIR:?}"/../../inputs/system/switch.txt
WORKLOAD_DIR="${SCRIPT_DIR:?}"/../inputs/workload
STATS="${SCRIPT_DIR:?}"/../results

rm -rf "${STATS}"
mkdir "${STATS}"

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/out_DATA.txt \
--path="${STATS}/" \
--run-name="backward_overlap" \
--num-passes=50 \
--total-stat-rows=3 \
--stat-row=0

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/out_DATA_NO_OVERLAP.txt \
--path="${STATS}/" \
--run-name="no_overlap" \
--num-passes=50 \
--total-stat-rows=3 \
--stat-row=1

"${BINARY}" \
--network-configuration="${NETWORK}" \
--system-configuration="${SYSTEM}" \
--workload-configuration="${WORKLOAD_DIR}"/out_DATA_FORWARD_OVERLAP.txt \
--path="${STATS}/" \
--run-name="forward_overlap" \
--num-passes=50 \
--total-stat-rows=3 \
--stat-row=2 

