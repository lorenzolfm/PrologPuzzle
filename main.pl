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
companhia(filha).
companhia(irma).
companhia(esposa).
companhia(namorada).

% X está exatamente à esquerda de Y.
exatamenteAEsquerda(X, Y, Lista) :-
   nth0(IndexX, Lista, X),
   nth0(IndexY, Lista, Y),
   IndexX =:= IndexY - 1.

% X está exatamente à direita de Y.
exatamenteADireita(X, Y, Lista) :- exatamenteAEsquerda(Y, X, Lista).

% X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X, Y, Lista) :-
   nth0(IndexX, Lista,X),
   nth0(IndexY, Lista,Y),
   IndexX < IndexY.

% X está à direita de Y (em qualquer posição à direita)
aDireita(X, Y, Lista) :-
   aEsquerda(Y, X, Lista).

% Y está à direita de X e à esquerda de Z, nessa ordem.
entre(Y, X, Z, Lista) :-
   aEsquerda(X, Y, Lista),
   aDireita(Z, Y, Lista).

/*
solucao(ListaSolucao) :-
   ListaSolucao = [
      turista(Camisa1, Nacionalidade1, Bebida1, Dias1, Idade1, Companhia1),
      turista(Camisa2, Nacionalidade2, Bebida2, Dias2, Idade2, Companhia2),
      turista(Camisa3, Nacionalidade3, Bebida3, Dias3, Idade3, Companhia3),
      turista(Camisa4, Nacionalidade4, Bebida4, Dias4, Idade4, Companhia4),
      turista(Camisa5, Nacionalidade5, Bebida5, Dias5, Idade5, Companhia5),

   ].

   % Na primeira posição está quem ficará 15 dias no Brasil.
   Dias1 = 15,

   % O turista de camisa Verde está em algum lugar entre quem gosta de Água e o Croata, nessa ordem.

   % O alemão está acompanhado do filho.

   % O Espanhol é o turista mais velho.

   % O turista de 45 anos está exatamente à direita do turista de 31 anos.

   % O Alemão está exatamente à esquerda do turista de Vermelho.

   % O turista de 36 anos está exatamente à esquerda do turista que gosta de Leite.

   % O turista do meio está acompanhado do Amigo.
   Companhia3 = amigo,

   % O turista de Azul está ao lado do turista que ficará 10 dias no Brasil.

   % O italiano está na terceira posição.
   Nacionalidade3 = italiano,

   % O alemão está ao lado do turista que passará 20 dias no Brasil.

   % O turista de 28 anos está exatamente à direita do turista que ficará 25 dias no Brasil.

   % O turista de Verde está em algum lugar entre o Espanhol e o turista de Branco, nessa ordem;

   % Quem gosta de chá está exatamente à esquerda de quem veio acompanhado do amigo.
   Bebida2 = cha,

   % Na quinta posição está o turista que veio com a Namorada.
   Companhia5 = namorada,

   % Quem está acompanhado da Esposa está ao lado de quem ficará 20 dias no Brasil.

   % O turista que gosta de Café está na quinta posição.
   Bebida5 = cafe.

   % O turista que veio com a Esposa está exatamente à esquerda de quem gosta de Leite.

   % Os turistas das camisas amarela e vermelha estão lado a lado.

   % O turista de 31 anos veio com o amigo.
   Idade3 = 31.

*/
