#!/bin/bash

cd stable-diffusion-webui

eval "$(conda shell.bash hook)"
conda activate automatic

git pull
read -p "Enter Ngrok token: " NGROK_AUTHTOKEN
python launch.py --ngrok $NGROK_AUTHTOKEN --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark

conda deactivate
