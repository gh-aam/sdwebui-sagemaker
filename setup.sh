#!/bin/bash

conda create -y -n automatic python=3.10

eval "$(conda shell.bash hook)"
conda activate automatic

conda install -y glib
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

conda deactivate
