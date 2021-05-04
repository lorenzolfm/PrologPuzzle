% Implementando fatos ...

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

% Implementando regras ...

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

% X está EXATAMENTE a esquerda de Y.
exatamenteAEsquerda(X, Y, Lista) :-
   nth0(IndexX, Lista, X), nth0(IndexY, Lista, Y),
   IndexX =:= IndexY - 1.

% X está EXATAMENTE a direita de Y.
exatamenteADireita(X, Y, Lista) :- exatamenteAEsquerda(Y, X, Lista).

% X está ao lado de Y
aoLado(X, Y, Lista) :- nextto(X, Y, Lista);nextto(Y, X, Lista).

% Todos elementos de uma lista devem ser diferentes.
todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

% Cada navio é um predicado como o abaixo.
% turista(Camisa, Nacionalidade, Bebida, Dias, Idade, Companhia)

% Implementando solucao ...

solucao(ListaSolucao) :-
   ListaSolucao = [
      turista(Camisa1, Nacionalidade1, Bebida1, Dias1, Idade1, Companhia1),
      turista(Camisa2, Nacionalidade2, Bebida2, Dias2, Idade2, Companhia2),
      turista(Camisa3, Nacionalidade3, Bebida3, Dias3, Idade3, Companhia3),
      turista(Camisa4, Nacionalidade4, Bebida4, Dias4, Idade4, Companhia4),
      turista(Camisa5, Nacionalidade5, Bebida5, Dias5, Idade5, Companhia5)
   ],

  % Implementando dicas ...

   % Na PRIMEIRA POSIÇÃO está quem ficará 15 DIAS no Brasil.
   Dias1 = 15,

   % O turista de CAMISA VERDE está em algum lugar ENTRE quem gosta de ÁGUA e o CROATA, nessa ordem;
   entre(turista(verde, _, _, _, _, _),
         turista(_, _, agua, _, _, _),
         turista(_, croata, _, _, _, _), ListaSolucao),

   % O turista ALEMÃO está ACOMPANHADO do FILHO.
   member(turista(_, alemao, _, _, _, filho), ListaSolucao),

   % O turista ESPANHOL é o MAIS VELHO.
   member(turista(_, espanhol, _, _, 57, _), ListaSolucao),

   % O turista de 45 ANOS está EXATAMENTE À DIREITA do turista de 31 ANOS.
   exatamenteADireita(turista(_, _, _, _, 45, _),
                      turista(_, _, _, _, 31, _), ListaSolucao),

   % O ALEMÃO está EXATAMENTE À ESQUERDA do turista de VERMELHO.
   exatamenteAEsquerda(turista(_, alemao, _, _, _, _),
                       turista(vermelha, _, _, _, _, _), ListaSolucao),

   % O turista de 36 ANOS está EXATAMENTE À ESQUERDA do turista que gosta de LEITE.
   exatamenteAEsquerda(turista(_, _, _, _, 36, _),
                       turista(_, _, leite, _, _, _), ListaSolucao),

   % O turista do MEIO está acompanhado do AMIGO.
   Companhia3 = amigo,

   % O turista de AZUL está AO LADO do turista que ficará 10 DIAS no brasil.
   aoLado(turista(azul, _, _, _, _, _),
          turista(_, _, _, 10, _, _), ListaSolucao),

   % O ITALIANO está na TERCEIRA posição.
   Nacionalidade3 = italiano,

   % O ALEMÃO está AO LADO do turista que passará 20 DIAS no brasil.
   aoLado(turista(_, alemao, _, _, _, _),
          turista(_, _, _, 20, _, _), ListaSolucao),

   % O turista de 28 ANOS está EXATAMENTE À DIREITA do turista que ficará 25 DIAS no Brasil.
   exatamenteADireita(turista(_, _, _, _, 28, _),
                      turista(_, _, _, 25, _, _), ListaSolucao),

   % O turista de VERDE está em algum lugar ENTRE o ESPANHOL e o turista de BRANCO, nessa ordem.
   entre(turista(verde, _, _, _, _, _),
         turista(_, espanhol, _, _, _, _),
         turista(branca, _, _, _, _, _), ListaSolucao),

   % Quem gosta de CHÁ está EXATAMENTE À ESQUERDA de quem veio acompanhado do AMIGO.
   exatamenteAEsquerda(turista(_, _, cha, _, _, _),
                       turista(_, _, _, _, _, amigo), ListaSolucao),

   % Na QUINTA POSIÇÃO, está o turista que veio com a NAMORADA.
   Companhia5 = namorada,

   % Quem está acompanhado da ESPOSA está AO LADO de quem ficará 20 DIAS no Brasil.
   aoLado(turista(_, _, _, _, _, esposa),
          turista(_, _, _, 20, _, _), ListaSolucao),

   % O turista que gosta de CAFÉ está na QUINTA POSIÇÃO.
   Bebida5 = cafe,

   % O turista que veio com a ESPOSA está EXATAMENTE À ESQUERDA de quem gosta de LEITE.
   exatamenteAEsquerda(turista(_, _, _, _, _, esposa),
                       turista(_, _, leite, _, _, _), ListaSolucao),

   % Os turistas das camisas AMARELA e VERMELHA estão LADO A LADO.
   aoLado(turista(amarela, _, _, _, _, _),
          turista(vermelha, _, _, _, _, _), ListaSolucao),

   % O turista de 31 ANOS veio com o AMIG.
   member(turista(_, _, _, _, 31, amigo), ListaSolucao),

   % Testando todas as possibilidade ...

   camisa(Camisa1),
   camisa(Camisa2),
   camisa(Camisa3),
   camisa(Camisa4),
   camisa(Camisa5),
   todosDiferentes([Camisa1, Camisa2, Camisa3, Camisa4, Camisa5]),

   nacionalidade(Nacionalidade2),
   nacionalidade(Nacionalidade3),
   nacionalidade(Nacionalidade4),
   nacionalidade(Nacionalidade5),
   todosDiferentes([Nacionalidade1, Nacionalidade2, Nacionalidade3, Nacionalidade4, Nacionalidade5]),

   bebida(Bebida1),
   bebida(Bebida2),
   bebida(Bebida3),
   bebida(Bebida4),
   bebida(Bebida5),
   todosDiferentes([Bebida1, Bebida2, Bebida3, Bebida4, Bebida5]),

   dias(Dias1),
   dias(Dias2),
   dias(Dias3),
   dias(Dias4),
   dias(Dias5),
   todosDiferentes([Dias1, Dias2, Dias3, Dias4, Dias5]),

   idade(Idade1),
   idade(Idade2),
   idade(Idade3),
   idade(Idade4),
   idade(Idade5),
   todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

   companhia(Companhia1),
   companhia(Companhia2),
   companhia(Companhia3),
   companhia(Companhia4),
   companhia(Companhia5),
   todosDiferentes([Companhia1, Companhia2, Companhia3, Companhia4, Companhia5]).
