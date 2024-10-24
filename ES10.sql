-- 1 Elenco completo dei turisti e il costo totale dei viaggi prenotati
SELECT turista.id_turista, turista.nome, turista.cognome, SUM(viaggio.costo) AS 'costo totale dei viaggi prenotati'
FROM turista
JOIN prenotazione ON (prenotazione.id_turista = turista.id_turista)
JOIN viaggio ON (viaggio.id_viaggio = prenotazione.id_viaggio)
GROUP BY turista.id_turista;

-- 2 Elenco completo dei turisti e la quantità di viaggi effettuati
SELECT turista.*, COUNT(viaggio.id_viaggio) AS 'quantità di viaggi effettuati'
FROM turista
JOIN prenotazione ON (prenotazione.id_turista = turista.id_turista)
JOIN viaggio ON (viaggio.id_viaggio = prenotazione.id_viaggio)
GROUP BY turista.id_turista;

-- 3 Elenco dei singoli viaggi con la quantità di turisti che hanno partecipato
SELECT viaggio.*, COUNT(turista.id_turista) AS 'turisti che hanno partecipato'
FROM turista
JOIN prenotazione ON (prenotazione.id_turista = turista.id_turista)
JOIN viaggio ON (viaggio.id_viaggio = prenotazione.id_viaggio)
GROUP BY viaggio.id_viaggio;

-- 4 Elenco di tutte le località dei viaggi e la quantità totale di prenotazioni associate
SELECT viaggio.localita, COUNT(prenotazione.id_prenotazione) AS 'quantità di prenotazioni associate'
FROM turista
JOIN prenotazione ON (prenotazione.id_turista = turista.id_turista)
JOIN viaggio ON (viaggio.id_viaggio = prenotazione.id_viaggio)
GROUP BY viaggio.localita;
/*
TURISTA (id_Turista, Nome, Cognome, DataNascita, Telefono)
VIAGGIO (id_Viaggio, localita, Durata, Costo, DataPartenza)
PRENOTAZIONE (Id_Prenotazione, id_Turista(FK), id_Viaggio(FK), Data_prenotazione,Tipo_pagamento)
*/