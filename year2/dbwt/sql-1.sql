
-- Übersicht zu verfügbaren Schemas:
SHOW SCHEMAS;

-- Schema auswählen
use dbwt;

-- Übersicht zu verfügbaren Tabellen.
SHOW TABLES;

-- Aufbau rechts in IntelliJ betrachten: Schemas und Tabelle
-- Doppelklick auf Tabelle -> Daten in den Tabellen darstellen.

-- Einzeiliger Kommentar

/* Mehr-
   zeiliger
   Kommentar
 */

SELECT * FROM mitarbeiter;

-- Projektion (Spaltenauswahl)
SELECT vorname FROM mitarbeiter;
SELECT vorname, nachname FROM mitarbeiter;
-- Auswahl aus Spalten und Bestimmung der Reihenfolge der Spalten im Ergebnis.
SELECT nachname, vorname, mid FROM mitarbeiter;

-- SQL ist case insensitiv (Groß- und Kleinschreibung erlaubt)
SelECT VoRnAmE frOM MITarbeiter;
--  -> Empfehlung: SQL Schlüsselwort (wie SELECT, FROM, ...) vollständig großschreiben,
-- Attribute und Tabellennamen vollständig kleinschreiben zur Erhöhung der Lesbarkeit.

-- Umbenennung (Ergebnis steht in PHP dann auch in einem anderen Key im Ergebnisarray zur Verfügung)
SELECT vorname as firstname, nachname as lastname FROM mitarbeiter;

-- Oft zu sehen (insbesondere bei Exporten: Felder mit Backticks)
-- Hintergrund: Es sind Leerzeichen in Tabellen- und Spaltennamen erlaubt
--      -> Empfehlung: Keine Leerzeichen hierbei benutzen!
-- Inkompatibilitäten und Probleme beim Auslesen- / Verarbeiten der Daten sind die Folge.
SELECT `vorname` FROM `mitarbeiter`;

-- Berechnungen
SELECT personalnr * 2, gehalt / 2, personalnr * gehalt FROM mitarbeiter;

-- Operatoren >, <, =, !=, LIKE
SELECT * FROM mitarbeiter WHERE nachname = 'Bamford';
SELECT * FROM mitarbeiter WHERE nachname != 'Bamford';
SELECT * FROM mitarbeiter WHERE personalnr > 30;

-- LIKE: Es muss nicht zwangsläufig ein Zeichen davor stehen oder folgen:
-- Standardmäßig case-insensitiv (Keine Unterscheidung zwischen Groß- und Kleinbuchstaben)
SELECT * FROM mitarbeiter WHERE nachname LIKE '%d'; -- Gleich zu '%D'
-- enden:
SELECT * FROM mitarbeiter WHERE nachname LIKE 'd%';
-- enthalten
SELECT * FROM mitarbeiter WHERE nachname LIKE '%d%';
-- kein d enthalten.
SELECT * FROM mitarbeiter WHERE nachname NOT LIKE '%d%';

-- Selektion mit AND (logische UND-Verknüpfung)
SELECT * FROM mitarbeiter WHERE nachname LIKE 'pe%' AND geschlecht = 'F';

-- Selektion mit OR (logische ODER-Verknüpfung)
SELECT * FROM mitarbeiter WHERE personalnr = 42 OR personalnr = 43 OR personalnr = 45;

-- Auswahl von mehreren Werten mit IN.
SELECT * FROM mitarbeiter WHERE personalnr IN (42, 43, 45);

-- In SQL ist die Prüfung "... = NULL" per Definition immer false.
-- Also auch: NULL = NULL -> false. Deswegen prüfen wir auf NULL mit *IS* NULL.
SELECT * FROM mitarbeiter WHERE nachname IS NULL;

-- Sortierung: ASC (Aufsteigend - Standardwert), DESC (Absteigend).
SELECT * FROM mitarbeiter ORDER BY nachname; -- +ASC und DESC

-- Dubletten entfernen
SELECT DISTINCT nachname FROM mitarbeiter; -- 20 Treffer
SELECT DISTINCT vorname, nachname FROM mitarbeiter; -- 21 Treffer

-- Nur einen Teil der Datensätze abfragen, z.B. die ersten 10 Treffer:
SELECT nachname FROM mitarbeiter ORDER BY nachname LIMIT 10;
-- oder die 10 nächsten Datensätze,
SELECT nachname FROM mitarbeiter ORDER BY nachname LIMIT 10 OFFSET 10;
-- Funktionen
SELECT CONCAT(vorname, ',', nachname) FROM mitarbeiter;
SELECT LENGTH(vorname) * 2 FROM mitarbeiter;
SELECT IFNULL(nachname, 'Der Attributwert ist NULL') FROM mitarbeiter WHERE nachname IS NULL;
SELECT lower(vorname), upper(nachname) FROM mitarbeiter;

-- Komplexere Abfragen mit Funktionen:
-- Aufgabe: Mit wie viel Jahren steigen Mitarbeitende bei uns ein?
-- DATEDIFF -> Gibt Anzahl Tage zwischen bei Zeitpunkten zurück.
SELECT ROUND(DATEDIFF(einstiegsdatum, geburtstag) / 365, 2) FROM mitarbeiter;

-- Wie alt sind die einzelnen Mitarbeitenden heute?
SELECT DATEDIFF (NOW(), geburtstag) / 365 FROM mitarbeiter;

-- Aggregatfunktionen
-- Zähle Tupel, die ungleich NULL sind.
SELECT COUNT(nachname) FROM mitarbeiter; -- 20
SELECT COUNT(vorname) FROM mitarbeiter; -- 21

-- Zähle alle Tupel in einer Tabelle:
SELECT COUNT(*) FROM mitarbeiter; -- 21

SELECT MAX(gehalt) FROM mitarbeiter;
SELECT MIN(gehalt) FROM mitarbeiter;
SELECT SUM(gehalt) FROM mitarbeiter;

-- Wie lautet das Durchschnittsalter aller Mitarbeitenden?
SELECT AVG(DATEDIFF (NOW(), geburtstag) / 365) FROM mitarbeiter WHERE geschlecht = 'M';

--
-- UPDATE, INSERT, DELETE
--
UPDATE mitarbeiter SET nachname = 'Genin' WHERE mid = 10014;
UPDATE abteilung SET name = 'Produktmanagement' WHERE name = 'Produktmanagemend';
INSERT INTO abteilung (aid, name) VALUES (7, 'IT-Management');
DELETE FROM abteilung WHERE name = 'IT-Management';

--
-- CREATE TABLE
--
CREATE TABLE arbeitsmaterial (
    /* char -- fixe Länge
    text, -- bis 65536 Zeichen,
    longtext, -- bis 4 GB,
    binary,
    date,
    time,
    datetime, */

     id 			 int AUTO_INCREMENT,
     beschreibung    varchar (200), -- Computer, Maus, Laptop, ...
     abschreibung    int DEFAULT 3 CHECK (abschreibung > 0 AND abschreibung < 10),  -- Wie viele Jahre?
     inventarnummer  varchar (200) NOT NULL,

     PRIMARY KEY (id)
);
