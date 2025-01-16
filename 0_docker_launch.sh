docker run -it --net host --shm-size=256g \
    --ulimit memlock=-1 --ulimit stack=67108864 --gpus all \
    -v $(pwd):/tensorrtllm_backend \
    -v $ENGINE:/engines \
    --name triton_trtllm_container \
    nvcr.io/nvidia/tritonserver:24.12-trtllm-python-py3
