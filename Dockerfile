# ---- Base Image ----
FROM n8n/n8n:1.17.0

# Create directory for custom nodes
RUN mkdir -p /data/custom

# Copy custom MCP nodes (depuis le repo cloné)
COPY ./n8n-nodes-gmail-mcp /data/custom/n8n-nodes-gmail-mcp
COPY ./n8n-nodes-google-sheets-mcp /data/custom/n8n-nodes-google-sheets-mcp
COPY ./n8n-nodes-notion-mcp /data/custom/n8n-nodes-notion-mcp

# Set environment variable for custom extensions
ENV N8N_CUSTOM_EXTENSIONS="/data/custom/n8n-nodes-gmail-mcp:/data/custom/n8n-nodes-google-sheets-mcp:/data/custom/n8n-nodes-notion-mcp"
# Installe les dépendances MCP
RUN cd /data/custom/n8n-nodes-gmail-mcp && npm install && npm run build
RUN cd /data/custom/n8n-nodes-google-sheets-mcp && npm install && npm run build
RUN cd /data/custom/n8n-nodes-notion-mcp && npm install && npm run build

