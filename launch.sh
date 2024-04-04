#!/bin/bash

cd stable-diffusion-webui

eval "$(conda shell.bash hook)"
conda activate automatic

git pull
read -p "Enter Ngrok token: " NGROK_TOKEN
python launch.py --ngrok $NGROK_TOKEN --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark

conda deactivate
