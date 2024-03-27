```
cd ~ && conda create -y -n automatic python=3.10 glib=2.51.0
```

```
cd ~ && conda activate automatic
```

```
mkdir -p ~/stable-diffusion
```

```
cd ~/stable-diffusion && git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

```
cd ~ && conda deactivate
```
