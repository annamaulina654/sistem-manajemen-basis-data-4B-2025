USE reservasi_hotel;

-- no 1
DELIMITER //
CREATE OR REPLACE PROCEDURE UpdateDataMaster (
    IN p_id INT,
    IN nilai_baru VARCHAR(100),
    OUT status_operasi VARCHAR(100)
)
BEGIN
    DECLARE affected_rows INT;

    UPDATE tamu
    SET nama = nilai_baru
    WHERE id_tamu = p_id;

    SET affected_rows = ROW_COUNT();

    IF affected_rows > 0 THEN
        SET status_operasi = 'Update berhasil';
    ELSE
        SET status_operasi = 'Update gagal';
    END IF;
END //
DELIMITER ;
CALL UpdateDataMaster(1,'Fatimah Azzahra', @status);
SELECT @status AS hasil_update;

-- no 2
DELIMITER //
CREATE PROCEDURE CountTransaksi (
    OUT jumlah_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_transaksi FROM reservasi;
END //
DELIMITER ;
CALL CountTransaksi(@jumlah);
SELECT @jumlah;

-- no 3
DELIMITER //
CREATE PROCEDURE GetDataMasterByID (
    IN p_id INT,
    OUT p_nama VARCHAR(100),
    OUT p_email VARCHAR(100),
    OUT p_no_telepon VARCHAR(20)
)
BEGIN
    SELECT nama, email, no_telepon
    INTO p_nama, p_email, p_no_telepon
    FROM tamu
    WHERE id_tamu = p_id;
END //
DELIMITER ;
CALL GetDataMasterByID(1, @nama, @email, @telepon);
SELECT @nama AS nama, @email AS email, @telepon AS telepon;

-- no 4
DELIMITER //
CREATE PROCEDURE UpdateFieldTransaksi (
    IN in_id INT,
    INOUT p_checkin DATE,
    INOUT p_checkout DATE
)
BEGIN
    DECLARE current_checkin DATE;
    DECLARE current_checkout DATE;

    SELECT tanggal_checkin, tanggal_checkout
    INTO current_checkin, current_checkout
    FROM reservasi
    WHERE id_reservasi = in_id;

    IF p_checkin IS NULL THEN
        SET p_checkin = current_checkin;
    END IF;

    IF p_checkout IS NULL THEN
        SET p_checkout = current_checkout;
    END IF;

    UPDATE reservasi
    SET tanggal_checkin = p_checkin,
        tanggal_checkout = p_checkout
    WHERE id_reservasi = in_id;

    SELECT tanggal_checkin, tanggal_checkout
    INTO p_checkin, p_checkout
    FROM reservasi
    WHERE id_reservasi = in_id;
END //
DELIMITER ;

SET @tanggal_checkin_baru = '2025-06-01';
SET @tanggal_checkout_baru = '2025-06-05';
CALL UpdateFieldTransaksi(2, @tanggal_checkin_baru, @tanggal_checkout_baru);
SELECT * FROM reservasi WHERE id_reservasi = 2;

-- no 5
DELIMITER //
CREATE PROCEDURE DeleteEntriesByIDMaster(
    IN p_id INT
)
BEGIN
    DELETE FROM tamu WHERE id_tamu = p_id;
END //
DELIMITER ;
CALL DeleteEntriesByIDMaster(17);
SELECT * FROM tamu WHERE id_tamu = 17;