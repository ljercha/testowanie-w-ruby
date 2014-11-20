class Kupon

  attr_accessor :wygrana,:stawka,:zaklady

  def initialize(stawka)
    # Assign the argument to the "name" instance variable for the instance
    @stawka = stawka
    @zaklady = Array.new
    # If no age given, we will fall back to the default in the arguments list.
    if stawka <= 1
      raise "Minimalna stawka wynosi 1"
    end
  end

  def dodajZaklad(zaklad)
    @zaklady.push(zaklad)
  end
  def usunZaklad(zaklad)
    @zaklady.delete(zaklad)
  end

  def drukuj
    puts zaklady.each { |x| x }
    puts "Stawka: " + stawka.to_s
    puts "Kurs końcowy: " + obliczKoncowyKurs.to_s
    puts "Możliwa wygrana: " + (obliczWygrana).to_s
  end
  def obliczKoncowyKurs
    suma = 1
    zaklady.each {|x| suma = suma * x.wybranyKurs}
    suma
  end

  def obliczWygrana
    obliczKoncowyKurs * stawka
  end

  def bezpiecznyKupon
    zaklady.each {|x|
      x.wybor = x.bezpiecznaOpcjaId }
  end

  def ryzykownyKupon
    zaklady.each {|x|
      x.wybor = x.ryzykownaOpcjaId }

  end
end