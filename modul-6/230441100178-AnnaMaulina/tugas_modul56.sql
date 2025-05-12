-- no 1
DELIMITER //
CREATE OR REPLACE PROCEDURE TampilReservasiByLama(
    IN pilihan VARCHAR(10)
)
BEGIN 
    SELECT r.id_reservasi, t.nama AS nama_tamu, k.nomor_kamar, k.tipe_kamar, r.tanggal_checkin, r.tanggal_checkout, r.status_reservasi
    FROM reservasi r
    JOIN tamu t ON r.id_tamu = t.id_tamu
    JOIN kamar k ON r.id_kamar = k.id_kamar
    WHERE
    (pilihan = 'SEMINGGU' AND r.tanggal_checkin >= CURDATE() - INTERVAL 7 DAY)
    OR (pilihan = '1 BULAN' AND r.tanggal_checkin >= CURDATE() - INTERVAL 1 MONTH)
    OR (pilihan = '3 BULAN' AND r.tanggal_checkin >= CURDATE() - INTERVAL 3 MONTH);
END//
DELIMITER ;

CALL TampilReservasiByLama('SEMINGGU');
CALL TampilReservasiByLama('1 BULAN');
CALL TampilReservasiByLama('3 BULAN');

-- no 2
DELIMITER //
CREATE OR REPLACE PROCEDURE HapusReservasiLama()
BEGIN 
    DELETE FROM reservasi
    WHERE tanggal_checkout < CURDATE() - INTERVAL 1 YEAR
    AND status_reservasi = 'Confirmed';
END//
DELIMITER ;

CALL HapusReservasiLama();
SELECT * FROM reservasi;

-- no 3
DELIMITER //
CREATE OR REPLACE PROCEDURE UbahStatusTransaksi()
BEGIN
    UPDATE reservasi
    SET status_reservasi = 'Confirmed'
    WHERE status_reservasi = 'Pending'
    ORDER BY tanggal_checkin DESC
    LIMIT 7;
END//
DELIMITER ;

INSERT INTO reservasi (id_tamu, id_kamar, tanggal_checkin, tanggal_checkout, status_reservasi) VALUES
(1, 6, '2025-05-01', '2025-05-02', 'Pending'),
(2, 7, '2025-05-03', '2025-05-04', 'Pending'),
(3, 8, '2025-05-02', '2025-05-03', 'Pending'),
(4, 9, '2025-05-01', '2025-05-04', 'Pending'),
(5, 10, '2025-05-02', '2025-05-04', 'Pending'),
(6, 11, '2025-05-03', '2025-05-04', 'Pending'),
(7, 12, '2025-05-04', '2025-05-05', 'Pending');
CALL UbahStatusTransaksi();
SELECT * FROM reservasi;

-- no 4
DELIMITER //
CREATE PROCEDURE EditTamuTanpaTransaksi(
    IN p_id_tamu INT,
    IN p_nama VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_no_telepon VARCHAR(20)
)
BEGIN
    UPDATE tamu t
    LEFT JOIN reservasi r ON r.id_tamu = t.id_tamu
    SET t.nama = p_nama,
    t.email = p_email,
    t.no_telepon = p_no_telepon
    WHERE t.id_tamu = p_id_tamu AND r.id_tamu IS NULL;
END//
DELIMITER ;

CALL EditTamuTanpaTransaksi(14, 'Rahmi Maulana', 'rahmi@example.com', '+62-123-456-789');
SELECT * FROM tamu;

-- no 5
ALTER TABLE pembayaran ADD status_transaksi VARCHAR(20);

DELIMITER //
CREATE OR REPLACE PROCEDURE UpdateStatusPembayaran()
BEGIN
    DECLARE min_bayar INT;
    DECLARE max_bayar INT;

    SELECT 
        MIN(total_pembayaran), 
        MAX(total_pembayaran)
    INTO min_bayar, max_bayar
    FROM pembayaran
    WHERE tanggal_bayar >= CURDATE() - INTERVAL 1 MONTH;

    UPDATE pembayaran
    SET status_transaksi = 
        CASE 
            WHEN total_pembayaran = min_bayar THEN 'non-aktif'
            WHEN total_pembayaran = max_bayar THEN 'aktif'
            ELSE 'pasif'
        END
    WHERE tanggal_bayar >= CURDATE() - INTERVAL 1 MONTH;
END//
DELIMITER ;

CALL UpdateStatusPembayaran();
SELECT * FROM pembayaran;

-- no 6
DELIMITER //
CREATE OR REPLACE PROCEDURE HitungReservasiBerhasil()
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE jumlah INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;

    SELECT COUNT(*) INTO jumlah
    FROM reservasi
    WHERE status_reservasi = 'Confirmed'
      AND tanggal_checkin >= CURDATE() - INTERVAL 1 MONTH;

    WHILE i < jumlah DO
        SET total = total + 1;
        SET i = i + 1;
    END WHILE;

    SELECT CONCAT('Jumlah reservasi berhasil 1 bulan terakhir: ', total) AS hasil;
END//
DELIMITER ;

CALL HitungReservasiBerhasil();
