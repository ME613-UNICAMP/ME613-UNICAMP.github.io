library(tidyverse)
library(datarium)
## data() carrega dados distribuidos por
## pacotes (marketing: pacote datarium)
data("marketing")
marketing = marketing %>% as_tibble()

marketing %>% ggplot(aes(youtube, sales)) +
  geom_point() + geom_smooth(method='lm') +
  xlab("Orçamento de Campanha YouTube (mil dólares)") +
  ylab("Volume de vendas (mil dólares)") +
  ggtitle("Associação de Vendas e YouTube") +
  theme_bw()

## Primeiros passos: estatística descritiva

marketing %>% ggplot(aes(facebook, sales)) +
  geom_point() + geom_smooth(method='lm') +
  xlab("Orçamento de Campanha Facebook (mil dólares)") +
  ylab("Volume de vendas (mil dólares)") +
  ggtitle("Associação de Vendas e Facebook") +
  theme_bw()

marketing %>% ggplot(aes(newspaper, sales)) +
  geom_point() + geom_smooth(method='lm') +
  xlab("Orçamento de Campanha em Jornais (mil dólares)") +
  ylab("Volume de vendas (mil dólares)") +
  ggtitle("Associação de Vendas e Jornais") +
  theme_bw()

## Fase 1: youtube/facebook associados com vendas
##         jornais parecem ter associacao mais fraca

fit1 = lm(sales ~ youtube, data=marketing)
plot(fit1)

## Na asscoaicao entre vendas e youtube
## parece existir nao-linearidade
## Pode indicar a necessidade de transformar
##  os dados
marketing %>% ggplot(aes(log(youtube), sqrt(sales))) +
  geom_point() +
  xlab("Orçamento de Campanha YouTube (mil dólares)") +
  ylab("Volume de vendas (mil dólares)") +
  ggtitle("Associação de Vendas e YouTube") +
  theme_bw()

marketing %>% ggplot(aes((facebook), (sales))) +
  geom_point() +
  xlab("Orçamento de Campanha Facebook (mil dólares)") +
  ylab("Volume de vendas (mil dólares)") +
  ggtitle("Associação de Vendas e YouTube") +
  theme_bw()

#####
fit2 = lm(sales ~ youtube, data=marketing)
summary(fit2)
## P1: Qual é a interpretacao do intercepto no modelo acima?
## R1: Se não houver investimento no Youtube, as vendas em média serão
##     de 8.44 mil dólares
##
## P2: Qual é a interpretação do coef angular (0.05)
## R2: Para cada aumento unitário em x (aumento de 1 mil dólares na camp)
##     espera-se um aumento de 0.05 em y (aumento de 50 dólares em vendas)

fit3 = lm(sales ~ facebook, data=marketing)
summary(fit3)

fit4 = lm(sales ~ youtube + facebook, data=marketing)
summary(fit4)
## P3: Qual é a interpretação do intercepto?
## R3: O volume médio de vendas, na ausência de investimentos em YT e FB,
##     seria, em média, de 3.5 mil dólares.
##
## P4: Como interpreto o coeficiente para YT?
## R4: Fixando o investimento no FB, cada aumento de 1000 dólares em
##     campanhas no YT resultará em um aumento médio de 45 dólares nas
##     vendas.
##
## P5: Interpretação para o coef FB?
## R5: Fixando o investimento no YT, cada 1000 dolares investidos no FB
##     resultam, em média, em 187.99 dólares de aumento em vendas.

marketing %>% ggplot(aes(youtube, facebook)) +
  geom_point()

## Informar para o R que desejo um modelo que possua:
##  - Efeito para YT
##  - Efeito para FB
##  - Efeito para interação YT:FB
##  Y ~ A*B => Y ~ A + B + A:B
fit5 = lm(sales ~ youtube * facebook,
          data=marketing)
summary(fit5)
## P6: Como interpreto o intercepto?
## R6: Com zero investimentos tanto no YT quanto no FB,
##     em média, observamos 8.1 mil dólares como vol venda.
##
## P7: Como interpreto o coef para YT?
## R7: Assumindo um investimento no FB = 30 mil dólares
##    vendas = 8.1 + 1.9e-2 * YT + 2.9e-2 * FB +
##                + 9e-4 * YT * FB
##    vendas = 8.1 + 1.9e-2 YT + 2.9e-2 * 30 +
##                + 9e-4 * YT * 30
##    vendas = 8.1 + 1.9e-2 YT + 0.87 +
##                + 0.027 * YT
##    vendas = 8.97 + 0.05 * YT
##   
##  Para um investimento fixo de 30mil dolares no FB,
##   observa-se um aumento de 50 dolares nas vendas para
##   cada 1000 acrescidos na campanha de YT.
## R7: Assumindo um investimento no FB = 60 mil dólares
##    vendas = 8.1 + 1.9e-2 * YT + 2.9e-2 * FB +
##                + 9e-4 * YT * FB
##    vendas = 8.1 + 1.9e-2 YT + 2.9e-2 * 60 +
##                + 9e-4 * YT * 60
##    vendas = 8.1 + 1.9e-2 YT + 1.74 +
##                + 0.054 * YT
##    vendas = 9.84 + 0.07 * YT
##   

plot(fit5)

fit6 = lm(log(sales) ~ sqrt(facebook) * sqrt(youtube),
          data=marketing)
plot(fit6)

######

marketing %>% ggplot(aes(youtube, sales)) +
  geom_point() + 
  xlab("Orçamento de Campanha YouTube (mil dólares)") +
  ylab("Volume de vendas (mil dólares)") +
  ggtitle("Associação de Vendas e YouTube") +
  theme_bw()
