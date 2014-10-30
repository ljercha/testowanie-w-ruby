require 'rubygems'
require 'zip'

class ZipUnzip

def self.unzip nazwaZip

    Zip::File.open(nazwaZip) do |zipfile|
      zipfile.each do |file|
      zipfile.extract(file, file.name + '2')    # do something with file
    end
  end
end

def self.zip nazwaPliku, nazwaZip
  Zip::File.open(nazwaZip, Zip::File::CREATE) do |zipfile|
    zipfile.add(nazwaPliku, nazwaPliku)
    end
end



end