USE BD2_Projekt_OZHID
GO

-- Widok wyświtlający dane
-- potrzebne do wystawienia faktury dla klienta do każdego zamówienia

--(ID zamówienia, Datę zamówienia, Pracowik który obsługuje zamówienie,
--Odbiorca zamówienia, Adres kupującego, Całkowita wartość zamówienia + uwzględnić rabat)
DROP VIEW IF EXISTS dbo.v_Faktury
GO

CREATE VIEW v_Faktury (
[ID],
[Data],
[Pracownik],
[Klient],
[Adres],
[Wartość zamówienia]) 
AS (
SELECT z.ID, z.DataZamówienia, p.Imię + ' ' + p.Nazwisko, 
	CONCAT(k.NazwaFirmy +', ', k.Imię, ' ',  k.Nazwisko), 
	z.AdresOdbiorcy + ', ' + z.KodPocztowyOdbiorcy + ', ' + z.MiastoOdbiorcy + ', ' + z.KrajOdbiorcy,  
	( SELECT t1.Wartość
	  FROM ( SELECT ID, SUM(CenaJednostkowa * Ilość * (1 - Rabat)) AS Wartość
		     FROM PozycjeZamówienia
			 GROUP BY ID) t1) [Wartość Zamówienia]
FROM Zamówienia z, Pracownicy p, Klienci k
WHERE z.IdPracownika = p.Id 
AND z.IdKlienta = k.ID 
);
GO

/*
Przykład wywołania widoku faktury

SELECT *
FROM v_Faktury
*/

 
--Funkcja zwracająca produkty które należy uzupełnić
--w celu szbkiego zapełnienia magazynu

--(wyświetla produkty których stan minimum na magazynie jest 
--przekorczony )
DROP FUNCTION IF EXISTS dbo.f_ProduktyDoUzupełnienia
GO

CREATE FUNCTION dbo.f_ProduktyDoUzupełnienia ()
RETURNS TABLE
AS
RETURN(	SELECT p.NazwaProduktu, p.StanMagazynu, p.IlośćMinimum
		FROM Produkty p, PozycjeZamówienia pz
		WHERE p.ID = pz.IdProduktu
		AND pz.Ilość < p.IlośćMinimum
	  );
GO

/*
Przykład wywołania funkcji:

SELECT *
FROM f_ProduktyDoUzupełnienia ()
*/

--Procedura wpisująca zestawienie transakcji danego klienta:
--w celu rozliczenia miesięcznego z klientem

--(IDKlienta, NazwaKlienta, IDzamówienia i datę zamówienia.
--(Parametrem wejściowym jest identyfikator klienta)


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
SELECT k.ID 'ID Klienta', k.NazwaFirmy 'Nazwa Firmy', z.ID 'ID
Zamówienia', z.DataZamówienia 'Data Zamówienia'
FROM Klienci AS k JOIN Zamówienia AS z
ON k.ID = z.IDklienta
WHERE k.ID = @id
END;
GO

/*
Przykłąd uruchowmienia procedury

EXEC dbo.spu_Zamowienia_Klienta
@id = '13'
*/
 
--Procedura zmieniające dane na podstawie transakcji
-- aby zoptymalizować działanie bazy danych 
-- zmniejszenie czasu potrzebnego na obsługę bazy

--(zmniejszenie stanu magazynu o zamówione produkty)
DROP PROCEDURE IF EXISTS dbo.spu_ZmieńStanProdukty
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO

CREATE PROCEDURE dbo.spu_ZmieńStanProdukty
@IDProduktu AS INT,
@IlośćZamawiana AS SMALLINT

AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Produkty
	SET StanMagazynu = StanMagazynu - @IlośćZamawiana
	WHERE ID = @IDProduktu
	SET NOCOUNT OFF;
END;
GO

/*
Przykłąd uruchowmienia procedury:

za pomocą dodatkowego triggera który sprawdzi możliwość realizacji zamówienia, 
oraz zmodyfikuje ilość produktów dostępnych w magazynie
*/
DROP TRIGGER IF EXISTS dbo.trPotrzebnyTowar
GO

CREATE TRIGGER dbo.trPotrzebnyTowar
ON PozycjeZamówienia
FOR INSERT, UPDATE
AS
IF ((SELECT p.StanMagazynu
	FROM Produkty p, inserted i
	WHERE p.Id = i.IdProduktu) - (SELECT Ilość
								FROM inserted)<0)
	BEGIN
	PRINT 'UWAGA - Wprowadzona Ilość jest niedostępna, zamówienia nie można zrealizować';
	ROLLBACK TRANSACTION;
	END
ELSE
	BEGIN
	DECLARE @ID int
	DECLARE @Ilość int
	SELECT @ID =(SELECT IdProduktu
			FROM inserted)
	SELECT @Ilość=( SELECT Ilość
				FROM inserted)
		EXEC dbo.spu_ZmieńStanProdukty
		@ID, @Ilość
	END
GO
