# encoding: UTF-8

require './councillor'

councillors = Marshal.load File.read ARGV.first

level2teryt = {
  voivodeship: lambda { |teryt| teryt / 10000 },
  powiat:      lambda { |teryt| teryt / 100   },
  gmina:       lambda { |teryt| teryt         },
}
level = ARGV.last.to_sym

raise "wrong level: #{level} not one of #{level2teryt.keys.join ', '}" unless level2teryt.keys.include? level

teryt2cons = councillors.group_by { |c| level2teryt[level].call c.teryt }

teryt2cons.each do |teryt, cons|
  women = cons.select { |c| c.gender == :female }
  puts "#{teryt.to_s.rjust 4}: #{women.size.to_s.rjust 4} of #{cons.size.to_s.rjust 5} (#{(women.size / cons.size.to_f * 100).round.to_s.rjust 2}%) candidates, #{women.select(&:elected).size.to_s.rjust 4} of #{cons.select(&:elected).size} (#{(women.select(&:elected).size / cons.select(&:elected).size.to_f * 100).round.to_s.rjust 2}%) elected"
end
