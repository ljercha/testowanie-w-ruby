
require './szyfrowanieBiblioteka'

puts "Nazwa zaszyfrowanego pliku: "
nazwaPliku = gets.chomp
puts "Haslo:"
haslo = gets.chomp

begin
File.write 'odszyfrowany.txt', (Szyfrowanie.odkoduj File.read(nazwaPliku), haslo)
rescue
puts "Nie udalo sie odszyfrowac pliku !"
end
