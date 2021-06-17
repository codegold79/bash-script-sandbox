#!/bin/bash
##
# This script makes a multi-dimensional array with a single-dimension array.
##

REQUIRED_TOOLS=(
    "kubectl https://kubernetes.io/docs/tasks/tools/"
    "velero https://velero.io/docs/v1.6/basic-install/"
    "blah https://pypi.org/project/blah/"
)

for TOOL in "${REQUIRED_TOOLS[@]}"; do
    TOOL_INFO=(echo $TOOL)

    if [ -z "$(which ${TOOL_INFO[1]})" ]; then
        printf "%s is required. Please refer to %s for installation instructions\n" "${TOOL_INFO[1]}" "${TOOL_INFO[2]}"
        exit 1
    fi
done
