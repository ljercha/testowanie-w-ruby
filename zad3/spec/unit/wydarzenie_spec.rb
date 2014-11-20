
require_relative '../../lib/wydarzenie'

describe Wydarzenie do

  it 'inicjalizacja wydarzenia' do
    expect{ Wydarzenie.new("Anglia-Francja", "2013-10-11","Siatkówka") }.to_not raise_error
  end

  describe "#to_s" do
    it "zwraca nazwe wydarzenia i date" do
      expect(Wydarzenie.new("Polska-Gruzja", "2014-11-17","Piłka nożna").to_s).to eq("Polska-Gruzja 2014-11-17")
    end
  end

  describe "#data" do
    it "poprawne wprowadzenie daty podczas inicjalizacji" do
      expect(Wydarzenie.new("Wladimir Kliczko-Kubrat Pulew", "2014-11-15","Box").data).to be_kind_of Date
    end
  end

  describe "#kategoria" do
    it "poprawna kategoria" do
      expect(Wydarzenie.new("Wladimir Kliczko-Kubrat Pulew", "2014-11-15","Box").kategoria).to be_kind_of String
    end
  end

  describe "#nazwa" do
    it "poprawna nazwa" do
      expect(Wydarzenie.new("Wladimir Kliczko-Kubrat Pulew", "2014-11-15","Box").nazwa).to eq("Wladimir Kliczko-Kubrat Pulew")
    end
  end
end
