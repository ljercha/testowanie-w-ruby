class Kupon

  attr_accessor :wygrana,:stawka,:zaklad

  def initialize(stawka)
    # Assign the argument to the "name" instance variable for the instance
    @stawka = stawka
    @zaklad = Array.new
    # If no age given, we will fall back to the default in the arguments list.
  end

  def dodajZaklad(zaklad)
    @zaklad.push(zaklad)
  end
  def usunZaklad(zaklad)
    @zaklad.delete(zaklad)
  end

  def to_s
    zaklad.each { |x| puts x }

  end
  def obliczWygrana
    suma = 1

    zaklad.each {|x| suma = suma * x.wybranyKurs;puts x.wybranyKurs}
    suma
  end
end