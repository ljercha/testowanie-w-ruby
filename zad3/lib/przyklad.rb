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


  meczyk2 = Wydarzenie.new("Mecz Anglia-Hiszpania","2014-11-19","Siatkówka")
  zaklad2 = Zaklad.new("Zwyciezca: ",meczyk2)
  zaklad2.dodajOpcja(Opcja.new("Anglia",1,3.10))
  zaklad2.dodajOpcja(Opcja.new("Remis",'X',5.0))
  zaklad2.dodajOpcja(Opcja.new("Hiszpania",2,1.50))
  zaklad2.wybor = 'X'

  kupon = Kupon.new(50)
  kupon.dodajZaklad(zaklad1)
  kupon.dodajZaklad(zaklad2)

  puts "\Kupon użytkownika:"
  puts kupon.drukuj

  puts "\nSzczesliwy kupon:"
  kupon.bezpiecznyKupon
  kupon.drukuj

  puts "\nRyzykowny kupon:\n"
  kupon.ryzykownyKupon
  kupon.drukuj


end

