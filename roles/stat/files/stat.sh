#!/bin/sh
set -eu

OUTPUT=""

TS="ts:$(date +%s)\\t"
LOADAVE="$(uptime | awk '{print $10 $11 $12}' | sed -e s/,/" "/g | awk '{print "load_1m:"$1"\\t""load_3m:"$2"\\t""load_15m:"$3"\\t"}')"
MEMORY="$(free | grep Mem | awk '{print "mem_total:"$2"\\tmem_used:"$3"\\tmem_free:"$4"\\tmem_shared:"$5"\\tmem_buffers:"$6"\\tmem_cached:"$6"\\t"}')"

OUTPUT=$TS$LOADAVE$MEMORY

echo $OUTPUT
