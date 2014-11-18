require 'date'

class Wydarzenie

  attr_accessor :nazwa,:data,:kategoria
  def initialize(nazwa, data, kategoria)
    # Assign the argument to the "name" instance variable for the instance
    @nazwa = nazwa
    # If no age given, we will fall back to the default in the arguments list.
    @data = Date.parse(data)
    @kategoria = kategoria
  end

  def to_s
    nazwa + ' ' + data.to_s
  end

end
