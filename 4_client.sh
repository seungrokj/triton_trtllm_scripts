#!/bin/bash

Req_In_Out=("256:512:64" "256:64:512")
# inf
QPS="-1"
CON="1 2 4 8 16 32 64 128 256"
for con in ${CON[@]}
do
    for req_in_out in ${Req_In_Out[@]}
    do
	req=$(echo $req_in_out | awk -F':' '{ print $1 }')
	inp=$(echo $req_in_out | awk -F':' '{ print $2 }')
	out=$(echo $req_in_out | awk -F':' '{ print $3 }')

	for qps in $QPS
	do
	    echo "req $req inp $inp out $out qps $qps con $con"
	    python3 tools/inflight_batcher_llm/benchmark_core_model.py -i grpc --concurrency $con --max-input-len $inp --num-requests $req --request-rate $qps token-norm-dist --input-mean $inp --input-stdev 0 --output-mean $out --output-stdev 0 
	done
    done
done
