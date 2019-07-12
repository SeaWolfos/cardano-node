#!/usr/bin/env bash

now=`date "+%Y-%m-%d 00:00:00"`

set -x
stack exec cardano-node -- \
    --system-start "$now" --slot-duration 4 \
    --log-config configuration/log-configuration.yaml \
    node -t configuration/simple-topology.json \
         $@
