#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate sdwebui

cd stable-diffusion-webui
git pull
cd ..

if [[ "$1" == "--reset" ]]; then
    read -p "Enter Ngrok token: " NGROK_TOKEN
    echo "$NGROK_TOKEN" > "ngrok_data.txt"
fi

if [[ -f "ngrok_data.txt" ]]; then
    NGROK_TOKEN=$(cat "ngrok_data.txt")
else
    read -p "Enter Ngrok token: " NGROK_TOKEN
    echo "$NGROK_TOKEN" > "ngrok_data.txt"
fi

cd stable-diffusion-webui
python launch.py --ngrok $NGROK_TOKEN --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark

conda deactivate
