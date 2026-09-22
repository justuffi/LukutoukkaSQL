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
(1, 'Kimi', 'Raikkonen'),
(2, 'Sauli', 'Niinisto'),
(3, 'Mika', 'Hakkinen'),
(4, 'Sanna', 'Marin'),
(5, 'Teemu', 'Selanne');

INSERT INTO kategoria VALUES
(1, 'Fantasia'),
(2, 'Scifi'),
(3, 'Tietokirja'),
(4, 'Romaani'),
(5, 'Kauhu');

INSERT INTO kirja VALUES
(1, 'Harry Potter ja viisasten kivi', 'J.K. Rowling', 24.90, '2024-01-15', 1),
(2, 'Hobitti', 'J.R.R. Tolkien', 19.90, '2024-02-10', 1),
(3, 'Dune', 'Frank Herbert', 29.90, '2024-03-05', 2),
(4, 'Clean Code', 'Robert C. Martin', 39.90, '2024-04-20', 3),
(5, 'Sinuhe Egyptilainen', 'Mika Waltari', 22.50, '2024-05-12', 4);

INSERT INTO laina VALUES
(1, 2, 2, '2025-01-18', '17:00:00'),
(2, 1, 4, '2025-03-08', '15:30:00'),
(3, 5, 1, '2025-05-27', '19:45:00'),
(4, 3, 3, '2025-07-14', '13:20:00'),
(5, 4, 5, '2025-09-02', '18:10:00');
