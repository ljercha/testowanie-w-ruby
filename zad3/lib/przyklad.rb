require_relative 'kupon'
require_relative 'opcja'
require_relative 'wydarzenie'
require_relative 'zaklad'
class Przyklad

  meczyk1 = Wydarzenie.new("Mecz Polska-Niemcy","2014-11-17","Piłka nożna")
  zaklad1 = Zaklad.new("Zwyciezca: ",meczyk1)
  zaklad1.dodajOpcja(Opcja.new("Polska",1,1.10))
  zaklad1.dodajOpcja(Opcja.new("Remis",'X',2.12))
  zaklad1.dodajOpcja(Opcja.new("Niemcy",2,7.50))
  zaklad1.wybor = 1

  puts zaklad1
  zaklad1.drukujOpcje

  meczyk2 = Wydarzenie.new("Mecz Anglia-Hiszpania","2014-11-19","Piłka nożna")
  zaklad2 = Zaklad.new("Zwyciezca: ",meczyk2)
  zaklad2.dodajOpcja(Opcja.new("Anglia",1,3.10))
  zaklad2.dodajOpcja(Opcja.new("Remis",'X',5.0))
  zaklad2.dodajOpcja(Opcja.new("Hiszpania",2,1.50))
  zaklad2.wybor = 'X'

  puts zaklad2
  zaklad2.drukujOpcje

  szczesliwyKupon = Kupon.new(50)
  szczesliwyKupon.dodajZaklad(zaklad1)
  szczesliwyKupon.dodajZaklad(zaklad2)

  #1puts szczesliwyKupon
  puts szczesliwyKupon.obliczWygrana

end

