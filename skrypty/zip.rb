require 'rubygems'
require 'zip'

puts "Podaj nazwe pliku: "
nazwaPliku = gets.chomp
		
puts "Podaj nazwe archiwum: "
nazwaZip = gets.chomp


folder = "Users/me/Desktop/stuff_to_zip"
input_filenames = ['image.jpg', 'description.txt', 'stats.csv']

zipfile_name = "/Users/me/Desktop/archive.zip"

Zip::File.open(nazwaZip, Zip::File::CREATE) do |zipfile|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(nazwaPliku, nazwaPliku + '.zip')
end
