MODEL_FOLDER=/triton_model_repo
python3 /tensorrtllm_backend/scripts/launch_triton_server.py --world_size=$WORLD --model_repo=${MODEL_FOLDER}
