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


% X está à esquerda de Y (em qualquer posição à esquerda).
aEsquerda(X, Y, Lista) :-
  nth0(IndexX, Lista, X), nth0(IndexY, Lista, Y),
  IndexX < IndexY.


% X está à direita de Y, se Y está a esquerda de X.
aDireita(X, Y, Lista) :- aEsquerda(Y, X, Lista).

% X está ao lado de Y
aoLado(X, Y, Lista) :- nextto(X, Y, Lista);nextto(Y, X, Lista).

% X está no canto se ele é o primeiro ou último da lista.
noCanto(X, [X|_]).
noCanto(X, Lista) :- last(Lista, X).

/*
% navio(Nacionalidade, Saida, Carregamento, Chamine, Destino)
solucao(ListaSolucao) :-
  ListaSolucao = [
    navio(Nacionalidade1, Saida1, Carregamento1, Chamine1, Destino1),
    navio(Nacionalidade2, Saida2, Carregamento2, Chamine2, Destino2),
    navio(Nacionalidade3, Saida3, Carregamento3, Chamine3, Destino3),
    navio(Nacionalidade4, Saida4, Carregamento4, Chamine4, Destino4),
    navio(Nacionalidade5, Saida5, Carregamento5, Chamine5, Destino5).
  ].
*/
