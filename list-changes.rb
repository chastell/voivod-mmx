# encoding: UTF-8

require './councillor'

councillors = Marshal.load File.read ARGV.first

constituencies = councillors.map { |c| [c.teryt, c.constituency] }.uniq

official  = {}
potential = {}

constituencies.each do |teryt, constituency|
  official[teryt]  ||= Hash.new 0
  potential[teryt] ||= Hash.new 0

  cons = councillors.select { |c| c.teryt == teryt and c.constituency == constituency }
  elected = cons.select &:elected

  elected.each { |c| official[teryt][c.committee] += 1 }
  cons.sort_by(&:votes).reverse.take(elected.size).each { |c| potential[teryt][c.committee] += 1 }
end

teryt2unit = Hash[councillors.map { |c| [c.teryt, c.unit] }]

teryt2unit.each do |teryt, unit|
  puts "#{unit} (#{teryt}):"
  puts "  official: #{official[teryt].sort_by { |committee, count| [-count, committee] }.map { |committee, count| "#{count} #{committee}" }.join ', ' }"
  puts "  potential: #{potential[teryt].sort_by { |committee, count| [-count, committee] }.map { |committee, count| "#{count} #{committee}" }.join ', ' }"
end
