CREATE DATABASE domaci1;

CREATE TABLE cena (
    id_cena       INTEGER NOT NULL,
    id_cenovnika  INTEGER NOT NULL,
    iznos         INTEGER NOT NULL,
    id_popusta    INTEGER
);

ALTER TABLE cena ADD CONSTRAINT cena_pk PRIMARY KEY (id_cena);

CREATE TABLE cenovnik (
    id_cenovnika INTEGER NOT NULL,
    datum_od     DATE NOT NULL,
    datum_do     DATE NOT NULL
);

ALTER TABLE cenovnik ADD CONSTRAINT cenovnik_pk PRIMARY KEY (id_cenovnika);

CREATE TABLE distributivni_centar (
    id_distributivnog_centra INTEGER NOT NULL,
    ime                      VARCHAR(50) NOT NULL,
    id_grad                  INTEGER NOT NULL
);

ALTER TABLE distributivni_centar ADD CONSTRAINT distributivni_centar_pk PRIMARY KEY (id_distributivnog_centra);

CREATE TABLE drzava (
    id_drzave INTEGER NOT NULL,
    naziv     VARCHAR(30) NOT NULL
);

ALTER TABLE drzava ADD CONSTRAINT drzava_pk PRIMARY KEY (id_drzave);

CREATE TABLE grad (
    id_grada  INTEGER NOT NULL,
    naziv     VARCHAR(20),
    id_drzave INTEGER NOT NULL
);

ALTER TABLE grad ADD CONSTRAINT grad_pk PRIMARY KEY (id_grada);

CREATE TABLE isporuka_porudzbine (
    id_isporuke              INTEGER NOT NULL,
    id_porudzbine            INTEGER NOT NULL,
    id_kurirske_sluzbe       INTEGER NOT NULL,
    id_distributivnog_centra INTEGER NOT NULL,
    id_lokacije              INTEGER NOT NULL,
    id_korisnika             INTEGER NOT NULL,
    id_slanja_porudzbine     INTEGER NOT NULL
);

ALTER TABLE isporuka_porudzbine ADD CONSTRAINT isporuka_porudzbine_pk PRIMARY KEY (id_isporuke);

CREATE TABLE kategorija (
    id_kategorije INTEGER NOT NULL,
    naziv         VARCHAR(40) NOT NULL
);

ALTER TABLE kategorija ADD CONSTRAINT kategorija_pk PRIMARY KEY (id_kategorije);

CREATE TABLE korisnik (
    id_korisnika INTEGER NOT NULL,
    mejl         VARCHAR(50) NOT NULL,
    sifra        VARCHAR(20) NOT NULL
);

ALTER TABLE korisnik ADD CONSTRAINT korisnik_pk PRIMARY KEY (id_korisnika);

CREATE TABLE kurirska_sluzba (
    id_kurirske_sluzbe INTEGER NOT NULL,
    naziv              VARCHAR(30) NOT NULL
);

ALTER TABLE kurirska_sluzba ADD CONSTRAINT kurirska_sluzba_pk PRIMARY KEY (id_kurirske_sluzbe);

CREATE TABLE lokacija (
    id_lokacije    INTEGER NOT NULL,
    id_grada       INTEGER NOT NULL,
    grad           VARCHAR(20) NOT NULL,
    postanski_broj INTEGER NOT NULL,
    adresa         VARCHAR(100) NOT NULL
);

ALTER TABLE lokacija ADD CONSTRAINT lokacija_pk PRIMARY KEY (id_lokacije);

CREATE TABLE lokacije_korisnika (
    id_korisnika INTEGER NOT NULL,
    id_lokacije  INTEGER NOT NULL
);

ALTER TABLE lokacije_korisnika ADD CONSTRAINT lokacije_korisnika_pk PRIMARY KEY (id_korisnika, id_lokacije);

CREATE TABLE popust (
    id_popusta INTEGER NOT NULL,
    broj       INTEGER NOT NULL
);

ALTER TABLE popust ADD CONSTRAINT popust_pk PRIMARY KEY (id_popusta);

CREATE TABLE porudzbina (
    id_porudzbine    INTEGER NOT NULL,
    id_korisnika     INTEGER NOT NULL,
    sifra_porudzbine VARCHAR(20) NOT NULL,
    id_lokacije      INTEGER NOT NULL
);

ALTER TABLE porudzbina ADD CONSTRAINT porudzbina_pk PRIMARY KEY (id_porudzbine);

CREATE TABLE potkategorija (
    id_potkategorije INTEGER NOT NULL,
    naziv            VARCHAR(60) NOT NULL,
    id_kategorije    INTEGER NOT NULL
);

ALTER TABLE potkategorija ADD CONSTRAINT potkategorija_pk PRIMARY KEY (id_potkategorije);

CREATE TABLE proizvodi_u_skladistu (
    id_skladista INTEGER NOT NULL,
    id_proizvoda INTEGER NOT NULL
);

ALTER TABLE proizvodi_u_skladistu ADD CONSTRAINT proizvodi_u_skladistu_pk PRIMARY KEY (id_skladista, id_proizvoda);

CREATE TABLE proizvod (
    id_proizvoda     INTEGER NOT NULL,
    naziv            VARCHAR(100) NOT NULL,
    opis             VARCHAR(1000),
    id_potkategorije INTEGER NOT NULL,
    prosecna_ocena   INTEGER,
    id_cena          INTEGER NOT NULL
);

ALTER TABLE proizvod ADD CONSTRAINT proizvod_pk PRIMARY KEY (id_proizvoda);

CREATE TABLE proizvodi_u_porudzbini (
    id_porudzbine INTEGER NOT NULL,
    id_proizvoda  INTEGER NOT NULL
);

ALTER TABLE proizvodi_u_porudzbini ADD CONSTRAINT proizvodi_u_porudzbini_pk PRIMARY KEY (id_porudzbine, id_proizvoda);

CREATE TABLE recenzija (
    id_recenzije INTEGER NOT NULL,
    id_proizvoda INTEGER NOT NULL,
    id_korisnika INTEGER NOT NULL,
    ocena        INTEGER NOT NULL,
    komentar     VARCHAR(200)
);

ALTER TABLE recenzija ADD CONSTRAINT recenzija_pk PRIMARY KEY (id_recenzije);

CREATE TABLE skladiste (
    id_skladista INTEGER NOT NULL,
    naziv        VARCHAR(30),
    adresa       VARCHAR(30),
    id_grada     INTEGER NOT NULL
);

ALTER TABLE skladiste ADD CONSTRAINT skladiste_pk PRIMARY KEY (id_skladista);

CREATE TABLE slanje_porudzbine (
    id_slanja_porudzbine    INTEGER NOT NULL,
    id_porudzbine           INTEGER NOT NULL,
    id_kurirske_sluzbe      INTEGER NOT NULL,
    id_distributivnog_centra INTEGER NOT NULL
);

ALTER TABLE slanje_porudzbine ADD CONSTRAINT slanje_porudzbine_pk PRIMARY KEY (id_slanja_porudzbine, id_porudzbine);

-- Foreign Keys

ALTER TABLE cena ADD CONSTRAINT cena_popust_fk FOREIGN KEY (id_popusta) REFERENCES popust(id_popusta);

ALTER TABLE grad ADD CONSTRAINT grad_drzava_fk FOREIGN KEY (id_drzave) REFERENCES drzava(id_drzave);

ALTER TABLE isporuka_porudzbine ADD CONSTRAINT isporuka_lokacije_fk FOREIGN KEY (id_korisnika, id_lokacije) REFERENCES lokacije_korisnika(id_korisnika, id_lokacije);

ALTER TABLE isporuka_porudzbine ADD CONSTRAINT isporuka_slanje_fk FOREIGN KEY (id_slanja_porudzbine, id_porudzbine) REFERENCES slanje_porudzbine(id_slanja_porudzbine, id_porudzbine);

ALTER TABLE lokacija ADD CONSTRAINT lokacija_grad_fk FOREIGN KEY (id_grada) REFERENCES grad(id_grada);

ALTER TABLE proizvod ADD CONSTRAINT proizvod_cena_fk FOREIGN KEY (id_cena) REFERENCES cena(id_cena);

ALTER TABLE proizvod ADD CONSTRAINT proizvod_potkategorija_fk FOREIGN KEY (id_potkategorije) REFERENCES potkategorija(id_potkategorije);

ALTER TABLE skladiste ADD CONSTRAINT skladiste_grad_fk FOREIGN KEY (id_grada) REFERENCES grad(id_grada);

ALTER TABLE slanje_porudzbine ADD CONSTRAINT slanje_centar_fk FOREIGN KEY (id_distributivnog_centra) REFERENCES distributivni_centar(id_distributivnog_centra);

ALTER TABLE porudzbina ADD CONSTRAINT porudzbina_korisnik_fk FOREIGN KEY (id_korisnika) REFERENCES korisnik(id_korisnika);

ALTER TABLE porudzbina ADD CONSTRAINT porudzbina_lokacija_fk FOREIGN KEY (id_lokacije) REFERENCES lokacija(id_lokacije);

ALTER TABLE lokacije_korisnika ADD CONSTRAINT lokacije_korisnika_korisnik_fk FOREIGN KEY (id_korisnika) REFERENCES korisnik(id_korisnika);

ALTER TABLE lokacije_korisnika ADD CONSTRAINT lokacije_korisnika_lokacija_fk FOREIGN KEY (id_lokacije) REFERENCES lokacija(id_lokacije);

ALTER TABLE proizvodi_u_porudzbini ADD CONSTRAINT proizvodi_porudzbina_fk FOREIGN KEY (id_porudzbine) REFERENCES porudzbina(id_porudzbine);

ALTER TABLE proizvodi_u_porudzbini ADD CONSTRAINT proizvodi_proizvod_fk FOREIGN KEY (id_proizvoda) REFERENCES proizvod(id_proizvoda);

ALTER TABLE proizvodi_u_skladistu ADD CONSTRAINT skladistu_proizvod_fk FOREIGN KEY (id_proizvoda) REFERENCES proizvod(id_proizvoda);

ALTER TABLE proizvodi_u_skladistu ADD CONSTRAINT skladistu_skladiste_fk FOREIGN KEY (id_skladista) REFERENCES skladiste(id_skladista);

ALTER TABLE cena ADD CONSTRAINT cena_cenovnik_fk FOREIGN KEY (id_cenovnika) REFERENCES cenovnik(id_cenovnika);

ALTER TABLE slanje_porudzbine ADD CONSTRAINT slanje_kurirska_fk FOREIGN KEY (id_kurirske_sluzbe) REFERENCES kurirska_sluzba(id_kurirske_sluzbe);

ALTER TABLE distributivni_centar ADD CONSTRAINT centar_grad_fk FOREIGN KEY (id_grad) REFERENCES grad(id_grada);

ALTER TABLE isporuka_porudzbine ADD CONSTRAINT isporuka_centar_fk FOREIGN KEY (id_distributivnog_centra) REFERENCES distributivni_centar(id_distributivnog_centra);





