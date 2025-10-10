# Laboratório de Programação Lógica

Este artigo construiu um grafo de conhecimento que relaciona sintomas e doenças, bem como o peso da importância de cada sintoma na doença:

Rotmensch, M., Halpern, Y., Tlimat, A., Horng, S., & Sontag, D. (2017). Learning a Health Knowledge Graph from Electronic Medical Records. Scientific Reports 2017 7:1, 7(1), 1–11. https://doi.org/10.1038/s41598-017-05778-z

A partir deste estudo, foi publicada no GitHub uma tabela das arestas do grafo relacionando as doenças e seus sintomas:

https://github.com/clinicalml/HealthKnowledgeGraph/blob/master/DerivedKnowledgeGraph_final.csv

Considere a seguinte versão simplificada do grafo e a respectiva transformação em fatos em Prolog, disponíveis neste diretório:

* [symptoms-diseases.csv](./symptoms-diseases.csv)
* [symptoms-diseases.pl](./symptoms-diseases.pl)

Escreva regras em Prolog que sejam capazes de realizar as seguintes tarefas:
* `has_symptom(Disease, Symptom)` - Indica se uma doença tem um sintoma independentemente do seu peso.
* `shares_symptom(D1, D2, Symptom)` - Indica se duas doenças compartilham um sintoma independentemente do seu peso.
* `disease_similarity(D1, D2, Score)` - Calcula o score de similaridade entre doenças, que consiste no somatório da similaridade por sintoma, considerando todos os sintomas compartilhados. A similaridade por sintoma é calculada como a média dos pesos daquele sintoma para as doenças associadas.
* `disease_score(Symptoms, Disease, TotalScore)` - Dada uma lista de sintomas, a regra retorna as possíveis doenças e o respectivo score para cada uma, que consiste na soma dos pesos dos sintomas para aquela doença. Esta regra pode dar suporte ao raciocínio clínico.

As regras devem ser validadas no [Tau Prolog](https://santanche.github.io/web2learn/frameworks/tau-prolog/) e para o lab deve ser enviado um arquivo texto `.pl`. Não devem ser usados LLMs para a construção das regras.
