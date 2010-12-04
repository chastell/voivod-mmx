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
