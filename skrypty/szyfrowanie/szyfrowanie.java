import java.io.*;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.SecretKey;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.SecretKeyFactory;

public class szyfrowanie {

	public static void main(String[] args) throws Exception 
	{
		// wczytanie nazwy pliku i hasla
		Scanner wczytaj = new Scanner(System.in);
		System.out.print("Podaj nazwe pliku: ");
		String nazwaPliku = wczytaj.next();
		System.out.print("Podaj hasło: ");
		String haslo = wczytaj.next();
		
		// generowanie zaszyfrowanego klucza
		DESKeySpec dks = new DESKeySpec(haslo.getBytes());
		SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
		SecretKey klucz = skf.generateSecret(dks);

		// szyfrowanie
		javax.crypto.Cipher szyfr = javax.crypto.Cipher.getInstance("DES");
		szyfr.init(Cipher.ENCRYPT_MODE, klucz);

		try
		{
			CipherOutputStream strumienSzyfru = new CipherOutputStream(new FileOutputStream("zaszyfrowany.txt"), szyfr);
			InputStream wejscia = new FileInputStream(nazwaPliku);
			OutputStream wyjscia = strumienSzyfru;
			byte[] bufor = new byte[64];
			int liczbaWczytanychBajtow;
			while ((liczbaWczytanychBajtow = wejscia.read(bufor)) != -1) 
			{
				wyjscia.write(bufor, 0, liczbaWczytanychBajtow);
			}
			wyjscia.close();
			wejscia.close();
			System.out.println("Sukces !");
		} 
		catch (IOException e) 
		{
			System.out.println("Blad zapisu: " + e);
		}
		wczytaj.close();
	}

}
