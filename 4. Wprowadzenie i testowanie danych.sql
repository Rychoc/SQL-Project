USE BD2_Projekt_OZHID
GO
/*
--KODY U�YWANE PODCZAS WPROWADZANIA DANYCH I TESTOWANIA:
--resetowanie IDENTYFI COUNT
--aby wszystkie nowowprowadzone dane by�y indeksowane od 1 z krokiem 1
DBCC CHECKIDENT ('Pracownicy', RESEED, 0);
GO
DBCC CHECKIDENT ('Spedytorzy', RESEED, 0);
GO
DBCC CHECKIDENT ('Produkty', RESEED, 0);
GO
DBCC CHECKIDENT ('Dostawcy', RESEED, 0);
GO
DBCC CHECKIDENT ('Kategorie', RESEED, 0);
GO
DBCC CHECKIDENT ('Klienci', RESEED, 0);
GO
DBCC CHECKIDENT ('PozycjeZam�wienia', RESEED, 0);
GO
DBCC CHECKIDENT ('Zam�wienia', RESEED, 0);
GO

--Kasowanie zawarto�ci tabel
--aby ponownie spr�bowa� wprowadzi� wszystkie warto�ci po nieudanej pr�bie
DELETE Spedytorzy
GO
DELETE Produkty
GO
DELETE Kategorie
GO
DELETE Dostawcy
GO
DELETE Klienci
GO
DELETE Pracownicy
GO
DELETE Zam�wienia
GO
DELETE PozycjeZam�wienia
GO
*/


--Poprawne dane zaimplementowane do tabeli:

--wprowadzam dane Spedytor�w (Po wykonaniu zapytania brak b��d�w)
INSERT INTO Spedytorzy
VALUES
('Kurier 9',			'567567567'),
('Poczta krajowa',	'875676455'),
('Automat paczkowy',	'698736547');

--wprowadzam dane Kategorii (po wykonaniu zapytania brak b��d�w)
INSERT INTO Kategorie
VALUES
('Nabia�',	'Produkty mleczne',				NULL),	
('Fastfood','�ywno�� wysoko przetworzona',	NULL),
('Warzywa',	'�wie�e warzywa',				NULL),
('Owoce',	'�wie�e owoce',					NULL),
('Napoje',	'Produkty do wypicia',			NULL),
('Odzierz',	 NULL,							NULL),
('S�odycze','S�odkie przek�ski',			NULL),
('Kwiaty',	 NULL,							NULL),
('Ksi��ki','Ksi��ki w formie papierowej',	NULL);

--wprowadzam dane Dostawcy (po wykonaniu zapytania brak b��d�w)
INSERT INTO Dostawcy
VALUES
('Warzywniak Rolnictwo','ul.Piastowska 22',	'43-300',	'Bielsko',	'Polska',	'147295321',	'www.warzywniakrol.pl'),
('Szmatka Original',	'ul.Prz�dzalnicza 3',	'00-778',	'Warszawa',	'Poslka',	'438745239',	'www.szmatka.pl'),
('Ten Smak', 			'ul.Konesera 102',		'93-480',	'��dz',		'Polska',	'987645623',	'www.smakten.pl'),
('Bukiecik',			'ul.Polna 19',			'30-063',	'Krak�w',	'Polska',	'698774356',	'www.kwiatybukiecik.pl'),
('Popisanka',			'ul.Artyst�w 1',		'54-007',	'Wroc�aw',	'Polska',	'253485769',	'www.popisanka.pl');

--wprowadzam dane Pracownicy (po wykonaniu zapytania brak b��d�w)
INSERT INTO Pracownicy
VALUES
('Kowalski',	'Tadeusz',	'Szef',			'1961-01-16',	'1990-07-04',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska',	'764557816',	NULL,	NULL),
('Malarz',		'Anna',		'Sekretarka',	'1984-03-05',	'2004-08-21',	'ul.Kolista 12',	'00-778',	'Warszawa',	'Poslka',	'164856487',	NULL,	1),
('Adamski',		'Jakub',	'Kierownik',	'1959-09-11',	'1999-02-26',	'ul.Z�oty potok 7',	'00-778',	'Warszawa',	'Polska',	'768547247',   'Urlop',	1),
('Szpak',		'Miros�aw',	'Magazynier',	'1977-02-20',	'1996-08-08',	'ul.Kolini 1',		'93-480',	'��dz',		'Polska',	'458674258',	NULL,	4),
('Gadowski',	'Micha�',	'Magazynier',	'1970-08-08',	'1996-01-24',	'ul.M�y�ska 65',	'30-063',	'Krak�w',	'Poslka',	'456785674',	NULL,	2),
('Kowalska',	'Jadwiga',	'Magazynier',	'1989-12-29',	'2017-06-16',	'al.Grzybiarzy 40',	'54-007',	'Wroc�aw',	'Polska',	'546645678',	NULL,	2),
('Tyczka',		'Joanna',	'Kierownik',	'1999-06-01',	'2019-11-16',	'al.Zamkowa 33',	'43-300',	'Bielsko',	'Polska',	'453455645',	NULL,	1),
('Wykr�t',		'Daniel',	'Informatyk',	'1998-07-21',	'2007-01-06',	'ul.Wysoka 187',	'93-480',	'��dz',		'Polska',	'546489878',	NULL,	7),
('Pi�ta',		'B�arzej',	'Logistyk',		'2000-12-24',	'2019-06-11',	'ul.Le�na 34',		'30-063',	'Krak�w',	'Polska',	'457658657',   'Podwy�ka',7),
('Czul',		'Ma�gorzata','Sprzedawca',	'2002-05-25',	'2020-11-09',	'ul.Malarzy 61',	'54-007',	'Wroc�aw',	'Polska',	'666857886',	NULL,	7);

--wprowadzam dane Klienci (po wykonaniu zapytania brak b��d�w)
INSERT INTO Klienci
VALUES
('Gugle',		'Kowalski',	'Karol',	'ul.Pegaza 60',		'43-300',	'Bielsko',	'Polska',	'465987549'),
('CornWin',	'Janik',	'Artur',	'ul.Fio�kowej 23',	'00-778',	'Warszawa',	'Poslka',	'435675897'),
(NULL,		'Gruszka',	'Jan',		'al.Sadownicza 54',	'93-480',	'��dz',		'Polska',	'435890725'),
(NULL,		'Brzoza',	'Julia',	'ul.Le�na 12',		'30-063',	'Krak�w',	'Poslka',	'354834456'),
('Oowca',		'Broda',	'Kuba',		'al.R�wno�ci 2',	'54-007',	'Wroc�aw',	'Polska',	'986245475'),
(NULL,		'Adamska',	'Natalia',	'al.Kolista 80',	'43-300',	'Bielsko',	'Polska',	'457696763'),
('Piramida finanse','Dolar','Piotr',	'ul.Bankowa 99',	'00-778',	'Warszawa',	'Polska',	'453242544'),
('Baranek s.a','Cinek',	'Grzegorz',	'ul.Morksa 7',		'93-480',	'��dz',		'Polska',	'234598685'),
(NULL,		'W�giel',	'Krystyna',	'ul.Z�otnik�w 74',	'30-063',	'Krak�w',	'Polska',	'758694456'),
(NULL,		'Bu�ka',	'Stefan',	'ul.Piekarska 66',	'54-007',	'Wroc�aw',	'Polska',	'356368696');

--Powy�sze dane nie ��czy�y si� zale�no�ciami ze soba, 
--dlatego wymaga�y wprowadzenia ich w pierwszej kolejno�ci 
--aby m�c zaimplementowa� pozosta�e dane do tabel

--wprowadzam dane Produkty (po wykonaniu zapytania brak b��d�w)
INSERT INTO Produkty
VALUES
('Ser bia�y',		1,3,	'1',	3.99,	100,	0,		60),
('Ser ��ty',		1,3,	'1',	4.49,	60,		0,		60),
('Pizza',			2,3,	'1',	8.98,	30,		0,		20),
('Hot dog',			2,3,	'1',	6.59,	15,		25,		40),
('Zapiekanka',		2,3,	'1',	5,		30,		20,		40),
('Pomidor',			3,1,	'1',	1.99,	60,		0,		50),
('Brzoskwinia',		4,1,	'1',	1.85,	60,		20,		50),
('Woda mineralna',	5,3,	'1',	2.9,	36,		36,		36),
('Chipsy',			2,3,	'1',	5.12,	10,		20,		20),
('Klapki',			6,2,	'1',	45.99,	200,		50,		10),
('Spodnie',			6,2,	'1',	129.89,	100,		0,		10),
('KitKat',			7,3,	'1',	3.5,	30,		0,		25),
('Tulipan',			8,4,	'1',	2,		70,		0,		7),
('R�a',			8,4,	'1',	4.5,	55,		22,		11),
('Bazy danych dla opornych',9,5,'1',96.99,	300,		100,		10);

--wprowadzam dane Zam�wienia (po wykonaniu zapytania brak b��d�w)
--z uwagi na Triggery sprawdzaj�ce poproawno�� dat ka�dy wiersz wprowadzam osobno
INSERT Zam�wienia VALUES
(2,	1,	'2021-04-04',	'2021-04-18',	'2021-04-15',	1,	7.99,	'Gugle Kowalski Karol',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska')
INSERT Zam�wienia VALUES
(6,	8,	'2021-04-13',	'2021-04-27',	'2021-04-17',	3,	9.99,	'Adamska Natalia',		'al.Zamkowa 33',	'43-300',	'Bielsko',	'Polska')
INSERT Zam�wienia VALUES
(7,	2,	'2021-04-24',	'2021-05-08',	'2021-04-25',	NULL, NULL,	'Piramida finanse Dolar Piotr','ul.Z�oty potok 7','00-778','Warszawa','Polska')

--wprowadzam dane PozycjiZam�wienia (po wykonaniu zapytania brak b��d�w)
--z uwagi na Trigger sprawdzaj�cy dostepno�� towaru ka�dy wiersz wprowadzam osobno
INSERT PozycjeZam�wienia VALUES
(1,	1,	3.99,	4,	0)
INSERT PozycjeZam�wienia VALUES
(1,	7,	1.85,	10,	0.10)
INSERT PozycjeZam�wienia VALUES
(1,	12,	3.5,	1,	0)
INSERT PozycjeZam�wienia VALUES
(2,	3,	8.98,	3,	0)
INSERT PozycjeZam�wienia VALUES
(2,	12,	3.5,	2,	0)
INSERT PozycjeZam�wienia VALUES
(2,	2,	4.49,	1,	0)
INSERT PozycjeZam�wienia VALUES
(2,	8,	2.9,	4,	0)
INSERT PozycjeZam�wienia VALUES
(2,	9,	5.12,	3,	0)
INSERT PozycjeZam�wienia VALUES
(3,	15,	69.99,	200,	0.25)
INSERT PozycjeZam�wienia VALUES
(3,	10,	45.99,	50,		0.10)
INSERT PozycjeZam�wienia VALUES
(3,	11,	129.89,	60,		0.10)

--TESTOWANIE BAZY POD K�TEM DOTRZYMANIA ZA�O�ONYCH FUNKCJONALON�CI

--1. DZIA�ANIE ZABEZPIECZE�:

--TABELA ZAM�WIENIA:
--Wprowadzenie z�ej daty wysy�ki
--B��D - Wprowadzona DataWysy�ki w tabeli Zam�wienia jest niepoprawna
INSERT Zam�wienia VALUES
(2,	1,	'2021-04-15',	'2021-04-18',	'2021-04-04',	1,	7.99,	'Gugle Kowalski Karol',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska')

--Wprowadzenie z�ej daty wysy�ki
--B��D - Wprowadzona DataWymagana w tabeli Zam�wienia jest niepoprawna
INSERT Zam�wienia VALUES
(2,	1,	'2021-04-16',	'2021-04-04',	'2021-04-15',	1,	7.99,	'Gugle Kowalski Karol',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska')

--TABELA PRACOWNICY:
--Wprowadzenie z�ego kodu pocztowego
--B��D - Wprowadzony KodPocztowy w tabeli Pracownicy jest niepoprawny
INSERT Pracownicy VALUES
('Gadowski',	'Micha�',	'Magazynier',	'1970-08-08',	'1996-01-24',	'ul.M�y�ska 65',	'30--063',	'Krak�w',	'Poslka',	'456785674',	NULL,	2)

--Wprowadzenie b��dnego nazwiska
--The INSERT statement conflicted with the CHECK constraint "chNazwiskoPracownicy". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Pracownicy", column 'Nazwisko'.
INSERT Pracownicy VALUES
('Gadow2ski',	'Micha�',	'Magazynie5r',	'1970-08-08',	'1996-01-24',	'ul.M�y�ska 65',	'30-063',	'Krak�w',	'Poslka',	'456785674',	NULL,	2)

--Wprowadzenie b��dnego imienia
--The INSERT statement conflicted with the CHECK constraint "chImiePracownicy". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Pracownicy", column 'Imi�'.
INSERT Pracownicy VALUES
('Gadowski',	'M-icha�',	'Magazynier',	'1970-08-08',	'1996-01-24',	'ul.M�y�ska 65',	'30-063',	'Krak�w',	'Poslka',	'456785674',	NULL,	2)

--YABELA POZYCJE ZAM�WIENIA
--wprowadzenie zam�wienia z ilo�ci� toworu wi�ksz� ni� dost�pna w magazynie
--UWAGA - Wprowadzona Ilo�� jest niedost�pna, zam�wienia nie mo�na zrealizowa�
INSERT PozycjeZam�wienia VALUES
(3,	11,	129.89,	60,		0.10)

--TABELA KLIENCI:
--Wprowadzenie z�ego kodu pocztowego
--B��D - Wprowadzony KodPocztowy w tabeli Klienci jest niepoprawny
INSERT Klienci VALUES
(NULL,		'Brzoza',	'Julia',	'ul.Le�na 12',		'30-0-3',	'Krak�w',	'Poslka',	'354834456')

--Wprowadzenie b��dnego nazwiska
--The INSERT statement conflicted with the CHECK constraint "chNazwiskoKlienci". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Klienci", column 'Nazwisko'.
INSERT Klienci VALUES
(NULL,		'Brzo9za',	'Julia',	'ul.Le�na 12',		'30-063',	'Krak�w',	'Poslka',	'354834456')

--Wprowadzenie b��dnego imienia
--The INSERT statement conflicted with the CHECK constraint "chImieKlienci". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Klienci", column 'Imi�'.
INSERT Klienci VALUES
(NULL,		'Brzoza',	'Ju-9lia',	'ul.Le�na 12',		'30-063',	'Krak�w',	'Poslka',	'354834456')

--TABELA KATEGORIE
--Wprowadzenie b��dnej nazyw kategorii
--B��D - Wprowadzona NazwaKategorii w tabeli Kategorie jest niepoprawna
INSERT Kategorie VALUES
('0braz',	NULL,		NULL)

--TABEla dostawcy
--Wprowadzenie b��dnej nazyw
--B��D - Wprowadzony KodPocztowy w tabeli Dostawcy jest niepoprawny
INSERT Dostawcy VALUES
('Ten Smak', 	'ul.Konesera 102',	'93-4800',	'��dz',	'Polska',	'987645623',	'www.smakten.pl')


--2. - DZIA�ANIE WIDOKU
-- Widok wy�witlaj�cy dane
-- potrzebne do wystawienia faktury dla klienta do ka�dego zam�wienia

--(ID zam�wienia, Dat� zam�wienia, Pracowik kt�ry obs�uguje zam�wienie,
--Odbiorca zam�wienia, Adres kupuj�cego, Ca�kowita warto�� zam�wienia + uwzgl�dni� rabat)
DROP VIEW IF EXISTS dbo.v_Faktury
GO

CREATE VIEW v_Faktury (
[ID],
[Data],
[Pracownik],
[Klient],
[Adres],
[Warto�� zam�wienia]) 
AS (
SELECT z.ID, z.DataZam�wienia, p.Imi� + ' ' + p.Nazwisko, 
	CONCAT(k.NazwaFirmy +', ', k.Imi�, ' ',  k.Nazwisko), 
	z.AdresOdbiorcy + ', ' + z.KodPocztowyOdbiorcy + ', ' + z.MiastoOdbiorcy + ', ' + z.KrajOdbiorcy,  
	( SELECT t1.Warto��
	  FROM ( SELECT z.ID, sum(pz.CenaJednostkowa * pz.Ilo�� * (1 - pz.Rabat)) AS Warto��
		     FROM PozycjeZam�wienia pz, Zam�wienia z
			 WHERE pz.IdZam�wienia = z.ID
			 GROUP BY z.ID) t1
	WHERE t1.ID = z.ID) [Warto�� Zam�wienia]
FROM Zam�wienia z, Pracownicy p, Klienci k
WHERE z.IdPracownika = p.Id 
AND z.IdKlienta = k.ID 
);
GO

--Przyk�ad wywo�ania widoku faktury
SELECT *
FROM v_Faktury

--3. - DZIA�ANIE FUNKCJI:
--Funkcja zwracaj�ca produkty kt�re nale�y uzupe�ni�
--w celu szbkiego zape�nienia magazynu

--(wy�wietla produkty kt�rych stan minimum na magazynie jest 
--przekorczony )
DROP FUNCTION IF EXISTS dbo.f_ProduktyDoUzupe�nienia
GO

CREATE FUNCTION dbo.f_ProduktyDoUzupe�nienia ()
RETURNS TABLE
AS
RETURN(	SELECT p.NazwaProduktu, p.StanMagazynu, p.Ilo��Minimum
		FROM Produkty p, PozycjeZam�wienia pz
		WHERE p.ID = pz.IdProduktu
		AND p.StanMagazynu < p.Ilo��Minimum
	  );
GO

--Przyk�ad wywo�ania funkcji:
SELECT *
FROM f_ProduktyDoUzupe�nienia ()

--4. - DZIA�ANIE PROCEDURY:
--Procedura wpisuj�ca zestawienie transakcji danego klienta:
--w celu rozliczenia miesi�cznego z klientem

--(IDKlienta, NazwaKlienta, IDzam�wienia i dat� zam�wienia.
--(Parametrem wej�ciowym jest identyfikator klienta)
DROP PROCEDURE IF EXISTS dbo.spu_Zamowienia_Klienta;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.spu_Zamowienia_Klienta
@id AS NVARCHAR(5)
AS
BEGIN
SELECT k.ID 'ID Klienta',CONCAT(k.NazwaFirmy +', ', k.Imi�, ' ',  k.Nazwisko)'Klient', 
z.ID 'ID Zam�wienia', z.DataZam�wienia 'Data Zam�wienia'
FROM Klienci AS k JOIN Zam�wienia AS z
ON k.ID = z.IDklienta
WHERE k.ID = @id
END;
GO

--Przyk��d uruchowmienia procedury
EXEC dbo.spu_Zamowienia_Klienta
@id = '6'


--Procedura zmieniaj�ce dane na podstawie transakcji
-- aby zoptymalizowa� dzia�anie bazy danych 
-- zmniejszenie czasu potrzebnego na obs�ug� bazy

--(zmniejszenie stanu magazynu o zam�wione produkty)
DROP PROCEDURE IF EXISTS dbo.spu_Zmie�StanProdukty
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO

CREATE PROCEDURE dbo.spu_Zmie�StanProdukty
@IDProduktu AS INT,
@Ilo��Zamawiana AS SMALLINT

AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Produkty
	SET StanMagazynu = StanMagazynu - @Ilo��Zamawiana
	WHERE ID = @IDProduktu
	SET NOCOUNT OFF;
END;
GO

/*
Przyk��d uruchowmienia procedury:

za pomoc� dodatkowego triggera kt�ry sprawdzi mo�liwo�� realizacji zam�wienia, 
oraz zmodyfikuje ilo�� produkt�w dost�pnych w magazynie
*/
DROP TRIGGER IF EXISTS dbo.trPotrzebnyTowar
GO

CREATE TRIGGER dbo.trPotrzebnyTowar
ON PozycjeZam�wienia
FOR INSERT, UPDATE
AS
IF ((SELECT p.StanMagazynu
	FROM Produkty p, inserted i
	WHERE p.Id = i.IdProduktu) - (SELECT Ilo��
								FROM inserted)<0)
	BEGIN
	PRINT 'UWAGA - Wprowadzona Ilo�� jest niedost�pna, zam�wienia nie mo�na zrealizowa�';
	ROLLBACK TRANSACTION;
	END
ELSE
	BEGIN
	DECLARE @ID int
	DECLARE @Ilo�� int
	SELECT @ID =(SELECT IdProduktu
			FROM inserted)
	SELECT @Ilo��=( SELECT Ilo��
				FROM inserted)
		EXEC dbo.spu_Zmie�StanProdukty
		@ID, @Ilo��
	END
GO

--Najlepszym przyk��dem jest sprawdzenie ilo�ci dostepnych ksi��ek o bazach danych
-- ich ilo�� zosta�a zmiejszona gdy w 3 zam�wieniu klient zam�wi� 200 sztuk
-- trigger po sprawdzeniu czy operacja jest mo�liwa do wykonania wywo�a�
-- procedur� kt�ra zmieni�a ilo�� ksi��ki zapisan� w stan magazynu o 200 stuk 