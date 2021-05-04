camisa(amarela).
camisa(azul).
camisa(branca).
camisa(verde).
camisa(vermelha).

nacionalidade(alemao).
nacionalidade(croata).
nacionalidade(espanhol).
nacionalidade(frances).
nacionalidade(italiano).

bebida(agua).
bebida(cafe).
bebida(cha).
bebida(cerveja).
bebida(leite).

dias(10).
dias(15).
dias(20).
dias(25).
dias(30).

idade(28).
idade(31).
idade(36).
idade(45).
idade(57).

companhia(amigo).
companhia(filho).
companhia(irma).
companhia(esposa).
companhia(namorada).

% X é o primeiro da Lista.
primeiro(X, [X|_]).

% X está à esquerda de Y (em qualquer posição à esquerda).
aEsquerda(X, Y, Lista) :-
  nth0(IndexX, Lista, X), nth0(IndexY, Lista, Y),
  IndexX < IndexY.


% X está à direita de Y, se Y está a esquerda de X.
aDireita(X, Y, Lista) :- aEsquerda(Y, X, Lista).

% X está em algum lugar entre X e Y.
entre(X, Y, Z, Lista) :-
   aDireita(X, Y, Lista),
   aEsquerda(X, Z, Lista).

/*
% turista(Camisa, Nacionalidade, Bebida, Dias, Idade, Companhia)
solucao(ListaSolucao) :-
   ListaSolucao = [
      turista(Camisa1, Nacionalidade1, Bebida1, Dias1, Idade1, Companhia1),
      turista(Camisa2, Nacionalidade2, Bebida2, Dias2, Idade2, Companhia2),
      turista(Camisa3, Nacionalidade3, Bebida3, Dias3, Idade3, Companhia3),
      turista(Camisa4, Nacionalidade4, Bebida4, Dias4, Idade4, Companhia4),
      turista(Camisa5, Nacionalidade5, Bebida5, Dias5, Idade5, Companhia5),
   ]
*/
