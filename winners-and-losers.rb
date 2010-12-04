# encoding: UTF-8

require './councillor'

councillors = Marshal.load File.read ARGV.first

constituencies = councillors.map { |c| [c.unit, c.teryt, c.constituency] }.uniq

constituencies.each do |unit, teryt, constituency|
  cons = councillors.select { |c| c.teryt == teryt and c.constituency == constituency }
  winners, losers = cons.partition &:elected
  winner = winners.sort_by(&:percent).first
  loser  = losers.sort_by(&:percent).last || Councillor.new

  puts "#{unit} (#{teryt}), const. #{constituency}: #{cons.size} candidates, #{winners.size} won, #{losers.size} lost"
  puts "  biggest winner: #{winner.votes.to_s.rjust 5} votes, #{winner.percent.to_s.rjust 5}%: #{winner.first_name} #{winner.last_name}"
  puts "  biggest loser:  #{loser.votes.to_s.rjust 5} votes, #{loser.percent.to_s.rjust 5}%: #{loser.first_name} #{loser.last_name}"
  puts "  losers with more votes than winner: #{losers.select { |l| l.votes > winner.votes }.size}"
end
