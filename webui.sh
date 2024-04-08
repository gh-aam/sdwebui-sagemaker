#!/bin/bash

if [ ! -d "/home/studio-lab-user/.conda/envs/automatic" ]; then
    conda create -y -n automatic python=3.10 glib
fi

if [ ! -d "stable-diffusion-webui" ]; then
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
fi

SCRIPT_DIR=$(pwd)
cd stable-diffusion-webui
git pull

if [ ! -f "$SCRIPT_DIR/ngrok_data.txt" ]; then
    read -p "Enter Ngrok token: " TOKEN
    echo $TOKEN > $SCRIPT_DIR/ngrok_data.txt
else
    read -p "Ngrok token found! Reset? (Y/N/E): " RESET_OPTION
    case "$RESET_OPTION" in
        [yY]*)
            read -p "Enter Ngrok token: " TOKEN
            echo $TOKEN > $SCRIPT_DIR/ngrok_data.txt
            ;;
        [nN]*)
            ;;
        *)
            ;;
    esac
fi

NGROK_TOKEN=$(cat $SCRIPT_DIR/ngrok_data.txt)
eval "$(conda shell.bash hook)"
conda activate automatic
python launch.py --ngrok $NGROK_TOKEN --api --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark
