require 'simplecov'
SimpleCov.start

require_relative '../zipunzip/ZipLib/'


describe "#zip" do
  it "pakowanie pliku" do
  	File.write "assembler.txt" , "mov ah,10h;init 21h;"

    ZipUnzip.zip "assembler.txt", "paczka"
  	# jesli plik istnieje pakowanie udane
  	expect(File.exist?("paczka")).to eq(true)
    FileUtils.rm %w( assembler.txt paczka ) # usuwamy stare pliki
  end

end
describe "#unzip" do
	it "odpakowanie pliku" do
    File.write "unzipTest.txt" , "test testem test"

    ZipUnzip.zip "unzipTest.txt", "unzipTest"
    ZipUnzip.unzip "unzipTest"
    # jesli plik istnieje rozpakowanie udane
    expect(File.exist?('unzipTest.txt2')).to eq(true)
    FileUtils.rm %w( unzipTest.txt unzipTest unzipTest.txt2 ) # usuwamy stare pliki
 # ZipUnzip.unzip ""
	end
end
