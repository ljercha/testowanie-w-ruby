require 'simplecov'
SimpleCov.start
require_relative '../szyfrowanie/szyfrowanieBiblioteka/'


describe "#zakoduj" do
  it "wiadomosc odszyfrowana powinna byc taka sama jak zaszyfrowana" do
  	haslo = "test"
  	File.write "test.txt" , "ala ma kota"
  	File.write 'kod.txt', Szyfrowanie.zakoduj(File.read('test.txt'), haslo)
  	# jesli plik istnieje szyfrowanie udane
  	expect(File.exist?("kod.txt")).to eq(true)
  end
end
describe "#odkoduj" do
	it "test odszyfrowania wiadomosci" do
	haslo = "test"
	expect(File.read("test.txt")).to eq(Szyfrowanie.odkoduj(File.read("kod.txt"),haslo))
	end
end

describe "dlugoscWiadomosci" do
	it "sprawdzamy czy wiadomosci maja ta sama dlugosc" do
	tekst = "Ala ma kota"
	haslo = "test"
	szyfr = Szyfrowanie.zakoduj(tekst,haslo)
	expect(Szyfrowanie.odkoduj(szyfr,haslo).length).to eq(11)
	end
end

describe "kodowanieWiadomosci" do
	it "czy zakodowany string jest inny od wiadomosci" do
	tekst = "Ala ma kota"
	haslo = "test"
	expect(Szyfrowanie.zakoduj(tekst,haslo)).to_not eq(tekst)
	end
end
