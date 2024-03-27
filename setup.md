```
conda create -y -n automatic python=3.10 glib=2.51.0
```

```
conda activate automatic
```

```
mkdir -p ~/stable-diffusion
```

```
cd ~/stable-diffusion && git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && wget https://github.com/gh-aam/sdwebui-sagemakersl/raw/main/webui.sh
```

```
conda deactivate
```
