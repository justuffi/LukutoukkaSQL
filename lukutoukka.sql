CREATE DATABASE lukutoukka;

USE lukutoukka;

CREATE TABLE omistaja (
    omistaja_id INT PRIMARY KEY,
    etunimi VARCHAR(50),
    sukunimiu VARCHAR(50)
);

CREATE TABLE kategoria (
    kategoria_id INT PRIMARY KEY,
    kategorian_nimi VARCHAR(50)
);

CREATE TABLE kirja (
    kirja_id INT PRIMARY KEY,
    nimi VARCHAR(100),
    kirjailija VARCHAR(100),
    ostohinta DECIMAL(6,2),
    ostopaiva DATE,
    kategoria_id INT,
    FOREIGN KEY (kategoria_id) REFERENCES kategoria(kategoria_id)
);

CREATE TABLE laina (
    laina_id INT PRIMARY KEY,
    kirja_id INT,
    omistaja_id INT,
    lainauspaiva DATE,
    palautusaika TIME,
    FOREIGN KEY (kirja_id) REFERENCES kirja(kirja_id),
    FOREIGN KEY (omistaja_id) REFERENCES omistaja(omistaja_id)
);

INSERT INTO omistaja VALUES
(1, 'Jyti', 'Cee'),
(2, 'Mikael', 'Kosola'),
(3, 'Eino', 'Leino'),
(4, 'Donkey', 'Kong'),
(5, 'Kimmo', 'Laiho');

INSERT INTO kategoria VALUES
(1, 'Manga'),
(2, 'Kaunokirjallisuus'),
(3, 'Tietokirja'),
(4, 'Romaani'),
(5, 'Klassikko');

INSERT INTO kirja VALUES
(1, 'One Piece Vol. 1', 'Eiichiro Oda', 24.90, '2024-01-15', 1),
(2, 'Pieni Elämä', 'Hanya Yanagihara', 19.90, '2024-02-10', 4),
(3, 'Äkkilähtöjä Tampereella', 'Ritva Vepsä', 29.90, '2024-03-05', 4),
(4, 'Tympeät tytöt - Aikuistumisriittejä', 'Emmi-Liia Sjöholm', 39.90, '2024-04-20', 3),
(5, 'Danten 7 helvettiä', 'Dante Alighieri', 22.50, '2024-05-12', 1);

INSERT INTO laina VALUES
(1, 2, 2, '2026-01-15', '16:30:00'),
(2, 1, 4, '2026-03-12', '14:15:00'),
(3, 5, 3, '2026-05-08', '18:45:00'),
(4, 4, 5, '2026-07-21', '17:20:00'),
(5, 3, 1, '2026-09-10', '15:00:00');