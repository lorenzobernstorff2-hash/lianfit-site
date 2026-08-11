# lianfit-site

Página única do LianFit — `https://lianfit.com.br/ofertawhats/`.

HTML estático servido por nginx. **Sem build, sem framework, sem dependência.** Editar é abrir `index.html`.

| | |
|---|---|
| `index.html` | a página inteira (CSS inline) |
| `assets/` | lockups em SVG, fontes woff2, OG image, ícone |
| `Dockerfile` | nginx + copiar os arquivos pra `/ofertawhats/` |

## Rodar local

```bash
python3 -m http.server 8080     # http://127.0.0.1:8080/
```

Local a página fica na raiz; em produção fica em `/ofertawhats/`. Os caminhos são relativos, então funciona nos dois.

## Não pode sumir daqui

- **Meta Pixel** — é o mesmo desde a página anterior. Trocar ou remover quebra a medição dos anúncios.
- **CTA `wa.me/5547996182395`** — número de atendimento.
- **Preço R$ 19,90** — é o valor cobrado de verdade.
- **CNPJ e aviso de saúde no rodapé.**

## Marca

Símbolo, lockup, fontes e paleta são gerados fora daqui e copiados pra `assets/`. Os arquivos desta pasta são cópia — a fonte da verdade é a direção de marca do projeto.
