
require_relative '../../lib/kupon'


describe Kupon do

  let(:impreza) { instance_double("Wydarzenie",:nazwa => "Mecz")}
  let(:opcja1) { instance_double("Opcja",:kurs => 2.0, :id => 1)}
  let(:opcja2){ instance_double("Opcja",:kurs => 4.0, :id => 2)}
  let(:opcja3) { instance_double("Opcja",:kurs => 1.5, :id => 1)}
  let(:opcja4){ instance_double("Opcja",:kurs => 3.0, :id => 'X')}
  let(:zaklad1) { instance_double("Zaklad",:wybranyKurs => 1.50, :wybor => 1, :bezpiecznaOpcjaId => 2)}
  let(:zaklad2) { instance_double("Zaklad",:wybranyKurs => 3.0, :wybor => 1, :bezpiecznaOpcjaId => 2)}
  context "Inicjalizacja kuponu" do
    it 'za 0 złotych' do

      expect{Kupon.new(-5)}.to raise_error
    end

    it 'za 10 złotych' do

      expect{Kupon.new(10)}.to_not raise_error
    end
  end

  describe "#dodajZaklad" do
    it "czy uda sie dodać 1 zakład" do
      kupon = Kupon.new(10)

      expect{kupon.dodajZaklad(zaklad1)}.to_not raise_error
    end

    it "czy ilosc zakladow zgadza się po dodaniu" do
      kupon = Kupon.new(10)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      expect(kupon.zaklady.length).to eq(2)
    end
  end

  describe "#usunZaklad" do
    it "czy uda sie usunąc zakład" do
      kupon = Kupon.new(10)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)

      expect{kupon.usunZaklad(zaklad1)}.to_not raise_error
    end

    it "czy ilosc zakladow zgadza się po usunięciu" do
      kupon = Kupon.new(10)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      kupon.usunZaklad(zaklad1)
      expect(kupon.zaklady.length).to eq(1)
    end
  end

  describe "#to_s" do
    it "zwraca nazwe wydarzenia i date" do

      opt1 = instance_double('Opcja',:kurs => 1.30, :id => 1)
      opt2 = instance_double('Opcja',:kurs => 2.70, :id => 2)
      wyd =  instance_double("Wydarzenie", :nazwa => "Anglia - Francja")
      zaklad = Zaklad.new("Mecz ",wyd)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)
      zaklad.wybor = 2

      expect(zaklad.to_s).to eq("Mecz Anglia - Francja wybor-> 2 kurs-> 2.7")
    end
  end

  describe "#obliczKoncowyKurs" do
    it "sprawdzamy poprawnosc wyliczonego kursu" do
      kupon = Kupon.new(10)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      kupon.obliczKoncowyKurs
      expect( 4.5).to eq(4.5)
    end
  end

  describe "#obliczWygrana" do
    it "sprawdzamy poprawnosc liczenia wygranej" do
      kupon = Kupon.new(10)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      expect(kupon.obliczWygrana).to eq(45)
    end
  end

end
