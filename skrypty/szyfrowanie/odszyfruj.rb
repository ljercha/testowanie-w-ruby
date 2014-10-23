require 'openssl'

def load(string, key)
	salt, iv, encrypted = Marshal.load(string)
	cipher = OpenSSL::Cipher.new('DES');
    cipher.decrypt
    cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(key, salt, 20000, 32)
    cipher.iv = iv
    cipher.update(encrypted) << cipher.final
end

puts "Nazwa zaszyfrowanego pliku: "
nazwaPliku = gets.chomp
puts "Haslo:"
haslo = gets.chomp

begin
File.write 'odszyfrowany.txt', (load File.read(nazwaPliku), haslo)
rescue
puts "Nie udalo sie odszyfrowac pliku !"
end
