# encoding: UTF-8

require './councillor'
require 'csv'

genders = {'K' => :female, 'M' => :male}

levels = {
  'gmina do 20 tyś.'          => :gmina10k,
  'gmina pow. 20 tyś.'        => :gmina100k,
  'powiat'                    => :powiat,
  'rada dzielnicy'            => :dzielnica,
  'miasto na prawach powiatu' => :miasto,
  'sejmik'                    => :sejmik,
}

councillors = []

ARGV.each do |csv|
  puts "processing #{csv}"
  CSV.foreach csv, col_sep: ';', encoding: 'UTF-8', headers: true do |row|
    councillors << Councillor.new(
      row['Unit'].to_sym,
      levels[row['Level']],
      row['TERYT'].to_i,
      row['Constituency'].to_i,
      row['List'].to_i,
      row['Committee'].to_sym,
      row['Position'].to_i,
      row['Family name'],
      row['Names'],
      genders[row['Sex']],
      row['Age'].to_i,
      row['Elected'] == 'T',
      row['Votes quantity'].to_i,
      row['Votes percent in constituency'].tr(',', '.').to_f,
    )
  end
end

groupings = {
  gmina: [:gmina10k, :gmina100k, :dzielnica],
  powiat: [:powiat, :miasto],
  voivodeship: [:sejmik],
}

groupings.each do |grouping, levels|
  File.open "#{grouping}.dump", 'w' do |file|
    selected = councillors.select { |c| levels.include? c.level }
    file.write Marshal.dump selected
  end
end
