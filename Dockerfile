FROM nginx:1.27-alpine

# Traefik entrega o path /ofertawhats ao container sem strippar o prefixo — por isso
# os arquivos moram num diretorio com esse nome, e nao na raiz do html.
COPY index.html /usr/share/nginx/html/ofertawhats/index.html
COPY assets/ /usr/share/nginx/html/ofertawhats/assets/
