#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate sdwebui

rm -rf ~/.cache/*
rm -rf stable-diffusion-webui/output/*

df -h | grep -E 'Avail|home'
du -h --max-depth=1 ~

conda deactivate
