--Transakcije spakovane u procedure 

-- Za kreiranje posiljke
BEGIN;

CREATE OR REPLACE PROCEDURE kreiraj_posiljku(
    p_id_slanja_porudzbine INT,
    p_id_porudzbine INT,
    p_id_kurirske_sluzbe INT,
    p_id_distributivnog_centra INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO slanje_porudzbine (id_slanja_porudzbine, id_porudzbine, id_kurirske_sluzbe, id_distributivnog_centra)
    VALUES (p_id_slanja_porudzbine, p_id_porudzbine, p_id_kurirske_sluzbe, p_id_distributivnog_centra);
END;
$$;

COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
$$;

CALL kreiraj_posiljku(7, 7, 3, 4);
SELECT * FROM slanje_porudzbine;

--Za dodavanje novog korisnika
CREATE OR REPLACE PROCEDURE dodaj_korisnika(
    p_id_korisnika INT,
    p_mejl VARCHAR,
    p_sifra VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO korisnik (id_korisnika, mejl, sifra)
    VALUES (p_id_korisnika, p_mejl, p_sifra);
END;
$$;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
$$;

CALL dodaj_korisnika(7, 'ema@gmail.com', 'emaema');
SELECT * FROM korisnik;

-- Za azuriranje popusta
CREATE OR REPLACE PROCEDURE azuriraj_popust(
    p_id_popusta INT,
    p_broj INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE popust
    SET broj = p_broj
    WHERE id_popusta = p_id_popusta;
END;
$$;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
$$;
CALL azuriraj_popust(2, 30);
SELECT * FROM popust WHERE id_popusta = 2;
