#!/bin/bash

if [ ! -d "stable-diffusion-webui" ]; then
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
fi
cd stable-diffusion-webui
git pull

conda create -y -n automatic python=3.10 glib
eval "$(conda shell.bash hook)"
conda activate automatic

read -p "Enter Ngrok token: " NGROK_TOKEN
python launch.py --ngrok $NGROK_TOKEN --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue
