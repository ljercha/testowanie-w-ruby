require 'simplecov'
require 'spec_helper'

SimpleCov.start

require_relative '../../lib/opcja'

describe Opcja do

  it '#initialize' do
    expect { Opcja.new("Polska",1,1.14) }.to_not raise_error
  end

  describe "#raise" do
    it "kurs musi byc wiekszy lub rowny 1" do
      expect{Opcja.new("Gruzja",2,-5.0)}.to raise_error
    end
  end

  describe "#zmienKurs" do
    it "kurs zmieniony" do
      expect(Opcja.new("Gruzja",2,3.0).zmienKurs(7.0)).to eq(7.0)
    end
  end

  describe "#kurs" do
    it "mnozenie kursow" do
      expect(Opcja.new("Remis","X",1.50).kurs * Opcja.new("Polska strzeli wiecej niz 2 gole",3,3.0).kurs).to eq(4.5)
    end
  end

  describe "#id" do
    it "sprawdzamy poprawność id" do
      expect(Opcja.new("Polska strzeli wiecej niz 2 gole",3,3.0).id).to eq(3)
    end
  end

  describe "długoscNazwy" do
    it "sprawdzamy długość nazwy" do
      expect(Opcja.new("Sebastian Mila Gol",4,3.5).nazwa.to_s.length).to eq(18)
    end
  end

  describe "#to_s" do
    it "sprawdzamy wypis opcji" do
      expect(Opcja.new("Polska strzeli wiecej niz 2 gole",3,3.0).to_s).to eq("Polska strzeli wiecej niz 2 gole 3.0 3")
    end
  end

end