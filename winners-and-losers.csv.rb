# encoding: UTF-8

require './councillor'
require 'csv'

councillors = Marshal.load File.read ARGV.first

constituencies = councillors.map { |c| [c.unit, c.teryt, c.constituency] }.uniq

csv = CSV.generate col_sep: ';' do |rows|
  rows << ['unit', 'TERYT', 'constituency', 'candidates', 'winners', 'losers', 'biggest winner votes', 'biggest loser votes', 'losers with more votes than winner']
  constituencies.each do |unit, teryt, constituency|
    cons = councillors.select { |c| c.teryt == teryt and c.constituency == constituency }
    winners, losers = cons.partition &:elected
    winner = winners.sort_by(&:percent).first
    loser  = losers.sort_by(&:percent).last || Councillor.new
    rows << [unit, teryt, constituency, cons.size, winners.size, losers.size, winner.votes, loser.votes, losers.select { |l| l.votes > winner.votes }.size]
  end
end

puts csv
