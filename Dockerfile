FROM n8nio/n8n

# Dossier contenant les MCP
COPY ./nodes /data/custom

# Déclare le chemin custom dans la config
ENV N8N_CUSTOM_EXTENSIONS=/data/custom
