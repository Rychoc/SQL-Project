USE BD2_Projekt_OZHID
GO
/*
--KODY U¯YWANE PODCZAS WPROWADZANIA DANYCH I TESTOWANIA:
--resetowanie IDENTYFI COUNT
--aby wszystkie nowowprowadzone dane by³y indeksowane od 1 z krokiem 1
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
DBCC CHECKIDENT ('PozycjeZamówienia', RESEED, 0);
GO
DBCC CHECKIDENT ('Zamówienia', RESEED, 0);
GO

--Kasowanie zawartoœci tabel
--aby ponownie spróbowaæ wprowadziæ wszystkie wartoœci po nieudanej próbie
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
DELETE Zamówienia
GO
DELETE PozycjeZamówienia
GO
*/


--Poprawne dane zaimplementowane do tabeli:

--wprowadzam dane Spedytorów (Po wykonaniu zapytania brak b³êdów)
INSERT INTO Spedytorzy
VALUES
('Kurier 9',			'567567567'),
('Poczta krajowa',	'875676455'),
('Automat paczkowy',	'698736547');

--wprowadzam dane Kategorii (po wykonaniu zapytania brak b³êdów)
INSERT INTO Kategorie
VALUES
('Nabia³',	'Produkty mleczne',				NULL),	
('Fastfood','¯ywnoœæ wysoko przetworzona',	NULL),
('Warzywa',	'Œwie¿e warzywa',				NULL),
('Owoce',	'Œwie¿e owoce',					NULL),
('Napoje',	'Produkty do wypicia',			NULL),
('Odzierz',	 NULL,							NULL),
('S³odycze','S³odkie przek¹ski',			NULL),
('Kwiaty',	 NULL,							NULL),
('Ksi¹¿ki','Ksi¹¿ki w formie papierowej',	NULL);

--wprowadzam dane Dostawcy (po wykonaniu zapytania brak b³êdów)
INSERT INTO Dostawcy
VALUES
('Warzywniak Rolnictwo','ul.Piastowska 22',	'43-300',	'Bielsko',	'Polska',	'147295321',	'www.warzywniakrol.pl'),
('Szmatka Original',	'ul.Przêdzalnicza 3',	'00-778',	'Warszawa',	'Poslka',	'438745239',	'www.szmatka.pl'),
('Ten Smak', 			'ul.Konesera 102',		'93-480',	'£ódz',		'Polska',	'987645623',	'www.smakten.pl'),
('Bukiecik',			'ul.Polna 19',			'30-063',	'Kraków',	'Polska',	'698774356',	'www.kwiatybukiecik.pl'),
('Popisanka',			'ul.Artystów 1',		'54-007',	'Wroc³aw',	'Polska',	'253485769',	'www.popisanka.pl');

--wprowadzam dane Pracownicy (po wykonaniu zapytania brak b³êdów)
INSERT INTO Pracownicy
VALUES
('Kowalski',	'Tadeusz',	'Szef',			'1961-01-16',	'1990-07-04',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska',	'764557816',	NULL,	NULL),
('Malarz',		'Anna',		'Sekretarka',	'1984-03-05',	'2004-08-21',	'ul.Kolista 12',	'00-778',	'Warszawa',	'Poslka',	'164856487',	NULL,	1),
('Adamski',		'Jakub',	'Kierownik',	'1959-09-11',	'1999-02-26',	'ul.Z³oty potok 7',	'00-778',	'Warszawa',	'Polska',	'768547247',   'Urlop',	1),
('Szpak',		'Miros³aw',	'Magazynier',	'1977-02-20',	'1996-08-08',	'ul.Kolini 1',		'93-480',	'£ódz',		'Polska',	'458674258',	NULL,	4),
('Gadowski',	'Micha³',	'Magazynier',	'1970-08-08',	'1996-01-24',	'ul.M³yñska 65',	'30-063',	'Kraków',	'Poslka',	'456785674',	NULL,	2),
('Kowalska',	'Jadwiga',	'Magazynier',	'1989-12-29',	'2017-06-16',	'al.Grzybiarzy 40',	'54-007',	'Wroc³aw',	'Polska',	'546645678',	NULL,	2),
('Tyczka',		'Joanna',	'Kierownik',	'1999-06-01',	'2019-11-16',	'al.Zamkowa 33',	'43-300',	'Bielsko',	'Polska',	'453455645',	NULL,	1),
('Wykrêt',		'Daniel',	'Informatyk',	'1998-07-21',	'2007-01-06',	'ul.Wysoka 187',	'93-480',	'£ódz',		'Polska',	'546489878',	NULL,	7),
('Piêta',		'B³arzej',	'Logistyk',		'2000-12-24',	'2019-06-11',	'ul.Leœna 34',		'30-063',	'Kraków',	'Polska',	'457658657',   'Podwy¿ka',7),
('Czul',		'Ma³gorzata','Sprzedawca',	'2002-05-25',	'2020-11-09',	'ul.Malarzy 61',	'54-007',	'Wroc³aw',	'Polska',	'666857886',	NULL,	7);

--wprowadzam dane Klienci (po wykonaniu zapytania brak b³êdów)
INSERT INTO Klienci
VALUES
('Gugle',		'Kowalski',	'Karol',	'ul.Pegaza 60',		'43-300',	'Bielsko',	'Polska',	'465987549'),
('CornWin',	'Janik',	'Artur',	'ul.Fio³kowej 23',	'00-778',	'Warszawa',	'Poslka',	'435675897'),
(NULL,		'Gruszka',	'Jan',		'al.Sadownicza 54',	'93-480',	'£ódz',		'Polska',	'435890725'),
(NULL,		'Brzoza',	'Julia',	'ul.Leœna 12',		'30-063',	'Kraków',	'Poslka',	'354834456'),
('Oowca',		'Broda',	'Kuba',		'al.Równoœci 2',	'54-007',	'Wroc³aw',	'Polska',	'986245475'),
(NULL,		'Adamska',	'Natalia',	'al.Kolista 80',	'43-300',	'Bielsko',	'Polska',	'457696763'),
('Piramida finanse','Dolar','Piotr',	'ul.Bankowa 99',	'00-778',	'Warszawa',	'Polska',	'453242544'),
('Baranek s.a','Cinek',	'Grzegorz',	'ul.Morksa 7',		'93-480',	'£ódz',		'Polska',	'234598685'),
(NULL,		'Wêgiel',	'Krystyna',	'ul.Z³otników 74',	'30-063',	'Kraków',	'Polska',	'758694456'),
(NULL,		'Bu³ka',	'Stefan',	'ul.Piekarska 66',	'54-007',	'Wroc³aw',	'Polska',	'356368696');

--Powy¿sze dane nie ³¹czy³y siê zale¿noœciami ze soba, 
--dlatego wymaga³y wprowadzenia ich w pierwszej kolejnoœci 
--aby móc zaimplementowaæ pozosta³e dane do tabel

--wprowadzam dane Produkty (po wykonaniu zapytania brak b³êdów)
INSERT INTO Produkty
VALUES
('Ser bia³y',		1,3,	'1',	3.99,	100,	0,		60),
('Ser ¿ó³ty',		1,3,	'1',	4.49,	60,		0,		60),
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
('Ró¿a',			8,4,	'1',	4.5,	55,		22,		11),
('Bazy danych dla opornych',9,5,'1',96.99,	300,		100,		10);

--wprowadzam dane Zamówienia (po wykonaniu zapytania brak b³êdów)
--z uwagi na Triggery sprawdzaj¹ce poproawnoœæ dat ka¿dy wiersz wprowadzam osobno
INSERT Zamówienia VALUES
(2,	1,	'2021-04-04',	'2021-04-18',	'2021-04-15',	1,	7.99,	'Gugle Kowalski Karol',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska')
INSERT Zamówienia VALUES
(6,	8,	'2021-04-13',	'2021-04-27',	'2021-04-17',	3,	9.99,	'Adamska Natalia',		'al.Zamkowa 33',	'43-300',	'Bielsko',	'Polska')
INSERT Zamówienia VALUES
(7,	2,	'2021-04-24',	'2021-05-08',	'2021-04-25',	NULL, NULL,	'Piramida finanse Dolar Piotr','ul.Z³oty potok 7','00-778','Warszawa','Polska')

--wprowadzam dane PozycjiZamówienia (po wykonaniu zapytania brak b³êdów)
--z uwagi na Trigger sprawdzaj¹cy dostepnoœæ towaru ka¿dy wiersz wprowadzam osobno
INSERT PozycjeZamówienia VALUES
(1,	1,	3.99,	4,	0)
INSERT PozycjeZamówienia VALUES
(1,	7,	1.85,	10,	0.10)
INSERT PozycjeZamówienia VALUES
(1,	12,	3.5,	1,	0)
INSERT PozycjeZamówienia VALUES
(2,	3,	8.98,	3,	0)
INSERT PozycjeZamówienia VALUES
(2,	12,	3.5,	2,	0)
INSERT PozycjeZamówienia VALUES
(2,	2,	4.49,	1,	0)
INSERT PozycjeZamówienia VALUES
(2,	8,	2.9,	4,	0)
INSERT PozycjeZamówienia VALUES
(2,	9,	5.12,	3,	0)
INSERT PozycjeZamówienia VALUES
(3,	15,	69.99,	200,	0.25)
INSERT PozycjeZamówienia VALUES
(3,	10,	45.99,	50,		0.10)
INSERT PozycjeZamówienia VALUES
(3,	11,	129.89,	60,		0.10)

--TESTOWANIE BAZY POD K¥TEM DOTRZYMANIA ZA£O¯ONYCH FUNKCJONALONŒCI

--1. DZIA£ANIE ZABEZPIECZEÑ:

--TABELA ZAMÓWIENIA:
--Wprowadzenie z³ej daty wysy³ki
--B£¥D - Wprowadzona DataWysy³ki w tabeli Zamówienia jest niepoprawna
INSERT Zamówienia VALUES
(2,	1,	'2021-04-15',	'2021-04-18',	'2021-04-04',	1,	7.99,	'Gugle Kowalski Karol',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska')

--Wprowadzenie z³ej daty wysy³ki
--B£¥D - Wprowadzona DataWymagana w tabeli Zamówienia jest niepoprawna
INSERT Zamówienia VALUES
(2,	1,	'2021-04-16',	'2021-04-04',	'2021-04-15',	1,	7.99,	'Gugle Kowalski Karol',	'ul.Prosta 3',		'43-300',	'Bielsko',	'Polska')

--TABELA PRACOWNICY:
--Wprowadzenie z³ego kodu pocztowego
--B£¥D - Wprowadzony KodPocztowy w tabeli Pracownicy jest niepoprawny
INSERT Pracownicy VALUES
('Gadowski',	'Micha³',	'Magazynier',	'1970-08-08',	'1996-01-24',	'ul.M³yñska 65',	'30--063',	'Kraków',	'Poslka',	'456785674',	NULL,	2)

--Wprowadzenie b³êdnego nazwiska
--The INSERT statement conflicted with the CHECK constraint "chNazwiskoPracownicy". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Pracownicy", column 'Nazwisko'.
INSERT Pracownicy VALUES
('Gadow2ski',	'Micha³',	'Magazynie5r',	'1970-08-08',	'1996-01-24',	'ul.M³yñska 65',	'30-063',	'Kraków',	'Poslka',	'456785674',	NULL,	2)

--Wprowadzenie b³êdnego imienia
--The INSERT statement conflicted with the CHECK constraint "chImiePracownicy". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Pracownicy", column 'Imiê'.
INSERT Pracownicy VALUES
('Gadowski',	'M-icha³',	'Magazynier',	'1970-08-08',	'1996-01-24',	'ul.M³yñska 65',	'30-063',	'Kraków',	'Poslka',	'456785674',	NULL,	2)

--YABELA POZYCJE ZAMÓWIENIA
--wprowadzenie zamówienia z iloœci¹ toworu wiêksz¹ ni¿ dostêpna w magazynie
--UWAGA - Wprowadzona Iloœæ jest niedostêpna, zamówienia nie mo¿na zrealizowaæ
INSERT PozycjeZamówienia VALUES
(3,	11,	129.89,	60,		0.10)

--TABELA KLIENCI:
--Wprowadzenie z³ego kodu pocztowego
--B£¥D - Wprowadzony KodPocztowy w tabeli Klienci jest niepoprawny
INSERT Klienci VALUES
(NULL,		'Brzoza',	'Julia',	'ul.Leœna 12',		'30-0-3',	'Kraków',	'Poslka',	'354834456')

--Wprowadzenie b³êdnego nazwiska
--The INSERT statement conflicted with the CHECK constraint "chNazwiskoKlienci". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Klienci", column 'Nazwisko'.
INSERT Klienci VALUES
(NULL,		'Brzo9za',	'Julia',	'ul.Leœna 12',		'30-063',	'Kraków',	'Poslka',	'354834456')

--Wprowadzenie b³êdnego imienia
--The INSERT statement conflicted with the CHECK constraint "chImieKlienci". 
--The conflict occurred in database "BD2_Projekt_OZHID", table "dbo.Klienci", column 'Imiê'.
INSERT Klienci VALUES
(NULL,		'Brzoza',	'Ju-9lia',	'ul.Leœna 12',		'30-063',	'Kraków',	'Poslka',	'354834456')

--TABELA KATEGORIE
--Wprowadzenie b³êdnej nazyw kategorii
--B£¥D - Wprowadzona NazwaKategorii w tabeli Kategorie jest niepoprawna
INSERT Kategorie VALUES
('0braz',	NULL,		NULL)

--TABEla dostawcy
--Wprowadzenie b³êdnej nazyw
--B£¥D - Wprowadzony KodPocztowy w tabeli Dostawcy jest niepoprawny
INSERT Dostawcy VALUES
('Ten Smak', 	'ul.Konesera 102',	'93-4800',	'£ódz',	'Polska',	'987645623',	'www.smakten.pl')


--2. - DZIA£ANIE WIDOKU
-- Widok wyœwitlaj¹cy dane
-- potrzebne do wystawienia faktury dla klienta do ka¿dego zamówienia

--(ID zamówienia, Datê zamówienia, Pracowik który obs³uguje zamówienie,
--Odbiorca zamówienia, Adres kupuj¹cego, Ca³kowita wartoœæ zamówienia + uwzglêdniæ rabat)
DROP VIEW IF EXISTS dbo.v_Faktury
GO

CREATE VIEW v_Faktury (
[ID],
[Data],
[Pracownik],
[Klient],
[Adres],
[Wartoœæ zamówienia]) 
AS (
SELECT z.ID, z.DataZamówienia, p.Imiê + ' ' + p.Nazwisko, 
	CONCAT(k.NazwaFirmy +', ', k.Imiê, ' ',  k.Nazwisko), 
	z.AdresOdbiorcy + ', ' + z.KodPocztowyOdbiorcy + ', ' + z.MiastoOdbiorcy + ', ' + z.KrajOdbiorcy,  
	( SELECT t1.Wartoœæ
	  FROM ( SELECT z.ID, sum(pz.CenaJednostkowa * pz.Iloœæ * (1 - pz.Rabat)) AS Wartoœæ
		     FROM PozycjeZamówienia pz, Zamówienia z
			 WHERE pz.IdZamówienia = z.ID
			 GROUP BY z.ID) t1
	WHERE t1.ID = z.ID) [Wartoœæ Zamówienia]
FROM Zamówienia z, Pracownicy p, Klienci k
WHERE z.IdPracownika = p.Id 
AND z.IdKlienta = k.ID 
);
GO

--Przyk³ad wywo³ania widoku faktury
SELECT *
FROM v_Faktury

--3. - DZIA£ANIE FUNKCJI:
--Funkcja zwracaj¹ca produkty które nale¿y uzupe³niæ
--w celu szbkiego zape³nienia magazynu

--(wyœwietla produkty których stan minimum na magazynie jest 
--przekorczony )
DROP FUNCTION IF EXISTS dbo.f_ProduktyDoUzupe³nienia
GO

CREATE FUNCTION dbo.f_ProduktyDoUzupe³nienia ()
RETURNS TABLE
AS
RETURN(	SELECT p.NazwaProduktu, p.StanMagazynu, p.IloœæMinimum
		FROM Produkty p, PozycjeZamówienia pz
		WHERE p.ID = pz.IdProduktu
		AND p.StanMagazynu < p.IloœæMinimum
	  );
GO

--Przyk³ad wywo³ania funkcji:
SELECT *
FROM f_ProduktyDoUzupe³nienia ()

--4. - DZIA£ANIE PROCEDURY:
--Procedura wpisuj¹ca zestawienie transakcji danego klienta:
--w celu rozliczenia miesiêcznego z klientem

--(IDKlienta, NazwaKlienta, IDzamówienia i datê zamówienia.
--(Parametrem wejœciowym jest identyfikator klienta)
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
SELECT k.ID 'ID Klienta',CONCAT(k.NazwaFirmy +', ', k.Imiê, ' ',  k.Nazwisko)'Klient', 
z.ID 'ID Zamówienia', z.DataZamówienia 'Data Zamówienia'
FROM Klienci AS k JOIN Zamówienia AS z
ON k.ID = z.IDklienta
WHERE k.ID = @id
END;
GO

--Przyk³¹d uruchowmienia procedury
EXEC dbo.spu_Zamowienia_Klienta
@id = '6'


--Procedura zmieniaj¹ce dane na podstawie transakcji
-- aby zoptymalizowaæ dzia³anie bazy danych 
-- zmniejszenie czasu potrzebnego na obs³ugê bazy

--(zmniejszenie stanu magazynu o zamówione produkty)
DROP PROCEDURE IF EXISTS dbo.spu_ZmieñStanProdukty
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO

CREATE PROCEDURE dbo.spu_ZmieñStanProdukty
@IDProduktu AS INT,
@IloœæZamawiana AS SMALLINT

AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Produkty
	SET StanMagazynu = StanMagazynu - @IloœæZamawiana
	WHERE ID = @IDProduktu
	SET NOCOUNT OFF;
END;
GO

/*
Przyk³¹d uruchowmienia procedury:

za pomoc¹ dodatkowego triggera który sprawdzi mo¿liwoœæ realizacji zamówienia, 
oraz zmodyfikuje iloœæ produktów dostêpnych w magazynie
*/
DROP TRIGGER IF EXISTS dbo.trPotrzebnyTowar
GO

CREATE TRIGGER dbo.trPotrzebnyTowar
ON PozycjeZamówienia
FOR INSERT, UPDATE
AS
IF ((SELECT p.StanMagazynu
	FROM Produkty p, inserted i
	WHERE p.Id = i.IdProduktu) - (SELECT Iloœæ
								FROM inserted)<0)
	BEGIN
	PRINT 'UWAGA - Wprowadzona Iloœæ jest niedostêpna, zamówienia nie mo¿na zrealizowaæ';
	ROLLBACK TRANSACTION;
	END
ELSE
	BEGIN
	DECLARE @ID int
	DECLARE @Iloœæ int
	SELECT @ID =(SELECT IdProduktu
			FROM inserted)
	SELECT @Iloœæ=( SELECT Iloœæ
				FROM inserted)
		EXEC dbo.spu_ZmieñStanProdukty
		@ID, @Iloœæ
	END
GO

--Najlepszym przyk³¹dem jest sprawdzenie iloœci dostepnych ksi¹¿ek o bazach danych
-- ich iloœæ zosta³a zmiejszona gdy w 3 zamówieniu klient zamówi³ 200 sztuk
-- trigger po sprawdzeniu czy operacja jest mo¿liwa do wykonania wywo³a³
-- procedurê która zmieni³a iloœæ ksi¹¿ki zapisan¹ w stan magazynu o 200 stuk 