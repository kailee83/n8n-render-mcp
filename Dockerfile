FROM n8nio/n8n:1.93.0

EXPOSE 5678

ENV N8N_CUSTOM_EXTENSIONS="/home/node/custom/n8n-nodes-gmail-mcp:/home/node/custom/n8n-nodes-google-sheets-mcp:/home/node/custom/n8n-nodes-notion-mcp"

RUN mkdir -p /home/node/custom && chown -R node:node /home/node/custom

COPY --chown=node:node ./n8n-nodes-gmail-mcp /home/node/custom/n8n-nodes-gmail-mcp
COPY --chown=node:node ./n8n-nodes-google-sheets-mcp /home/node/custom/n8n-nodes-google-sheets-mcp
COPY --chown=node:node ./n8n-nodes-notion-mcp /home/node/custom/n8n-nodes-notion-mcp

# --- DÉBUT DES MODIFICATIONS CLÉS POUR TypeScript ---
# Temporairement passer à l'utilisateur 'root' pour l'installation globale
USER root
RUN npm install -g typescript
# Revenir à l'utilisateur 'node' pour toutes les opérations suivantes
USER node
# --- FIN DES MODIFICATIONS CLÉS POUR TypeScript ---

RUN cd /home/node/custom/n8n-nodes-gmail-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-google-sheets-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-notion-mcp && npm install && npm run build