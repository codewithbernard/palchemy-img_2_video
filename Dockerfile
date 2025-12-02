# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes
RUN comfy-node-install comfyui-kjnodes comfyui-frame-interpolation ComfyUI-WanVideoWrapper
