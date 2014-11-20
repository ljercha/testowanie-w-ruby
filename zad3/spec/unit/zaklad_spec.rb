
require_relative '../../lib/zaklad'


describe Zaklad do

  context "#Initialize" do

    it 'inicjalizacja zakladu' do
      impreza = instance_double("Wydarzenie",:nazwa => "Mecz")
      expect{Zaklad.new("Mecz",impreza)}.to_not raise_error
    end
  end

  describe "#dodajOpcja" do
    it "czy uda sie dodać opcje" do

      opt = double('Opcja')
      wyd =  instance_double("Wydarzenie", :nazwa => "Aa")

      expect{Zaklad.new("Mecz",wyd).dodajOpcja(opt)}.to_not raise_error
    end
  end

  context "#usunOpcja" do
    let(:wyd) {instance_double("Wydarzenie", :nazwa => "Aa")}
    let(:zaklad) {Zaklad.new("Mecz",wyd)}
    let(:opt1) { double('Opcja')}
    let(:opt2) {double('Opcja')}

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

  describe "policzOpcje" do
    it "sprawdzamy czy ilosc opcji sie zgadza" do

      opt1 = instance_double('Opcja',:kurs => 1.30,:id => 1)
      opt2 = instance_double('Opcja',:kurs => 2.70,:id => 2)
      opt3 = instance_double('Opcja',:kurs => 3.30,:id => 'X')
      wyd =  instance_double("Wydarzenie", :nazwa => "Anglia - Francja")
      zaklad = Zaklad.new("Mecz ",wyd)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)
      zaklad.dodajOpcja(opt3)
      expect( zaklad.opcje.length).to eq(3)
    end
  end

  describe "#wybranyKurs" do
    it "sprawdzamy funkcja wraca wybrany kurs" do

      opt1 = instance_double('Opcja',:kurs => 1.30,:id => 1)
      opt2 = instance_double('Opcja',:kurs => 2.70,:id => 2)
      opt3 = instance_double('Opcja',:kurs => 3.30,:id => 'X')
      wyd =  instance_double("Wydarzenie", :nazwa => "Anglia - Francja")
      zaklad = Zaklad.new("Mecz ",wyd)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)
      zaklad.dodajOpcja(opt3)
      zaklad.wybor = 'X'
      expect( zaklad.wybranyKurs).to eq(3.30)
    end
  end

  describe "#bezpiecznaOpcjaId" do
    it "sprawdzamy funkcja wraca wybrany kurs" do

      opt1 = instance_double('Opcja',:kurs => 1.30,:id => 1)
      opt2 = instance_double('Opcja',:kurs => 2.70,:id => 2)
      opt3 = instance_double('Opcja',:kurs => 3.30,:id => 'X')
      wyd =  instance_double("Wydarzenie", :nazwa => "Anglia - Francja")
      zaklad = Zaklad.new("Mecz ",wyd)
      zaklad.dodajOpcja(opt1)
      zaklad.dodajOpcja(opt2)
      zaklad.dodajOpcja(opt3)
      zaklad.wybor = 'X'
      expect( zaklad.bezpiecznaOpcjaId).to eq(1)
    end
  end


  describe "#sprawdzWypis" do
    it "czy poprawny wydruk" do

      expect(Wydarzenie.new("Polska-Gruzja", "2014-11-17","Piłka nożna").to_s).to eq("Polska-Gruzja 2014-11-17")
    end
  end
end
