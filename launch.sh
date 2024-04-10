#!/bin/bash

cd stable-diffusion-webui
git pull

cd ..
if [ ! -f "$SCRIPT_DIR/ngrok_data.txt" ]; then
    read -p "Enter Ngrok token: " NGROK_TOKEN
    echo $NGROK_TOKEN > $SCRIPT_DIR/ngrok_data.txt
else
    read -p "Ngrok token found! Reset? (y/N/O): " RESET_OPTION
    case "$RESET_OPTION" in
        [yY]*)
            read -p "Enter Ngrok token: " NGROK_TOKEN
            echo $NGROK_TOKEN > $SCRIPT_DIR/ngrok_data.txt
            ;;
        *)
            NGROK_TOKEN=$(cat $SCRIPT_DIR/ngrok_data.txt)
            ;;
    esac
fi

cd stable-diffusion-webui
eval "$(conda shell.bash hook)"
conda activate automatic
python launch.py --ngrok $NGROK_TOKEN --api --listen --xformers --no-half-vae --enable-insecure-extension-access --gradio-queue --theme dark
