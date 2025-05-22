FROM n8nio/n8n:1.93.0

EXPOSE 5678

ENV N8N_CUSTOM_EXTENSIONS="/home/node/custom/n8n-nodes-gmail-mcp:/home/node/custom/n8n-nodes-google-sheets-mcp:/home/node/custom/n8n-nodes-notion-mcp"

RUN mkdir -p /home/node/custom && chown -R node:node /home/node/custom

COPY --chown=node:node ./n8n-nodes-gmail-mcp /home/node/custom/n8n-nodes-gmail-mcp
COPY --chown=node:node ./n8n-nodes-google-sheets-mcp /home/node/custom/n8n-nodes-google-sheets-mcp
COPY --chown=node:node ./n8n-nodes-notion-mcp /home/node/custom/n8n-nodes-notion-mcp

# --- NOUVELLE LIGNE AJOUTÉE ICI ---
# Installe TypeScript globalement pour que 'tsc' soit disponible.
# Il est préférable de le faire en tant que root, puis de passer à l'utilisateur 'node'.
RUN npm install -g typescript
# --- FIN DE LA NOUVELLE LIGNE ---

USER node

RUN cd /home/node/custom/n8n-nodes-gmail-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-google-sheets-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-notion-mcp && npm install && npm run build