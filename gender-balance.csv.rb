# encoding: UTF-8

require './councillor'
require 'csv'

councillors = Marshal.load File.read ARGV.first

level2teryt = {
  voivodeship: lambda { |teryt| teryt / 10000 },
  powiat:      lambda { |teryt| teryt / 100   },
  gmina:       lambda { |teryt| teryt         },
}
level = ARGV.last.to_sym

raise "wrong level: #{level} not one of #{level2teryt.keys.join ', '}" unless level2teryt.keys.include? level

teryt2cons = councillors.group_by { |c| level2teryt[level].call c.teryt }

csv = CSV.generate col_sep: ';' do |rows|
  rows << ['TERYT', 'women candidates', 'candidates', 'candidate%', 'women elected', 'elected', 'elected%']
  teryt2cons.each do |teryt, cons|
    women = cons.select { |c| c.gender == :female }
    rows << [
      teryt,
      women.size,
      cons.size,
      "#{(women.size / cons.size.to_f * 100).round}%",
      women.select(&:elected).size,
      cons.select(&:elected).size,
      "#{(women.select(&:elected).size / cons.select(&:elected).size.to_f * 100).round}%",
    ]
  end
end

puts csv
