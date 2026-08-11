# site-lianfit

Página única do LianFit — `https://lianfit.com.br/ofertawhats/`.

HTML estático servido por nginx. **Sem build, sem framework, sem dependência.** Editar é abrir `index.html`.

## O que tem aqui

| | |
|---|---|
| `index.html` | a página inteira (CSS inline) |
| `assets/` | lockups em SVG, fontes woff2, OG image, ícone |
| `Dockerfile` | nginx + copiar os arquivos pra `/ofertawhats/` |

A marca (símbolo, lockup, fontes, paleta) é gerada no repo do agente, em `docs/marca/`. Os arquivos aqui são **cópia** — se a marca mudar lá, recopiar:

```bash
python3 - <<'PY'
from pathlib import Path
b = Path("../docs/marca")           # ajustar se o repo do site sair de dentro do lianfit
for nome, cor, alvo in (("lianfit-lockup.svg","#F5F1E8","lockup-papel.svg"),
                        ("lianfit-lockup.svg","#16233B","lockup-noite.svg"),
                        ("lianfit-simbolo.svg",None,"simbolo.svg")):
    t = b.joinpath("simbolo", nome).read_text()
    if cor: t = t.replace("var(--marca, #16233B)", cor)
    Path("assets", alvo).write_text(t)
PY
```

## Rodar local

```bash
python3 -m http.server 8080     # abre http://127.0.0.1:8080/
```

(local a página fica na raiz; em produção fica em `/ofertawhats/` — os caminhos são relativos, então funciona nos dois.)

## Deploy

Serviço EasyPanel **`orion-site/site-lian-fit`** (project `orion-site`), build por Dockerfile, `autoDeploy: false` — deploy é sempre manual.

⚠️ **Hoje o serviço aponta pro repo `gustavolmaia20-source/nutrilian`** (a página velha, gerada no Lovable, que ainda diz "Nutri Lian" e R$ 49,90). Trocar a fonte pra este repo é o passo que publica esta página:

1. `services.app.updateSourceGithub` — `{projectName:"orion-site", serviceName:"site-lian-fit", owner:"<dono>", repo:"<repo>", ref:"main", path:"/", autoDeploy:false}`
2. `services.app.deployService` — `{projectName:"orion-site", serviceName:"site-lian-fit"}`
3. Conferir: `curl -sI https://lianfit.com.br/ofertawhats/` e o `<title>` do HTML.

O domínio (`lianfit.com.br` + `www`, path `/ofertawhats`) já está configurado no Traefik e **não precisa ser tocado**. O 308 de `/` pra `/ofertawhats` também é do Traefik.

## Coisas que não podem sumir daqui

- **Meta Pixel `4529677620612420`** — é o mesmo da página antiga. Trocar ou remover quebra a medição dos anúncios.
- **CTA `wa.me/5547996182395`** — é o número de produção do LianFit.
- **Preço R$ 19,90** — é o que o Asaas cobra de verdade.
- **CNPJ da Orion e o aviso de saúde no rodapé** — o aviso é a mitigação mínima combinada enquanto o CRN/CREF não chega.

## Coisas que a página antiga tinha e esta não tem, de propósito

- **Depoimentos** ("Camila R., 28 anos", "perdi 4kg no primeiro mês") — eram gerados pelo Lovable, não são clientes reais. Depoimento inventado é propaganda enganosa e resultado prometido sem responsável técnico.
- **Plano semestral de R$ 29,90/mês** — não existe no Asaas.
- **Conteúdos educativos / aulas de 3-5 min / desafio de 21 dias** — não existem no produto.
- **"IA validada"** — não há validação a que se referir.
