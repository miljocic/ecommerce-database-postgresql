EXPLAIN SELECT * FROM porudzbina WHERE id_korisnika = 1;

-- Dodavanje indeksa na kolonu id_korisnika u tabeli porudzbina
CREATE INDEX idx_porudzbina_korisnik ON porudzbina(id_korisnika);

-- Dodavanje indeksa na kolonu id_korisnika u tabeli lokacije_korisnika
CREATE INDEX idx_lokacije_korisnika_korisnik ON lokacije_korisnika(id_korisnika);

-- Dodavanje indeksa na kolonu id_porudzbine u tabeli isporuka_porudzbine
CREATE INDEX idx_isporuka_porudzbine_porudzbina ON isporuka_porudzbine(id_porudzbine);

-- Dodavanje indeksa na kolonu id_proizvoda u tabeli proizvodi_u_porudzbini
CREATE INDEX idx_proizvodi_porudzbina_proizvod ON proizvodi_u_porudzbini(id_proizvoda);

-- Dodavanje indeksa na kolonu id_grada u tabeli grad
CREATE INDEX idx_grad_grada ON grad(id_grada);

EXPLAIN SELECT * FROM porudzbina WHERE id_korisnika = 1;


