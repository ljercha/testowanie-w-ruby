
require 'simplecov'
SimpleCov.start

require_relative '../../lib/zaklad'
require_relative '../../lib/wydarzenie'


describe "Zaklad - integracja" do

  context "#Initialize" do

    let(:wydarzenie) { Wydarzenie.new("KSW","2015-03-06","Walka")}
    it 'inicjalizacja zakladu' do

      expect{Zaklad.new("Mecz",wydarzenie)}.to_not raise_error
    end
  end

  context "Operacje na opcjach" do

    let(:wydarzenie) {Wydarzenie.new("KSW","2015-03-06","Walka")}
    let(:opt1) { Opcja.new("Kliczko",1,1.10)}
    let(:opt2) { Opcja.new("Haye",2,3.0)}
    let(:opt3) { Opcja.new("KO",'X',3.0)}
    let(:zaklad) {Zaklad.new("Mecz",wydarzenie)}
    describe "#dodajOpcja" do
      it "czy uda sie dodać opcje" do



        expect{zaklad.dodajOpcja(opt1)}.to_not raise_error
      end
    end

    context "#usunOpcja" do


      it "czy uda sie usunąc opcję" do
        expect{zaklad.usunOpcja(opt2)}.to_not raise_error
      end

      it "czy liczba opcji po usunięciu się zgadza" do
        zaklad.dodajOpcja(opt1)
        zaklad.dodajOpcja(opt2)
        zaklad.usunOpcja(opt2)
        expect(zaklad.opcje.length).to eq(1)
      end

    end

    describe "#to_s" do
      it "zwraca nazwe wydarzenia i date" do

        zaklad = Zaklad.new("Mecz ",wydarzenie)
        zaklad.dodajOpcja(opt1)
        zaklad.dodajOpcja(opt2)
        zaklad.wybor = 2

        expect(zaklad.to_s).to eq("Mecz KSW wybor-> 2 kurs-> 3.0")
      end
    end

    describe "policzOpcje" do
      it "sprawdzamy czy ilosc opcji sie zgadza" do

        zaklad = Zaklad.new("Mecz ",wydarzenie)
        zaklad.dodajOpcja(opt1)
        zaklad.dodajOpcja(opt2)
        zaklad.dodajOpcja(opt3)
        expect( zaklad.opcje.length).to eq(3)
      end
    end

    describe "#wybranyKurs" do
      it "sprawdzamy funkcja wraca wybrany kurs" do

        zaklad.dodajOpcja(opt1)
        zaklad.dodajOpcja(opt2)
        zaklad.dodajOpcja(opt3)
        zaklad.wybor = 'X'
        expect( zaklad.wybranyKurs).to eq(3.0)
      end
    end

    describe "#bezpiecznaOpcjaId" do
      it "sprawdzamy funkcja wraca wybrany kurs" do

        zaklad.dodajOpcja(opt1)
        zaklad.dodajOpcja(opt2)
        zaklad.dodajOpcja(opt3)
        zaklad.wybor = 'X'
        expect( zaklad.bezpiecznaOpcjaId).to eq(1)
      end
    end
  end


end
