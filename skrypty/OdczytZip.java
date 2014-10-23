import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
public class OdczytZip {

	public static void main(String[] args)
	{
		byte[] bufor = new byte[64];
		Scanner wczytaj = new Scanner(System.in);
		System.out.print("Podaj nazwe archiwum: ");
		String nazwaZip = wczytaj.next();
		try
		{
			// nowy strumien zip
		    ZipInputStream zis = new ZipInputStream(new FileInputStream(nazwaZip));
		    // pobiera plik
		    ZipEntry ze = zis.getNextEntry();
		    String nazwaPliku = ze.getName();
		    File nowyPlik = new File(nazwaPliku);
		    FileOutputStream fos = new FileOutputStream(nowyPlik);             
		    int iloscWczytanychBajtow;
		    while ((iloscWczytanychBajtow = zis.read(bufor)) > 0) 
		    {
		    	fos.write(bufor, 0, iloscWczytanychBajtow);
		    }
		    fos.close();   
		    ze = zis.getNextEntry();
		    zis.closeEntry();
		    zis.close();
		}
		catch(IOException e)
	    {
	    	System.out.println("Blad zapisu: " + e);
	    }
	}    
}
