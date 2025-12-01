# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
# (no custom nodes required by this workflow)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/jasonot/mycomfyui/blob/main/rife47.pth --relative-path models/checkpoints --filename rife47.pth
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
# RUN # Could not find URL for Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors
# RUN # Could not find URL for Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors
# RUN # Could not find URL for Wan2.2_Remix_NSFW_i2v_14b_high_lighting_v2.0.safetensors
# RUN # Could not find URL for Wan2.2_Remix_NSFW_i2v_14b_low_lighting_v2.0.safetensors
# RUN # Could not find URL for nsfw_wan_umt5-xxl_fp8_scaled.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
