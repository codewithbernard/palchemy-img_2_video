# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes
RUN comfy-node-install comfyui-custom-scripts 
RUN comfy-node-install comfyui-easy-use
RUN comfy-node-install comfyui-frame-interpolation
RUN comfy-node-install comfyui-wanvideowrapper

# vae
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors

# diffusion models
RUN comfy model download --url https://huggingface.co/FX-FeiHou/wan2.2-Remix/resolve/main/NSFW/Wan2.2_Remix_NSFW_i2v_14b_high_lighting_v2.0.safetensors --relative-path models/diffusion_models --filename Wan2.2_Remix_NSFW_i2v_14b_high_lighting_v2.0.safetensors
RUN comfy model download --url https://huggingface.co/FX-FeiHou/wan2.2-Remix/resolve/main/NSFW/Wan2.2_Remix_NSFW_i2v_14b_low_lighting_v2.0.safetensors --relative-path models/diffusion_models --filename Wan2.2_Remix_NSFW_i2v_14b_low_lighting_v2.0.safetensors

# text encoders
RUN comfy model download --url https://huggingface.co/NSFW-API/NSFW-Wan-UMT5-XXL/resolve/main/nsfw_wan_umt5-xxl_fp8_scaled.safetensors --relative-path models/text_encoders --filename nsfw_wan_umt5-xxl_fp8_scaled.safetensors

# loras
RUN comfy model download --url https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors --relative-path models/loras --filename Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors --relative-path models/loras --filename Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors
