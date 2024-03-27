#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate automatic

# pwd
cd ~/stable-diffusion/stable-diffusion-webui
git pull
read -p "Enter Ngrok Authtoken: " NGROK_AUTHTOKEN
python launch.py --ngrok ${NGROK_AUTHTOKEN} --listen --xformers --no-half-vae --enable-insecure-extension-access --theme dark --gradio-queue
cd ~
# pwd

rm -rf ~/.cache/*
# pwd
rm -rf ~/stable-diffusion/stable-diffusion-webui/output/*
# pwd

df -h | grep -E 'Avail|home'
du -h --max-depth=1 ~

conda deactivate
