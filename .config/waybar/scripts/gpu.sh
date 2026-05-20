#!/bin/bash
GPU_UTIL=$(cat /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -1)
GPU_TEMP=$(cat /sys/class/drm/card*/device/hwmon/hwmon*/temp1_input 2>/dev/null | head -1)

if [ -z "$GPU_UTIL" ]; then
    echo '{"text": "N/A", "tooltip": "GPU data unavailable"}'
    exit
fi

TEMP_C=$((GPU_TEMP / 1000))

echo "{\"text\": \"󰾲  ${GPU_UTIL}%\", \"tooltip\": \"GPU: ${GPU_UTIL}%\nTemp: ${TEMP_C}°C\"}"
