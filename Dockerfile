FROM n8nio/n8n

ENV N8N_CUSTOM_EXTENSIONS="/data/custom"

COPY ./n8n-nodes-google-calendar /data/custom/n8n-nodes-google-calendar

RUN cd /data/custom/n8n-nodes-google-calendar \
  && npm install \
  && npm run build
