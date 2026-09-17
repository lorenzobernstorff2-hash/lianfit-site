FROM nginx:1.27-alpine

# Traefik entrega o path /ofertawhats ao container sem strippar o prefixo — por isso
# os arquivos moram num diretorio com esse nome, e nao na raiz do html.
COPY index.html /usr/share/nginx/html/ofertawhats/index.html
COPY assets/ /usr/share/nginx/html/ofertawhats/assets/
# Página de retorno do checkout por cartão (Asaas manda o pagador pra cá).
COPY obrigado/index.html /usr/share/nginx/html/ofertawhats/obrigado/index.html
# Página de planos (teste de porta falsa do semestral, 09/2026).
COPY planos/index.html /usr/share/nginx/html/ofertawhats/planos/index.html
