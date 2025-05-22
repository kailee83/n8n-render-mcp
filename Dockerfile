FROM n8nio/n8n:1.93.0

EXPOSE 5678

ENV N8N_CUSTOM_EXTENSIONS="/home/node/custom/n8n-nodes-gmail-mcp:/home/node/custom/n8n-nodes-google-sheets-mcp:/home/node/custom/n8n-nodes-notion-mcp"

RUN mkdir -p /home/node/custom && chown -R node:node /home/node/custom

# Copie les fichiers de vos nœuds personnalisés.
COPY ./n8n-nodes-gmail-mcp /home/node/custom/n8n-nodes-gmail-mcp
COPY ./n8n-nodes-google-sheets-mcp /home/node/custom/n8n-nodes-google-sheets-mcp
COPY ./n8n-nodes-notion-mcp /home/node/custom/n8n-nodes-notion-mcp

# --- AJOUTEZ CES LIGNES POUR LE DÉBOGAGE ---
# Elles afficheront ce qui se trouve dans /home/node/custom après la copie
RUN echo "--- Début du débogage : Contenu de /home/node/custom après COPY ---"
RUN ls -la /home/node/custom/
RUN echo "--- Fin du débogage ---"

# Elles afficheront le contenu de l'un des dossiers de nœuds (pour vérifier qu'il est bien là)
RUN echo "--- Début du débogage : Contenu de /home/node/custom/n8n-nodes-gmail-mcp ---"
RUN ls -la /home/node/custom/n8n-nodes-gmail-mcp/
RUN echo "--- Fin du débogage ---"
# --- FIN DES LIGNES DE DÉBOGAGE ---

# Change la propriété des répertoires copiés (et de leur contenu) à l'utilisateur 'node'.
# C'est cette ligne qui a échoué précédemment.
RUN chown -R node:node /home/node/custom/n8n-nodes-gmail-mcp && \
    chown -R node:node /home/node/custom/n8n-nodes-google-sheets-mcp && \
    chown -R node:node /home/node/custom/n8n-nodes-notion-mcp

USER node

RUN cd /home/node/custom/n8n-nodes-gmail-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-google-sheets-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-notion-mcp && npm install && npm run build
