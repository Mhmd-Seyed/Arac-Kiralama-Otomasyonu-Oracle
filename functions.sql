CREATE OR REPLACE FUNCTION FN_GUN_HESAPLA (p_baslangic DATE, p_bitis DATE) 
RETURN NUMBER IS
BEGIN
    RETURN TRUNC(p_bitis) - TRUNC(p_baslangic);
END;
/


CREATE OR REPLACE FUNCTION FN_MUSAIT_ARACLAR 
RETURN t_arac_tab PIPELINED IS
BEGIN
    FOR r IN (SELECT marka, model, plaka, gunluk_ucret FROM ARACLAR WHERE durum = 'BOS') 
    LOOP
        PIPE ROW(t_arac_row(r.marka, r.model, r.plaka, r.gunluk_ucret));
    END LOOP;
    RETURN;
END;
/