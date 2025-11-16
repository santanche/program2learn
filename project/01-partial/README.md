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

O trabalho deve ser entregue conforme o [Template](template.md).

