USE BD2_Projekt_OZHID
GO
-- Pracownicy - 3 ograniczenia i 2 triggery
ALTER TABLE dbo.Pracownicy DROP CONSTRAINT IF EXISTS chNazwiskoPracownicy
GO
ALTER TABLE dbo.Pracownicy
ADD CONSTRAINT chNazwiskoPracownicy CHECK (Nazwisko NOT LIKE '%[^A-Z, ^a-z]%' );
GO
ALTER TABLE dbo.Pracownicy DROP CONSTRAINT IF EXISTS chImiePracownicy
GO
ALTER TABLE dbo.Pracownicy
ADD CONSTRAINT chImiePracownicy CHECK (Imiê NOT LIKE '%[^A-Z, ^a-z]%' );
GO
ALTER TABLE dbo.Pracownicy DROP CONSTRAINT IF EXISTS chStanowiskoPracownicy
GO
ALTER TABLE dbo.Pracownicy
ADD CONSTRAINT chStanowiskoPracownicy CHECK (Stanowisko NOT LIKE '%[^A-Z, ^a-z]%' );
GO
DROP TRIGGER IF EXISTS trKodPocztowyPracownicy
GO
CREATE TRIGGER trKodPocztowyPracownicy
ON Pracownicy
FOR INSERT
AS
IF (
(SELECT COUNT(KodPocztowy)
FROM inserted
WHERE KodPocztowy NOT LIKE '[0-9][0-9]-[0-9][0-9][0-9]')>0
)
BEGIN
PRINT 'B£¥D - Wprowadzony KodPocztowy w tabeli Pracownicy jest niepoprawny';
ROLLBACK TRANSACTION;
END
GO
-- Klienci - 2 ograniczenia i 1 trigger
ALTER TABLE dbo.Klienci DROP CONSTRAINT IF EXISTS chNazwiskoKlienci
GO
ALTER TABLE dbo.Klienci
ADD CONSTRAINT chNazwiskoKlienci CHECK (Nazwisko NOT LIKE '%[^A-Z, ^a-z]%' );
GO
ALTER TABLE dbo.Klienci DROP CONSTRAINT IF EXISTS chImieKlienci
GO
ALTER TABLE dbo.Klienci
ADD CONSTRAINT chImieKlienci CHECK (Imiê NOT LIKE '%[^A-Z, ^a-z]%' );
GO
DROP TRIGGER IF EXISTS trKodPocztowyKlienci
GO
CREATE TRIGGER trKodPocztowyKlienci
ON Klienci
FOR INSERT
AS
IF (
(SELECT COUNT(KodPocztowy)
FROM inserted
WHERE KodPocztowy NOT LIKE '[0-9][0-9]-[0-9][0-9][0-9]')>0
)
BEGIN
PRINT 'B£¥D - Wprowadzony KodPocztowy w tabeli Klienci jest niepoprawny';
ROLLBACK TRANSACTION;
END
GO
-- Zamówienia - 3 triggery
DROP TRIGGER IF EXISTS trDataWymaganaZamówienia
GO
CREATE TRIGGER trDataWymaganaZamówienia
ON Zamówienia
FOR INSERT
AS
IF(
(SELECT DataWymagana
FROM inserted)
<
(SELECT DataZamówienia
FROM inserted)
)
BEGIN
PRINT 'B£¥D - Wprowadzona DataWymagana w tabeli Zamówienia jest niepoprawna';
ROLLBACK TRANSACTION;
END
GO
DROP TRIGGER IF EXISTS trDataWysy³kiZamówienia
GO
CREATE TRIGGER trDataWysy³kiZamówienia
ON Zamówienia
FOR INSERT
AS
IF(
(SELECT DataWysy³ki
FROM inserted)
<
(SELECT DataZamówienia
FROM inserted)
)
BEGIN
PRINT 'B£¥D - Wprowadzona DataWysy³ki w tabeli Zamówienia jest niepoprawna';
ROLLBACK TRANSACTION;
END
GO
DROP TRIGGER IF EXISTS trKodPocztowyZamówienia
GO
CREATE TRIGGER trKodPocztowyZamówienia
ON Zamówienia
FOR INSERT
AS
IF (
(SELECT COUNT(KodPocztowy)
FROM inserted
WHERE KodPocztowy NOT LIKE '[0-9][0-9]-[0-9][0-9][0-9]')>0
)
BEGIN
PRINT 'B£¥D - Wprowadzony KodPocztowy w tabeli Zamówienia jest niepoprawny';
ROLLBACK TRANSACTION;
END
GO
-- Pozycje zamówienia - brak koniecznoœci dodania dodatkowych ograniczeñ
-- Spedytorzy - brak koniecznoœci dodania dodatkowych ograniczeñ
-- Dostawcy - 1 trigger
DROP TRIGGER IF EXISTS trKodPocztowyDostawcy
GO
CREATE TRIGGER trKodPocztowyDostawcy
ON Dostawcy
FOR INSERT
AS
IF (
(SELECT COUNT(KodPocztowy)
FROM inserted
WHERE KodPocztowy NOT LIKE '[0-9][0-9]-[0-9][0-9][0-9]')>0
)
BEGIN
PRINT 'B£¥D - Wprowadzony KodPocztowy w tabeli Dostawcy jest niepoprawny';
ROLLBACK TRANSACTION;
END
GO
-- Produtky - 1 trigger
DROP TRIGGER IF EXISTS trNazwaProduktu
GO
CREATE TRIGGER trNazwaProduktu
ON Produkty
FOR INSERT
AS
IF (
(SELECT COUNT(NazwaKategorii)
FROM inserted
WHERE NazwaKategorii LIKE '%![a-z,A-Z,¹,ê,ó,œ,³,£,¿,Ÿ,æ, ]%')>0
)
BEGIN
PRINT 'B£¥D - Wprowadzona NazwaProduktu w tabeli Produkty jest niepoprawna';
ROLLBACK TRANSACTION;
END
GO
-- Kategorie - 1 trigger
DROP TRIGGER IF EXISTS trNazwaKategorii
GO
CREATE TRIGGER trNazwaKategorii
ON Kategorie
FOR INSERT
AS
IF (
(SELECT COUNT(NazwaKategorii)
FROM inserted
WHERE NazwaKategorii LIKE '%![a-z,A-Z,¹,ê,ó,œ,³,£,¿,Ÿ,æ, ]%')>0
)
BEGIN
PRINT 'B£¥D - Wprowadzona NazwaKategorii w tabeli Kategorie jest niepoprawna';
ROLLBACK TRANSACTION;
END
GO