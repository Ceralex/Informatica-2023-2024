CREATE TABLE riviste (
    codice  INT PRIMARY KEY AUTO_INCREMENT,
    nome    VARCHAR(50) NOT NULL,
    editore VARCHAR(100) NOT NULL
);

CREATE TABLE articoli (
    codice      INT PRIMARY KEY AUTO_INCREMENT,
    titolo      VARCHAR(50) NOT NULL,
    argomento   VARCHAR(50) NOT NULL,
    codR        INT,
    FOREIGN KEY (codR) REFERENCES riviste(codice)
);

SELECT riviste.codice, riviste.nome FROM riviste, articoli
WHERE riviste.codice = articoli.codR AND articoli.argomento = 'motociclismo';

SELECT articoli.* FROM riviste, articoli
WHERE riviste.codice = articoli.codR AND riviste.nome = 'Focus' AND articoli.argomento = 'Intelligenza Artificiale';

SELECT riviste.nome FROM riviste WHERE riviste.editore = 'Einaudi' AND riviste.nome LIKE 'G%'

SELECT riviste.editore FROM riviste, articoli WHERE riviste.codice = articoli.codR AND
articoli.argomento = 'A'

SELECT riviste.nome FROM riviste, articoli WHERE riviste.codice = articoli.codR AND
(articoli.argomento = 'Motociclismo' OR articoli.argomento = 'Automobilismo')