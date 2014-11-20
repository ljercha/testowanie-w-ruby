require './szyfrowanieBiblioteka'

puts "Nazwa pliku do zaszyfrowania: "
nazwaPliku = gets.chomp
puts "Haslo:"
haslo = gets.chomp

begin
File.write 'zaszyfrowany.txt', Szyfrowanie.zakoduj(File.read(nazwaPliku), haslo)
rescue
  puts "Nie udalo sie zaszyfrowac pliku !"
end