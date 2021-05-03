nacionalidade(brasileiro).
nacionalidade(espanhol).
nacionalidade(grego).
nacionalidade(ingles).
nacionalidade(frances).

saida(5).
saida(6).
saida(7).
saida(8).
saida(9).

carregamento(arroz).
carregamento(cacau).
carregamento(cha).
carregamento(milho).
carregamento(cafe).

chamine(azul).
chamine(branca).
chamine(verde).
chamine(vermelha).
chamine(preta).

destino(hamburgo).
destino(macau).
destino(manila).
destino(santos).
destino(rotterdam).

% X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X, Y, Lista) :-
  nth0(IndexX, Lista, X),
  nth0(IndexY, Lista Y),
  IndexX < IndexY

% X está à direita de Y, se Y está a esquerda de X
aDireita(X, Y, Lista) :- aEsquerda(Y, X, Lista).
