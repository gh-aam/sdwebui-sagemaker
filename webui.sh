#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate automatic

cd ~/stable-diffusion/stable-diffusion-webui

git pull

read -p "Enter Ngrok Authtoken: " NGROK_AUTHTOKEN
python launch.py --ngrok ${NGROK_AUTHTOKEN} --listen --xformers --no-half-vae --enable-insecure-extension-access --theme dark --gradio-queue

conda deactivate
