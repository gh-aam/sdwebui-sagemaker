#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate sdwebui

cd stable-diffusion-webui
git pull
read -p "Enter Ngrok token: " NGROK_TOKEN
python launch.py --ngrok $NGROK_TOKEN --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark

conda deactivate
