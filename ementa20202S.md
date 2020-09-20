---
title: "Ementa ME613 - Análise de Regressão - 2S 2020"
output:
  html_document:
    df_print: paged
layout: page
---

### Informações Gerais

- *Professores*: Benilton de Sá Carvalho e Rafael Pimentel Maia
- *e-mail*: benilton < arr > unicamp.br ; rpmaia < arr > unicamp.br (troque _arr_ por @)
- *Ao enviar email*: utilizar **[ME613]+assunto** no campo *subject*; *apenas* emails do domínio XXX.unicamp.br são recebidos;
- *Atividades e notas*: disponibilizados [via Moodle](https://moodle.ggte.unicamp.br/course/view.php?id=7544);
<!---
- *Abono de faltas*: consulte o [regimento](http://www.dac.unicamp.br/portal/grad/regimento/capitulo_v/secao_x/).
-->
- O aluno deverá proceder de forma respeitosa e honesta durante as provas bem como na resolução de qualquer outra atividade que seja parte da avaliação do curso.
- O login usado para acessar o Moodle é intransferível, conforme [ConTIC-IN-01/2019](https://www.citic.unicamp.br/sites/default/files/normas/ConTIC-IN-01%202019%20-%20normas_uso_TIC.pdf).

### Atendimentos PED & PAD

- PED: João Vitor Bastos de Freitas

|      Dia      | Início |  Fim  | Sala | Unidade |
|:-------------:|:------:|:-----:|:----:|:-------:|
|  |   |  |   |  IMECC  |
|  |   |  |   |  IMECC  |


- PAD: Giovanni Torres Chaves 

|      Dia      | Início |  Fim  | Sala | Unidade |
|:-------------:|:------:|:-----:|:----:|:-------:|
|  |   |  |   |  IMECC  |
|  |   |  |   |  IMECC  |


### Bibliografia

* Kutner, M. H., Nachtsteim, X. J., Li, William. Applied Linear Statistical Models, 5th Edition - [conjunto de dados](http://www.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/index.html)
* Weisberg, S. [Applied Linear Regression, 4th Edition](http://unicampbr.summon.serialssolutions.com/2.0.0/link/0/eLvHCXMwrV1NSwMxEB1EDyoFv22tSs5Ca5JdN9mTWLX0oljwXqZJCh5cy3YF_fdmku0KhXryGCZfhCQzTN57AUhkn_dW7oQURSaFUUamqDBVM41CckyN0M5wNOFP23w8Vs8jUs0Z_PWASqSJ9_m1_TAPAWXZjwyAW1sHtaTYJolf7l0ZHdW7QfKbdeH0DMjDl0F-M-vM166Fn5Zl3VCOIiIyOJrh3n_MaR-2HFEYDmDDFYew-9Qosy6O4CpcA4ySYm7B3gr2UvoTHRCy3wwLyyj6jOLNx3A5fHy9H_XiNCbzKEwxWY6TnEALCSBfVIFIZ9vAfCiHWjlhUU0pm6YxkQptluezG8wV78Dpmt460F2xVF9VYz1b264LOz66qGEu57BZlZ_uArbrtZqWP8hqnhA) - [conjunto de dados](http://users.stat.umn.edu/~sandy/alr4ed/)
* Draper, N. R., Smith, H. [Applied Regression Analysis, 3rd Edition](http://onlinelibrary.wiley.com/book/10.1002/9781118625590) - [conjunto de dados](http://rpackages.ianhowson.com/cran/aprean3/)
* Caffo, B. [Regression Models for Data Science in R](https://leanpub.com/regmods)
* Faraway, J. J. [Linear Models with R, 2nd Edition](http://www.maths.bath.ac.uk/~jjf23/LMR/)

Para acessar alguns dos livros digitais fora da Unicamp, você poderá precisar do VPN. Veja instruções de instalação [aqui](http://www.ccuec.unicamp.br/ccuec/acesso_remoto_vpn).


### Critérios de Avaliação e Datas Importantes

- **Prova 1 (P1)**: 10 de outubro  de 2020
- **Prova 2 (P2)**: 23 de dezembro de 2020
- **Trabalho Final - Parte 1 (T1)**: 06 de janeiro de 2021
- **Trabalho Final - Parte 2 (T2)**: 18 de janeiro de 2021
- **Exame Final**: 25 de janeiro de 2021

1. A nota do trabalho (T) será data pela médias arimética entre as notas atribuídas as parte 1 e parte 2: T = (T1 + T2)/2
2. Média Geral (MG) será dada por: MG = (P1 + P2 + T)/3;
3. Se houver algum impedimento para a realização de alguma(s) avaliação(ões), o(s) peso(s) da(s) avaliação(ões) realizada(s) ser(á/ão) normalizados apropriadamente;
4. Se nehuma prova for realizada, todos os alunos farão o Exame Final e, neste caso, MF=EF;

* A Média Final (MF) do aluno será:
  - Se MG >= 7.0, o aluno está aprovado e MF = MG;
  - Se 2.5 <= MG < 7.0, o aluno deverá fazer exame e MF = mínimo(7.0 ; (MG+EF)/2);
  - se MG < 2.5, o aluno está reprovado, não poderá realizar exame e MF=MG;

### Notas Importantes

1. Cópia dessa ementa está disponível na página da disciplina no Moodle. Sua leitura é fortemente recomendada, não cabendo aos alunos desculpas por ignorância quanto ao seu conteúdo.

2. Os professores da disciplina não são direta ou indiretamente responsáveis pela administração dos sistemas computacionais da Universidade. Portanto, não responderão sobre quaisquer problemas ou condições dos laboratórios e demais serviços relacionados. Favor, dirigir-se diretamente aos responsáveis.

3. No período de suspensão das atividades presenciais, a disciplina *Análise de Regressão (ME613)* será operada com o apoio dos recursos tecnológicos atualmente disponíveis. Para tanto, as seguintes medidas foram adotadas:

* Aulas e Atendimentos PED e PAD
    - Os slides associados às aulas continuarão a ser distribuídos pelo website da disciplina [http://me613-unicamp.github.io](http://me613-unicamp.github.io) ;
    - Os vídeos dos slides contendo comentários do docente em áudio serão distribuídos por meio do YouTube, afim de permitir que os alunos possam revisitar o material e os respectivos comentários de acordo com a sua necessidade. O link para cada um dos vídeos será disponibilizado pelo Moodle;
    - Os atendimentos PAD acontecerão nos mesmos dias e horários inicialmente agendados. O canal de comunicação será a sala Google Meet da disciplina [???](???);
    - Toda sessão de atendimento (seja PED, PAD ou pelos professoeres) será gravada e disponibilizada por meio do YouTube (os links serão distribuídos por meio do Moodle);

* Frequência:
    - Os alunos terão suas frequências registradas de maneira automática e integral durante o período de suspensão de atividades presenciais;

* Comunicação
    - A comunicação do professor com os alunos acontecerá pelo quadro de avisos do Moodle;
    - As dúvidas referentes ao material de aula devem ser postadas no fórum criado especialmente para este fim no Moodle;

* Avaliações
     - As avaliações acontecerão com o apoio de recursos eletrônicos (incluindo, mas não restritos a, Moodle, GradeScope e Zoom), nos dias e horários indicados;

* Expectativas dos Professores com respeito aos Alunos : 
     - Os alunos deverão manter uma rotina de estudo individual dos materiais disponibilizados (slides, slides com comentários, atividades, referências, além das atividades apontadas no fim de cada bloco de slides).
