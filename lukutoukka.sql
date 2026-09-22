CREATE TABLE omistaja (
    omistaja_id INT PRIMARY KEY,
    etunimi VARCHAR(50),
    sukunim VARCHAR(50)
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