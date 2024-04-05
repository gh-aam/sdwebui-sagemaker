#!/bin/bash

conda create -y -n sdwebui python=3.10 glib
eval "$(conda shell.bash hook)"
conda activate sdwebui

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

conda deactivate
