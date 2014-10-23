require 'openssl'

# There is a encrypt gem already implementing it
def dump string, key
    cipher = OpenSSL::Cipher.new('DES');
    cipher.encrypt
    salt = OpenSSL::Random.random_bytes(16)
    cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(key, salt, 20000, 32)
    iv = cipher.random_iv
    Marshal.dump([salt, iv, cipher.update(string) << cipher.final])
end

puts "Nazwa pliku do zaszyfrowania: "
nazwaPliku = gets.chomp
puts "Haslo:"
haslo = gets.chomp

begin
File.write 'zaszyfrowany.txt', dump(File.read(nazwaPliku), haslo)
rescue
  puts "Nie udalo sie zaszyfrowac pliku !"
end