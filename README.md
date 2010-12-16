Voivod MMX
==========

Analysis of Polish self-government elections of 2010.

data
----

`data` contains raw CSV files from the [National
Electoral Commission](http://wybory2010.pkw.gov.pl).

`dumps` contains voivodeship-, powiat- and gmina-level
dumps of a marshalled `Array` of `Councillor`s (see
`councillor.rb` for the format of the object).

analysis
--------

`winners-and-losers` contains a per-constituency analysis of the number
of votes received by the least popular winner of the election as opposed
to the number of votes received by the most popular loser, as well as
how many losers received more votes than the least popular winner.

`list-changes` contains a per-voivodeship and per-powiat
analysis of how the final seat distribution would change
if the seats were assigned based solely on the number of
votes received by a given candidate (rather than the current
system, which distributes the votes based on the lists).

`gender-balance` shows the electability of women – a comparison of
percentage of women on the election lists with the percentage elected.

scripts
-------

`winners-and-losers.csv.rb`, `lists-changes.csv.rb`
and `gender-balance.csv.rb` were used to generate
the CSV files for the above analyses.

`winners-and-losers.rb` can be used to see human-readable data:

    $ ruby winners-and-losers.rb dumps/voivodeship.dump
    dolnośląskie (20000), const. 1: 144 candidates, 8 won, 136 lost
      biggest winner:  4406 votes,  2.32%: Agnieszka Barbara Muszyńska
      biggest loser:   4894 votes,  2.58%: Roman Kowalczyk
      losers with more votes than winner: 1
    dolnośląskie (20000), const. 2: 104 candidates, 7 won, 97 lost
      biggest winner:  2412 votes,   1.2%: Janusz Marszałek
      biggest loser:   5649 votes,  2.81%: Ewa Maria Mańkowska
      losers with more votes than winner: 11
    …

    $ ruby winners-and-losers.rb dumps/powiat.dump
    bolesławiecki (20100), const. 1: 112 candidates, 10 won, 102 lost
      biggest winner:   308 votes,  2.09%: Jarosław Jan Molenda
      biggest loser:    413 votes,   2.8%: Jadwiga Stanisława Bobek
      losers with more votes than winner: 5
    …
    Olsztyn (286201), const. 3: 81 candidates, 6 won, 75 lost
      biggest winner:    83 votes,  0.55%: Jarosław Czesław Szunejko
      biggest loser:    544 votes,  3.63%: Tomasz Jan Głażewski
      losers with more votes than winner: 28
    …

`list-changes.rb` can be used to see human-readable data:

    $ ruby list-changes.rb dumps/voivodeship.dump
    dolnośląskie (20000):
      official:  15 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 9 KOMITET WYBORCZY WYBORCÓW RAFAŁA DUTKIEWICZA, 7 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 4 KOMITET WYBORCZY SOJUSZ LEWICY DEMOKRATYCZNEJ, 1 KOMITET WYBORCZY POLSKIE STRONNICTWO LUDOWE
      potential: 12 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 8 KOMITET WYBORCZY WYBORCÓW RAFAŁA DUTKIEWICZA, 7 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 7 KOMITET WYBORCZY SOJUSZ LEWICY DEMOKRATYCZNEJ, 2 KOMITET WYBORCZY POLSKIE STRONNICTWO LUDOWE
    …
    summary:
      official:  222 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 141 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 93 KOMITET WYBORCZY POLSKIE STRONNICTWO LUDOWE, […]
      potential: 207 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 141 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 95 KOMITET WYBORCZY POLSKIE STRONNICTWO LUDOWE, […]


    $ ruby list-changes.rb dumps/powiat.dump
    …
    Szczecin (326201):
      official:  15 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 7 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 6 KOMITET WYBORCZY SOJUSZ LEWICY DEMOKRATYCZNEJ, 2 KOMITET WYBORCZY WYBORCÓW PIOTRA KRZYSTKA SZCZECIN DLA POKOLEŃ, 1 KOMITET WYBORCZY WYBORCÓW MAŁGORZATY JACYNY - WITT
      potential: 13 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 7 KOMITET WYBORCZY SOJUSZ LEWICY DEMOKRATYCZNEJ, 6 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 2 KOMITET WYBORCZY WYBORCÓW BARTŁOMIEJA SOCHAŃSKIEGO - OBUDŹMY SZCZECIN, 2 KOMITET WYBORCZY WYBORCÓW PIOTRA KRZYSTKA SZCZECIN DLA POKOLEŃ, 1 KOMITET WYBORCZY WYBORCÓW MAŁGORZATY JACYNY - WITT
    …
    summary:
      official:  1915 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 1450 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 1007 KOMITET WYBORCZY POLSKIE STRONNICTWO LUDOWE, […]
      potential: 1880 KOMITET WYBORCZY PLATFORMA OBYWATELSKA RP, 1517 KOMITET WYBORCZY PRAWO I SPRAWIEDLIWOŚĆ, 988 KOMITET WYBORCZY POLSKIE STRONNICTWO LUDOWE, […]

`gender-balance.rb` can be used to see human-readable data:

    $ ruby gender-balance.rb dumps/voivodeship.dump voivodeship
            dolnośląskie:  156 of   549 (28%) candidates,   10 of 36 (28%) elected
      kujawsko-pomorskie:  188 of   616 (31%) candidates,    8 of 33 (24%) elected
               lubelskie:  179 of   634 (28%) candidates,    6 of 33 (18%) elected
                lubuskie:  115 of   401 (29%) candidates,    6 of 30 (20%) elected
                 łódzkie:  186 of   585 (32%) candidates,   13 of 36 (36%) elected
             małopolskie:  184 of   669 (28%) candidates,    8 of 39 (21%) elected
             mazowieckie:  334 of   975 (34%) candidates,   17 of 51 (33%) elected
                opolskie:   95 of   337 (28%) candidates,    5 of 30 (17%) elected
            podkarpackie:  124 of   459 (27%) candidates,    4 of 33 (12%) elected
               podlaskie:   68 of   359 (19%) candidates,    2 of 30 ( 7%) elected
               pomorskie:  174 of   526 (33%) candidates,    9 of 33 (27%) elected
                 śląskie:  311 of  1047 (30%) candidates,   13 of 48 (27%) elected
          świętokrzyskie:  145 of   473 (31%) candidates,    3 of 30 (10%) elected
     warmińsko-mazurskie:  108 of   357 (30%) candidates,    7 of 30 (23%) elected
           wielkopolskie:  162 of   540 (30%) candidates,    7 of 39 (18%) elected
      zachodniopomorskie:  121 of   377 (32%) candidates,    9 of 30 (30%) elected
