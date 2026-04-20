CREATE OR REPLACE PROCEDURE SP_ARAC_KIRALA (
    p_musteri_id IN NUMBER,
    p_arac_id IN NUMBER,
    p_gun_sayisi IN NUMBER
) IS
    v_durum VARCHAR2(20);
    e_arac_dolu EXCEPTION;
    -- Kendi Hata Tanımımız
    PRAGMA EXCEPTION_INIT(e_arac_dolu, -20001);
BEGIN
    -- Aracın durumunu kontrol et
    SELECT durum INTO v_durum FROM ARACLAR WHERE arac_id = p_arac_id;

    -- Araç boş değilse hata fırlat
    IF v_durum != 'BOS' THEN
        RAISE_APPLICATION_ERROR(-20001, 'HATA: Bu araç şu an kiralanamaz! (Kirada veya Bakımda)');
    END IF;

    -- Kiralama işlemini yap
    INSERT INTO KIRALAMALAR (musteri_id, arac_id, alis_tarihi, teslim_tarihi)
    VALUES (p_musteri_id, p_arac_id, SYSDATE, SYSDATE + p_gun_sayisi);

    -- Aracın durumunu güncelle
    UPDATE ARACLAR SET durum = 'KIRADA' WHERE arac_id = p_arac_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('İşlem Başarılı: Araç kiralandı.');

EXCEPTION
    WHEN e_arac_dolu THEN
        DBMS_OUTPUT.PUT_LINE('UYARI: İşlem durduruldu -> ' || SQLERRM);
END;
/


CREATE OR REPLACE PROCEDURE SP_YILLIK_KAZANC_RAPORU IS
    CURSOR c_kiralamalar IS
        SELECT k.toplam_ucret, m.ad_soyad
        FROM KIRALAMALAR k
        JOIN MUSTERILER m ON k.musteri_id = m.musteri_id
        WHERE k.toplam_ucret IS NOT NULL;
        
    v_ucret NUMBER;
    v_isim VARCHAR2(100);
    v_toplam_ciro NUMBER := 0;
BEGIN
    OPEN c_kiralamalar;
    LOOP
        FETCH c_kiralamalar INTO v_ucret, v_isim;
        EXIT WHEN c_kiralamalar%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Müşteri: ' || v_isim || ' | Ödeme: ' || v_ucret || ' TL');
        v_toplam_ciro := v_toplam_ciro + v_ucret;
    END LOOP;
    CLOSE c_kiralamalar;
    
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    DBMS_OUTPUT.PUT_LINE('GENEL TOPLAM CİRO: ' || v_toplam_ciro || ' TL');
END;
/

