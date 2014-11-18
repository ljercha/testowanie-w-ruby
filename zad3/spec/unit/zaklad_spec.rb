require 'simplecov'
SimpleCov.start

require_relative '../../lib/zaklad'


describe Zaklad do


  #let(:impreza) { Wydarzenie.new("Anglia-Francja", "2013-01-11","Siatkówka") }
  let(:opcja) {Opcja.new("Francja",2,1.30)}
  context "hehe" do



    it 'inicjalizacja zakladu' do
      impreza = double("Wydarzenie",:nazwa => "Mecz")
      expect{Zaklad.new("Mecz",impreza)}.to_not raise_error
    end
  end

  describe "#dodajOpcja" do
    it "zwraca nazwe wydarzenia i date" do

      opt = double('Opcja')
      wyd =  instance_double("Wydarzenie", :nazwa => "Aa")

      expect{Zaklad.new("Mecz",wyd).dodajOpcja(opt)}.to_not raise_error
    end
  end

  xdescribe "#to_s" do
    it "zwraca nazwe wydarzenia i date" do

      opt1 = double('Opcja',:kurs => 1.30)
      opt2 = double('Opcja',:kurs => 2.70)
      wyd =  instance_double("Wydarzenie", :nazwa => "Anglia - Francja")
      zaklad = Zaklad.new("Mecz ",wyd)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)

      expect( zaklad.to_s).to eq("Mecz Anglia - Francja")
    end
  end

  describe "policzOpcje" do
    it "sprawdzamy czy ilosc opcji sie zgadza" do

      opt1 = double('Opcja',:kurs => 1.30,:id => 1)
      opt2 = double('Opcja',:kurs => 2.70,:id => 2)
      opt3 = double('Opcja',:kurs => 3.30,:id => 'X')
      wyd =  instance_double("Wydarzenie", :nazwa => "Anglia - Francja")
      zaklad = Zaklad.new("Mecz ",wyd)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)
      zaklad.dodajOpcja(opt3)
      expect( zaklad.opcje.length).to eq(3)
    end
  end


  describe "#usunOpcja" do
    it "zwraca nazwe wydarzenia i date" do

      expect(Wydarzenie.new("Polska-Gruzja", "2014-11-17","Piłka nożna").to_s).to eq("Polska-Gruzja 2014-11-17")
    end
  end
end