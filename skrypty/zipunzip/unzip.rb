require 'rubygems'
require 'zip'

puts "Podaj nazwe archiwum: "
nazwaZip = gets.chomp

Zip::File.open('ok') do |zipfile|
  zipfile.each do |file|

  zipfile.extract(file, File.dirname(File.dirname(__FILE__)) + '/' + file.name)    # do something with file
  end
end

