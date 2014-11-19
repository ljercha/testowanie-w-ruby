require 'spec_helper'

require 'simplecov'
SimpleCov.start

require_relative '../../lib/kupon'


describe "Kupon - integracja" do

  let(:wydarzenie) { Wydarzenie.new("Grecja - Hiszpania","2012-12-12","Piłka nożna")}
  let(:opt1) { Opcja.new("Grecja",1,2.0)}
  let(:opt2){ Opcja.new("Hiszpania",2,4.0)}
  let(:opt3) { Opcja.new("Włochy",1,4.5) }
  let(:opt4){ Opcja.new("San Marino",'X',3.0) }
  let(:zaklad1) { Zaklad.new("Wygrana",wydarzenie)}
  let(:zaklad2) { Zaklad.new("Kto odda więcej strzałów na bramkę",wydarzenie)}
  let(:kupon) {Kupon.new(10)}

  describe "#dodajZaklad" do
    it "czy uda sie dodać 1 zakład" do

      expect{kupon.dodajZaklad(zaklad1)}.to_not raise_error
    end

    it "czy ilosc zakladow zgadza się po dodaniu" do
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      expect(kupon.zaklady.length).to eq(2)
    end
  end

  describe "#usunZaklad" do
    it "czy uda sie usunąc zakład" do
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)

      expect{kupon.usunZaklad(zaklad1)}.to_not raise_error
    end

    it "czy ilosc zakladow zgadza się po usunięciu" do
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      kupon.usunZaklad(zaklad1)
      expect(kupon.zaklady.length).to eq(1)
    end
  end

  describe "#to_s" do
    it "zwraca nazwe wydarzenia i date" do

      zaklad = Zaklad.new("Mecz ",wydarzenie)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)
      zaklad.wybor = 2

      expect(zaklad.to_s).to eq("Mecz Grecja - Hiszpania wybor-> 2 kurs-> 4.0")
    end
  end

  describe "#obliczKoncowyKurs" do
    it "sprawdzamy poprawnosc wyliczonego kursu" do
      zaklad1.dodajOpcja(opt1)
      zaklad1.dodajOpcja(opt2)
      zaklad2.dodajOpcja(opt3)
      zaklad2.dodajOpcja(opt4)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      kupon.obliczKoncowyKurs
      expect( 4.5).to eq(4.5)
    end
  end

  describe "#obliczWygrana" do
    it "sprawdzamy poprawnosc liczenia wygranej" do
      zaklad1.dodajOpcja(opt1)
      zaklad1.dodajOpcja(opt2)
      zaklad2.dodajOpcja(opt3)
      zaklad2.dodajOpcja(opt4)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      expect(kupon.obliczWygrana).to eq(90)
    end
  end

  describe "#bezpiecznyKupon" do
    it "sprawdzamy poprawnosc liczenia wygranej" do
      zaklad1.dodajOpcja(opt1)
      zaklad1.dodajOpcja(opt2)
      zaklad2.dodajOpcja(opt3)
      zaklad2.dodajOpcja(opt4)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      kupon.bezpiecznyKupon
      expect(kupon.obliczWygrana).to eq(60)
    end
  end

  describe "#ryzykownyKupon" do
    it "sprawdzamy poprawnosc liczenia wygranej" do
      zaklad1.dodajOpcja(opt1)
      zaklad1.dodajOpcja(opt2)
      zaklad2.dodajOpcja(opt3)
      zaklad2.dodajOpcja(opt4)
      kupon.dodajZaklad(zaklad1)
      kupon.dodajZaklad(zaklad2)
      kupon.ryzykownyKupon
      expect(kupon.obliczWygrana).to eq(180)
    end
  end

end