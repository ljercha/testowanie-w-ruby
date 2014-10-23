import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import java.io.*;
public class ZapisZip {

	
  public static void main(String[] args) throws IOException
  { 

		Scanner wczytaj = new Scanner(System.in);
		System.out.print("Podaj nazwe pliku: ");
		String nazwaPliku = wczytaj.next();
		
		System.out.print("Podaj nazwe archiwum: ");
		String nazwaZip = wczytaj.next();
        
		try 
        {
    	File zip = new File(nazwaZip),plik = new File(nazwaPliku);

        	String nazwaZapakowanegoPliku = plik.getName();
        	ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zip));
        	
        	ZipEntry entry = new ZipEntry(nazwaZapakowanegoPliku); // stworzenie obiektu klasy ZipEntry, reprezentującego dane, zapisywane do strumienia, takie jak pliki lub katalogi     
        	zos.putNextEntry(entry);
        	
        	FileInputStream fis = new FileInputStream(plik);
            byte[] bufor = new byte[64];
            int iloscWczytanychBajtow = -1;
            while ((iloscWczytanychBajtow = fis.read(bufor)) != -1) 
            {
              zos.write(bufor, 0, iloscWczytanychBajtow);
            }
            zos.closeEntry();
            zos.close();
            fis.close();
            wczytaj.close();
        } 
        catch (IOException e) 
        {
        	System.out.println("Blad zapisu: " + e);
        }
  }
}