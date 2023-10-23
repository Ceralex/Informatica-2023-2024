SELECT clienti.id, clienti.nome, clienti.cognome
FROM clienti
WHERE ordini.id_cliente = clienti.id

SELECT cliente.id, clienti.nome, clienti.cognome, ordini.data
FROM ordini, clienti
WHERE ordini.id_cliente = clienti.id 
  AND ordini.data = ''

SELECT cliente.id, clienti.nome, clienti.cognome, ordini.data, ordini_pizza.nome
FROM ordini, clienti, ordini_pizze
WHERE ordini.id_cliente = clienti.id
  AND ordini.data = '' 
  AND ordini.id = ordini_pizze.id_ordine 
  AND ordini_pizze.nome = ''

SELECT cliente.id, clienti.nome, clienti.cognome, ordini.data, ordini_pizza.nome
FROM ordini, clienti, ordini_pizze
WHERE ordini.id_cliente = clienti.id
  AND ordini.data = ''
  AND ordini.id = ordini_pizze.id_ordine
  AND ordini_pizze.nome_pizza = ''
  AND ordini.tipo_pagamento = 'carta di credito'

SELECT cliente.id, clienti.nome, clienti.cognome, ordini.data, ordini_pizza.nome, pizze_ingredienti.nome_ingredienti
FROM ordini, clienti, ordini_pizze, pizze_ingredienti
WHERE ordini.id_cliente = clienti.id
  AND ordini.data = ''
  AND ordini.id = ordini_pizze.id_ordine
  AND ordini_pizze.nome_pizza = ''
  AND ordini.tipo_pagamento = 'carta di credito'
  AND pizze_ingredienti.nome = ordini_pizze.nome_pizza
  AND pizze_ingredienti.nome_ingredienti = ''

SELECT cliente.id, clienti.nome, clienti.cognome, COUNT(ordini.id_cliente) AS numero_ordini
FROM clienti LEFT JOIN ordini 
  ON clienti.id = ordini.id_cliente
GROUP BY clienti.nome, clienti.cognome
ORDER BY numero_ordini DESC
LIMIT 1;

SELECT cliente.id, clienti.nome, clienti.cognome, COUNT(ordini.id_cliente) AS numero_ordini
FROM clienti LEFT JOIN ordini 
  ON clienti.id = ordini.cliente_id 
WHERE ordini.data = ''
GROUP BY clienti.nome, clienti.cognome
ORDER BY numero_ordini DESC
LIMIT 1;

SELECT cliente.id, clienti.nome, clienti.cognome, COUNT(ordini.id_cliente) AS numero_ordini
FROM clienti LEFT JOIN ordini
  ON clienti.id = ordini.cliente_id 
WHERE ordini.data = ''
  AND ordini.id = ordini_pizze.id_ordine
  AND ordini_pizze.nome_pizza = ''
GROUP BY clienti.nome, clienti.cognome
ORDER BY numero_ordini DESC
LIMIT 1;

SELECT pizze.nome, COUNT(ordini_pizze.nome_pizza) AS numero_ordini
FROM pizze LEFT JOIN ordini
  ON pizze.nome = ordini_pizze.nome_pizza
GROUP BY pizze.nome

SELECT pizze.nome, COUNT(ordini_pizze.nome_pizza) AS numero_ordini
FROM pizze LEFT JOIN ordini
  ON pizze.id = ordini_pizze.nome_pizza
WHERE ordini_pizze.id_ordine = ordine.id
  AND ordine.data = ''
GROUP BY pizze.nome

SELECT cliente.id, cliente.nome, cliente.cognome, SUM(quantita * ordini_pizze.prezzo) as spesa_totale
FROM cliente
WHERE ordini.id_cliente = cliente.id
  AND ordini.id = ordini_pizze.id_ordine
GROUP BY cliente.id, cliente.nome, cliente.cognome

SELECT cliente.id, cliente.nome, cliente.cognome, ordini_pizze.nome_pizza
FROM cliente, ordini_pizze
WHERE ordini.id_cliente = cliente.id
  AND ordini.id = ordini_pizze.id_ordine
ORDER BY ordini_pizze.prezzo DESC
LIMIT 1;

SELECT cliente.id, cliente.nome, cliente.cognome, pizze.nome, numero_pizze
FROM cliente, pizze
WHERE ordini.id_cliente = cliente.id
  AND ordini.id = ordini_pizze.id_ordine
  AND ordini_pizze.nome = pizze.nome
SUM(ordini_pizze.quantita * ordini_pizze.nome) as numero_pizze
ORDER BY numero_pizze DESC
LIMIT 1;


