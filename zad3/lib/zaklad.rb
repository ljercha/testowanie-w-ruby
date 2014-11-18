class Zaklad

  attr_accessor :nazwa,:wydarzenie,:opcje, :wybor


  def initialize(nazwa, wydarzenie)
    @nazwa = nazwa
    @wydarzenie = wydarzenie
    @wybor = 'X'
    @opcje = Array.new
  end

  def dodajOpcja(opcja)
    @opcje.push(opcja)
  end
  def usunOpcja(opcja)
    @opcje.delete(opcja)
  end

  def to_s
    nazwa + wydarzenie.nazwa + " wybor-> " + wybor.to_s + " kurs-> " + wybranyKurs.to_s
  end

  def drukujOpcje

    opcje.each {|x| print x}
  end

  def wybranyKurs
    opcje.find{ |x| x.id == wybor}.kurs
  end
end