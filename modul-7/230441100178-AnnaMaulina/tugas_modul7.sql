USE reservasi_hotel;
-- no 1 
-- before insert
DELIMITER //
CREATE TRIGGER before_insert_reservasi
BEFORE INSERT ON reservasi
FOR EACH ROW
BEGIN
  IF NEW.tanggal_checkin > NEW.tanggal_checkout THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Tanggal check-in tidak boleh setelah tanggal check-out';
  END IF;
END//
DELIMITER ;

INSERT INTO reservasi (id_tamu, id_kamar, tanggal_checkin, tanggal_checkout, status_reservasi) VALUES
(1, 3, '2025-04-15', '2025-04-12', 'Confirmed');

-- before update
DELIMITER //
CREATE TRIGGER before_update_kamar_cek_harga
BEFORE UPDATE ON kamar
FOR EACH ROW
BEGIN
    IF NEW.harga_per_malam < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Harga kamar tidak boleh negatif.';
    END IF;
END//
DELIMITER ;

UPDATE kamar SET harga_per_malam = -200000 WHERE id_kamar = 1;
SELECT * FROM kamar;

-- before delete
DELIMITER //
CREATE TRIGGER before_delete_fasilitas
BEFORE DELETE ON fasilitas
FOR EACH ROW
BEGIN
  DECLARE jumlah_relasi INT;

  SELECT COUNT(*) INTO jumlah_relasi
  FROM kamar_fasilitas
  WHERE id_fasilitas = OLD.id_fasilitas;

  IF jumlah_relasi > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Gagal menghapus: Fasilitas masih digunakan oleh kamar.';
  END IF;
END//
DELIMITER ;

SELECT * FROM fasilitas;
SELECT * FROM kamar_fasilitas;
SELECT * FROM kamar;

INSERT INTO fasilitas (nama_fasilitas) VALUES ('Tempat Sampah');
DELETE FROM fasilitas WHERE id_fasilitas = 1;

SELECT f.id_fasilitas, f.nama_fasilitas
FROM fasilitas f
LEFT JOIN kamar_fasilitas kf ON f.id_fasilitas = kf.id_fasilitas
WHERE kf.id_fasilitas IS NULL;

-- no 2
-- after insert
DELIMITER //
CREATE TRIGGER after_insert_reservasi
AFTER INSERT ON reservasi
FOR EACH ROW
BEGIN
    IF NEW.status_reservasi = 'Confirmed' THEN
        UPDATE kamar
        SET status_kamar = 'Booked'
        WHERE id_kamar = NEW.id_kamar;
    END IF;
END//
DELIMITER ;

INSERT INTO reservasi (id_tamu, id_kamar, tanggal_checkin, tanggal_checkout, status_reservasi)
VALUES (11, 6, '2025-05-20', '2025-05-22', 'Confirmed');
SELECT * FROM kamar;

-- after update
DELIMITER //
CREATE TRIGGER after_update_reservasi
AFTER UPDATE ON reservasi
FOR EACH ROW
BEGIN
    IF OLD.status_reservasi = 'Confirmed' AND NEW.status_reservasi = 'Cancelled' THEN
        UPDATE kamar
        SET status_kamar = 'Available'
        WHERE id_kamar = NEW.id_kamar;
    END IF;
END//
DELIMITER ;

UPDATE reservasi SET status_reservasi = 'Cancelled' WHERE id_reservasi = 70;
SELECT * FROM kamar;
SELECT * FROM reservasi;

-- after delete
CREATE TABLE log_aktivitas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aksi VARCHAR(50),
  nama_tabel VARCHAR(50),
  id_data INT,
  deskripsi TEXT,
  waktu_aksi DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_delete_fasilitas
AFTER DELETE ON fasilitas
FOR EACH ROW
BEGIN
  INSERT INTO log_aktivitas (aksi, nama_tabel, id_data, deskripsi)
  VALUES (
    'DELETE',
    'fasilitas',
    OLD.id_fasilitas,
    CONCAT('Fasilitas "', OLD.nama_fasilitas, '" dengan ID ', OLD.id_fasilitas, ' telah dihapus.')
  );
END//
DELIMITER ;

DELETE FROM fasilitas WHERE id_fasilitas = 14;
SELECT * FROM log_aktivitas;
SELECT * FROM fasilitas;
