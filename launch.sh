#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate sdwebui

cd stable-diffusion-webui
git pull
if [[ "$1" == "--reset" ]] || [[ -z "$NGROK_TOKEN" ]]; then
    read -p "Enter Ngrok token: " NGROK_TOKEN
    export NGROK_TOKEN
fi
python launch.py --ngrok $NGROK_TOKEN --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark

conda deactivate
