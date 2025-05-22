FROM n8nio/n8n:1.93.0

EXPOSE 5678

ENV N8N_CUSTOM_EXTENSIONS="/home/node/custom/n8n-nodes-gmail-mcp:/home/node/custom/n8n-nodes-google-sheets-mcp:/home/node/custom/n8n-nodes-notion-mcp"

# Crée le répertoire et le rend la propriété de l'utilisateur 'node'.
# C'est une bonne pratique, même si les fichiers copiés par la suite peuvent écraser les permissions.
RUN mkdir -p /home/node/custom && chown -R node:node /home/node/custom

# Copie les fichiers de vos nœuds personnalisés.
# Ces fichiers seront la propriété de 'root' par défaut après cette étape.
COPY ./n8n-nodes-gmail-mcp /home/node/custom/n8n-nodes-gmail-mcp
COPY ./n8n-nodes-google-sheets-mcp /home/node/custom/n8n-nodes-google-sheets-mcp
COPY ./n8n-nodes-notion-mcp /home/node/custom/n8n-nodes-notion-mcp

# --- DÉBUT DES MODIFICATIONS CLÉS ---

# Change la propriété des répertoires copiés (et de leur contenu) à l'utilisateur 'node'.
# C'est l'étape CRUCIALE qui manquait. Elle doit venir APRÈS les commandes COPY.
RUN chown -R node:node /home/node/custom/n8n-nodes-gmail-mcp && \
    chown -R node:node /home/node/custom/n8n-nodes-google-sheets-mcp && \
    chown -R node:node /home/node/custom/n8n-nodes-notion-mcp

# Passe à l'utilisateur 'node'.
# C'est important pour que les commandes 'npm install' s'exécutent avec les bonnes permissions.
USER node

# --- FIN DES MODIFICATIONS CLÉS ---

# Exécute les commandes npm install et build.
# Maintenant, l'utilisateur 'node' aura les permissions d'écrire dans les répertoires.
RUN cd /home/node/custom/n8n-nodes-gmail-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-google-sheets-mcp && npm install && npm run build && \
    cd /home/node/custom/n8n-nodes-notion-mcp && npm install && npm run build