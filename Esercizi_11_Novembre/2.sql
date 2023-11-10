CREATE TABLE velisti(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    esperienza VARCHAR(30),
    dataDiNascita DATE NOT NULL
);

CREATE TABLE barche(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    colore VARCHAR(20)
);

CREATE TABLE prenotazioni(
    velista_id INT,
    barca_id INT,
    data DATE NOT NULL,
    FOREIGN KEY(velista_id) REFERENCES velisti(id),
    FOREIGN KEY(barca_id) REFERENCES barca(id)
);

SELECT DISTINCT velisti.nome
FROM velisti
JOIN prenotazioni ON prenotazioni.velista_id = velisti.id
JOIN barche ON prenotazioni.barca_id = barche.id
WHERE barche.colore = 'Rosso' OR barche.colore = 'Verde';

SELECT DISTINCT barche.nome
FROM barche
JOIN prenotazioni ON prenotazioni.barca_id = barche.id
WHERE prenotazioni.data LIKE '2023-11-%';

SELECT nome
FROM velisti
WHERE esperienza = 'Base' AND (DATE.NOW() - velisti.dataDiNascita < (365 * 18));

SELECT DISTINCT velisti.nome
FROM velisti, prenotazioni
JOIN prenotazioni ON prenotazioni.velista_id = velisti.id
JOIN barche ON prenotazioni.barca_id = barche.id
WHERE barche.colore = 'Giallo' AND prenotazioni.data LIKE '2023-04-%';

SELECT DISTINCT barche.nome
FROM velisti
JOIN prenotazioni ON prenotazioni.velista_id = velisti.id
JOIN barche ON prenotazioni.barca_id = barche.id
WHERE velisti.esperienza = 'Senior';

SELECT velisti.nome
FROM velisti, prenotazioni
JOIN prenotazioni ON prenotazioni.velista_id = velisti.id
JOIN barche ON prenotazioni.barca_id = barche.id
WHERE barche.colore != 'Rosso';
