squadra(asroma).
squadra(juve).
squadra(sampdoria).
squadra(lazio).
squadra(genoa).
squadra(milan).
squadra(bologna).
squadra(toro).

giornata(1..14).

7 {combinazione(A,B) : squadra(B)} 7 :-squadra(A).
4 {match(G,(A,B)) : combinazione(A,B) } 4 :-giornata(G).

:-combinazione(A,B), A == B.
:-match(G,(A,B)),match(J,(C,D)), G != J, (A,B) == (C,D).  % due squadre si possono affrontare solo una volta a casa di una delle due.
:-match(G,(A,B)),match(J,(C,D)), G == J, A == C, B != D.  % una squadra non puo' giocare due partite a casa nella stessa giornata.
:-match(G,(A,B)),match(J,(C,D)), G == J, A != C, B == D.  % una squadra non puo' giocare due partite in trasferta nella stessa giornata.
:-match(G,(A,B)),match(J,(C,D)), G == J, B == C, A != D.  % una squadra non puo' giocare una partita a casa e un'altra in trasferta nella stessa giornata
:-match(G,(A,B)),match(J,(C,D)), G == J, B != C, A == D.  % // // // // // // //
:-match(G,(A,B)),match(J,(C,D)), G == J, B == C, A == D.  % una squadra non puo' giocare una partita a casa e un'altra in trasferta nella stessa giornata (stesso avversario)
:-match(G,(A,B)),match(J,(C,D)), A == D , B == C , G <= 7, J <= 7. 
:-match(G,(A,B)),match(J,(C,D)),match(K,(E,F)),A == C, C == E, K = J+1, J = G+1. % una squadra non puo' giocare piu' di due volte consecutivamente a casa
:-match(G,(A,B)),match(J,(C,D)),match(K,(E,F)),B == D, D == F, K = J+1, J = G+1. % una squadra non puo' giocare piu' di due volte consecutivamente i trasferta

:-match(G,(juve,B)), match(J,(toro,C)), G == J, B != toro, C != juve.
:-match(G,(asroma,B)), match(J,(lazio,C)), G == J, B != lazio, C != asroma.
:-match(G,(genoa,B)), match(J,(sampdoria,C)), G == J, B != sampdoria, C != genoa.

#show match/2.
