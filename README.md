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

scripts
-------

`winners-and-losers.csv.rb` and `lists-changes.csv.rb`
were used to generate the CSV files for the above analyses.

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
