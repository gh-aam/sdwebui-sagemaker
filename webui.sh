#!/bin/bash

if [ ! -d "/home/studio-lab-user/.conda/envs/automatic" ] && [ ! -d "stable-diffusion-webui" ]; then
    sh setup.sh
elif [ ! -d "/home/studio-lab-user/.conda/envs/automatic" ]; then
    conda create -y -n automatic python=3.10 glib
elif [ ! -d "stable-diffusion-webui" ]; then
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
fi

sh launch.sh
