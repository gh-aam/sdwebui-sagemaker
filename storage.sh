#!/bin/bash

rm -rf ~/.cache/*
rm -rf stable-diffusion-webui/output/*

df -h | grep -E 'Avail|home'
du -h --max-depth=1 ~
