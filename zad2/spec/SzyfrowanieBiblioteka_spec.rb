
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
