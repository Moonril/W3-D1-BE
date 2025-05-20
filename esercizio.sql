/*tutti i clienti mario*/
select *
from clienti
where nome='Mario';
/*tutti i clienti nati nel 1982*/
select nome, cognome
from clienti
where anno_nascita=1982;
/*tutte le fatture con 20 di iva*/
select count(*)
from fatture
where iva=20;
/* prodotti o in commercio o in produzione attivati nel 2017 */
select *
from prodotti
where (in_commercio=true or in_produzione=true) and extract(year from data_attivazione)=2017;
/* fatture inferiori a 1000 + dati dei clienti collegati*/
select *
from fatture f, clienti c /*due tabelle diverse*/
where f.id_cliente = c.numero_cliente and f.importo<1000;
/*elenco delle fatture (numero, importo, iva e data) con in aggiunta il nome del fornitore*/
select numero_fattura, importo, iva, data_fattura, denominazione
from fatture fa, fornitori fo
where fa.numero_fornitore=fo.numero_fornitore;
/* soltanto le fatture con iva al 20 per cento, estrarre il numero di fatture per ogni anno (Per estrarre l’anno da una data si può usare EXTRACT(YEAR FROM data)*/
select extract(year from data_fattura), count(*)
from fatture
where iva=20
group by extract (year from data_fattura);
/*numero di fatture e la somma dei relativi importi divisi per anno di fatturazione*/
select extract(year from data_fattura) as anno, count(*) as numero_fatture, sum(importo) as somma_importo
from fatture
group by extract(year data_fattura);
/*anni in cui sono state registrate piu di due fatture*/
select extract(year from data_fattura) as anno, count(*) as numero_fatture
from fatture
where tipologia='A'
group by extract(year data_fattura)
having count(*)>2;
/* il totale degli importi delle fatture divisi per residenza dei clienti*/
select sum(f.importo) as totale_fatture, regione_residenza
from fratture f, clienti c
where f.id_cliente =c.numero_cliente
group by c.regione_residenza
/* numero dei clienti nati nel 1980 che hanno almeno una fattura superiore a 50 euro*/
