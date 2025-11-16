# Projeto

Construa uma Domain Specific Language (DSL) baseada em Scheme. A DSL deve atender a algum domínio, exemplos: gráfico, autômatos, lógica e regras, acesso a dados, etc.

Uma vez escolhido o domínio, a DSL deve possuir as seguintes características:

* Deve definir estruturas de dados de base. Veja exemplo simplificado de estruturas definidas para SQL-like.

* Deve construir operadores sobre estas estruturas explorando no mínimo os seguintes recursos do Scheme:

  * funções de ordem superior (recebendo funções como parâmetro e retornando funções);

  * closure;

  * macros higiênicas.

Veja exemplo de apresentação em:
* [Criando Primitivas SQL-like](macros-abstraction.ipynb)
* [Mecanismos para Macros](macros-mechanisms.ipynb)

A linguagem deve explorar o mecanismo de macro para se aproximar de uma sintaxe mais ligada com o domínio que se pretende representar.

# Modelo de Apresentação do Projeto

No repositório do projeto, deve haver um arquivo com dados básicos do projeto e da equipe na raiz, uma pasta para cada etapa de entrega, conforme templates a seguir:

A seguir é apresentada a estrutura de pastas esperada no repositório do projeto:

~~~
├── README.md        <- apresentação do projeto
│
├── project-1        <- primeira entrega
│
└── project-2-final  <- entrega final
~~~

* [Entrega 1](project-1/)
* [Entrega 2 - Final](project-2-final/)

Na raiz do projeto do GitHub deve haver um arquivo de nome `README.md` contendo a apresentação da equipe e projeto, como detalhado na seção seguinte. Este arquivo é escrito em Markdown. Para conhecer Markdown, veja [Editando o Arquivo README.md](markdown.md).

Dentro de cada pasta desta especificação há um arquivo `template.md`, que especifica o template do texto que deve aparecer dentro da respectiva pasta.

Segue abaixo o modelo do arquivo `README.md` que fica na raiz do projeto.

# Modelo para Apresentação do Grupo e Projeto

# Projeto `<Título do Projeto>`
# Project `<Title in English>`

> Incluir nome e RA de cada membro do grupo.
> |Nome  | RA |
> |--|--|
> | Nome1  | 123456  |
> | Nome2  | 123456  |
> | Nome3  | 123456  |
> | Nome4  | 123456  |



