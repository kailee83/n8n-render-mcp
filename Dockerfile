
FROM docker.n8n.io/n8n


EXPOSE 5678

RUN mkdir -p /data/custom

COPY ./n8n-nodes-gmail-mcp /data/custom/n8n-nodes-gmail-mcp
COPY ./n8n-nodes-google-sheets-mcp /data/custom/n8n-nodes-google-sheets-mcp
COPY ./n8n-nodes-notion-mcp /data/custom/n8n-nodes-notion-mcp

ENV N8N_CUSTOM_EXTENSIONS="/data/custom/n8n-nodes-gmail-mcp:/data/custom/n8n-nodes-google-sheets-mcp:/data/custom/n8n-nodes-notion-mcp"

RUN cd /data/custom/n8n-nodes-gmail-mcp && npm install && npm run build && \
    cd /data/custom/n8n-nodes-google-sheets-mcp && npm install && npm run build && \
    cd /data/custom/n8n-nodes-notion-mcp && npm install && npm run build

