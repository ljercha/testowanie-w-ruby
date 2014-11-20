class Opcja

  attr_accessor :nazwa,:id,:kurs
  def initialize(nazwa,id,kurs)

    @nazwa = nazwa

    @id = id
    @kurs = kurs
    if kurs < 1
      raise "Kurs musi byc wiekszy lub równy 1"
    end
  end

  def zmienKurs(nowyKurs)
    @kurs = nowyKurs
  end

  def to_s
    nazwa + " " + kurs.to_s + " " + id.to_s

  end

end