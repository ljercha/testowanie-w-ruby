
require './ZipLib'

puts "Podaj nazwe pliku: "
nazwaPliku = gets.chomp
		
puts "Podaj nazwe archiwum: "
nazwaZip = gets.chomp

begin
ZipUnzip.zip nazwaPliku, nazwaZip
rescue
  puts "Nie udalo sie zapakowac pliku !"
end


