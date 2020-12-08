create database Seminarski;

use seminarski;

drop table if exists poslovnice;

create table poslovnice (
	id_poslovnice int auto_increment primary key,
    ime_poslovnice varchar(50) not null,
    glavna_poslovnica boolean default false,
    broj_zaposlenih int,
    broj_menadera int,
    grad_poslovnice varchar(50) not null,
    drzava_poslovnice varchar(50) not null,
    obrt_poslovnice int,
    profit_poslovnice int,
    broj_prodanih_automobila int,
    Zadovoljena_kvota boolean, 
    broj_prodanih_automobila_za_kes int,
    broj_prodanih_automobila_na_rate int,
    broj_automobila_na_lageru int,
    broj_faktura int,
    broj_narudbi int
);

describe poslovnice;

select * from poslovnice;



insert into poslovnice 
	values ('1', 'Sarajevska',TRUE, 10, 3,"Sarajevo", 'Bih', 150000, 30000, 20, TRUE, 15, 5,10, 20, 25);
		   

