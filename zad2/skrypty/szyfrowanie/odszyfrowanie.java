import java.io.*;
import java.security.InvalidKeyException;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.SecretKey;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.SecretKeyFactory;


public class odszyfrowanie {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception
	{
		// wczytanie nazwy pliku i hasla
		Scanner wczytaj = new Scanner(System.in);
		System.out.print("Podaj nazwe zaszyfrowanego pliku: ");
		String nazwaPliku = wczytaj.next();
		System.out.print("Podaj hasło: ");
		String haslo = wczytaj.next();
		
		// generowanie zaszyfrowanego klucza     
		try
		{
			DESKeySpec dks = new DESKeySpec(haslo.getBytes()); // kopiuje 8 pierwszych bajtow w celu zabezpieczenia przed modyfikacja
			SecretKeyFactory skf = SecretKeyFactory.getInstance("DES"); // klasa do zamiany danych na klucz szyfru
			SecretKey klucz = skf.generateSecret(dks); // generowanie klucza
                                                           
			// deszyfrowanie                                                                                    
			Cipher szyfr = Cipher.getInstance("DES");                       
			szyfr.init(Cipher.DECRYPT_MODE,klucz);

	    
			CipherInputStream strumienSzyfru= new CipherInputStream(new FileInputStream(nazwaPliku),szyfr);
			InputStream wejscia = strumienSzyfru;
			OutputStream wyjscia = new FileOutputStream("odszyfrowany.txt");
			byte[] bufor = new byte[64];
			int liczbaWczytanychBajtow;
			while ((liczbaWczytanychBajtow = wejscia.read(bufor)) != -1)
			{
				wyjscia.write(bufor, 0, liczbaWczytanychBajtow);
			}
			wyjscia.close();
			wejscia.close();
			strumienSzyfru.close();
			wczytaj.close();
			System.out.println("Sukces !");
		}
		catch (IOException e) 
		{
			System.out.println("Blad odczytu: " + e);
		}
		catch(InvalidKeyException e)
		{
			System.out.println("Zly kod deszyfrujacy !" + e);
		}
	}

}
