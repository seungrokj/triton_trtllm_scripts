== meta-llama/Llama-3.1-70B-Instruct example ==

-1. clone triton-inference-server/tensorrtllm_backend repo
git clone -b v0.16.0 https://github.com/triton-inference-server/tensorrtllm_backend.git
cd tensorrtllm_backend
git submodule update --init --recursive
git lfs install
git lfs pull
git clone https://github.com/seungrokj/triton_trtllm_scripts.git -b v0.16.0
cp triton_trtllm_scripts/* .


0. launch triton server with prebuilt trtllm engine ENGINE arg
ENGINE=/home/seungrok/PROJECT/CUDA/DeepLearningModels_v0.16.0/DeepLearningModels/engine/Llama-3.1-70B-Instruct/tp_8_pp_1/ ./0_docker_launch.sh
cd /tensorrtllm_backend/
pip3 install tritonclient[all] tabulate

1. clone triton_trtllm_scripts repo
export HF_TOKEN="your hf token"
python3 1_tokenizer.py --model meta-llama/Llama-3.1-70B-Instruct

2. triton engine setup
./2_engine_setup.sh

3. launch triton TP 8 case
WORLD=8 ./3_triton_launch.sh

5. run benchmark w/ grpc
After these msgs
I0116 02:31:20.994590 304 grpc_server.cc:2558] "Started GRPCInferenceService at 0.0.0.0:8001"
I0116 02:31:20.995336 304 http_server.cc:4725] "Started HTTPService at 0.0.0.0:8000"
I0116 02:31:21.038381 304 http_server.cc:358] "Started Metrics Service at 0.0.0.0:8002"

./4_client.sh
