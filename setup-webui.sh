#!/bin/bash

conda create -y -n automatic python=3.10 glib=2.51.0

eval "$(conda shell.bash hook)"
conda activate automatic

cd ~
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

conda deactivate
