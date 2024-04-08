#!/bin/bash

if [ ! -d "/home/studio-lab-user/.conda/envs/automatic" ]; then
    conda create -y -n automatic python=3.10 glib
fi

if [ ! -d "stable-diffusion-webui" ]; then
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
fi

cd stable-diffusion-webui
git pull

cd ..
if [ ! -f "ngrok_data.txt" ]; then
    read -p "Enter Ngrok token: " TOKEN
    echo $TOKEN > ngrok_data.txt
else
    read -p "Ngrok token found! Reset? (y/N/O): " RESET_OPTION
    case "$RESET_OPTION" in
        [yY]*)
            read -p "Enter Ngrok token: " TOKEN
            echo $TOKEN > ngrok_data.txt
            ;;
        [nN]*)
            ;;
        *)
            ;;
    esac
fi
NGROK_TOKEN=$(cat ngrok_data.txt)

cd stable-diffusion-webui
eval "$(conda shell.bash hook)"
conda activate automatic
python launch.py --ngrok $NGROK_TOKEN --api --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark
