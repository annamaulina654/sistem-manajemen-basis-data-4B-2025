INSERT INTO tamu (nama, email, no_telepon) VALUES
('Rahmi Maulana', 'respatihutagalung@gmail.com', '+62-0211-624-4051'),
('dr. Vera Maryati', 'widodoviktor@pt.biz.id', '+62 (030) 427-4506'),
('Hilda Dabukke, S.Farm', 'anom85@cv.my.id', '+62 (0056) 201-8366'),
('Cahyo Hassanah', 'winarnoelisa@cv.co.id', '(0311) 193-0672'),
('Zahra Prasetyo, S.Pt', 'kambali86@pt.ponpes.id', '+62 (0910) 122-9387'),
('Kacung Salahudin', 'nashiruddindartono@gmail.com', '+62-0981-746-0689'),
('Cakrajiya Tamba', 'qsafitri@ud.mil', '(078) 426-9818'),
('Rahmi Zulaika', 'yyulianti@cv.web.id', '+62 (78) 219-9932'),
('Suci Iswahyudi, S.I.Kom', 'laksitabakijan@yahoo.com', '+62 (0501) 002 2320'),
('Jasmin Wastuti', 'nlazuardi@gmail.com', '084 676 9471'),
('Farah Prasetyo', 'qrajata@perum.net', '+62 (0777) 475 8046'),
('Purwadi Sinaga', 'laras53@hotmail.com', '+62 (0414) 895 2499'),
('R.M. Darmanto Mahendra, S.E.I', 'zmaryadi@perum.ponpes.id', '+62 (039) 797-2240'),
('Jinawi Lazuardi', 'anggabaya28@cv.net.id', '+62 (046) 911 8292'),
('Dr. Mala Permata, M.Farm', 'anihutagalung@yahoo.com', '+62 (191) 571 1555');

INSERT INTO kamar (nomor_kamar, tipe_kamar, harga_per_malam, status_kamar) VALUES
('100', 'Standard', 250000, 'Booked'),
('101', 'Standard', 275000, 'Booked'),
('102', 'Suite', 750000, 'Booked'),
('103', 'Deluxe', 500000, 'Booked'),
('104', 'Suite', 800000, 'Booked'),
('105', 'Suite', 850000, 'Available'),
('106', 'Standard', 300000, 'Available'),
('107', 'Deluxe', 600000, 'Available'),
('108', 'Standard', 280000, 'Available'),
('109', 'Suite', 900000, 'Available'),
('110', 'Deluxe', 650000, 'Available'),
('111', 'Standard', 320000, 'Booked'),
('112', 'Suite', 950000, 'Booked'),
('113', 'Standard', 295000, 'Booked'),
('114', 'Suite', 990000, 'Booked');

INSERT INTO fasilitas (nama_fasilitas) VALUES
('AC'),
('Wi-Fi'),
('TV'),
('Kamar Mandi Dalam'),
('Shower Air Panas'),
('Meja & Kursi'),
('Lemari Pakaian'),
('Mini Bar'),
('Brankas'),
('Hair Dryer'),
('Balkon'),
('Tirai Anti Cahaya'),
('Telepon Dalam Kamar'),
('Kulkas Mini'),
('Alat Pembuat Kopi/Teh');

INSERT INTO kamar_fasilitas (id_kamar, id_fasilitas) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 6), (1, 7),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 6), (2, 7),
(7, 1), (7, 2), (7, 3), (7, 4), (7, 6), (7, 7),
(9, 1), (9, 2), (9, 3), (9, 4), (9, 6), (9, 7),
(12, 1), (12, 2), (12, 3), (12, 4), (12, 6), (12, 7),
(14, 1), (14, 2), (14, 3), (14, 4), (14, 6), (14, 7),
(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 9),
(8, 1), (8, 2), (8, 3), (8, 4), (8, 5), (8, 6), (8, 7), (8, 9),
(11, 1), (11, 2), (11, 3), (11, 4), (11, 5), (11, 6), (11, 7), (11, 9),
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10), (3, 11), (3, 12), (3, 13),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10), (5, 11), (5, 12), (5, 13),
(6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 8), (6, 9), (6, 10), (6, 11), (6, 12), (6, 13),
(10,1), (10,2), (10,3), (10,4), (10,5), (10,6), (10,7), (10,8), (10,9), (10,10), (10,11), (10,12), (10,13),
(13,1), (13,2), (13,3), (13,4), (13,5), (13,6), (13,7), (13,8), (13,9), (13,10), (13,11), (13,12), (13,13);

INSERT INTO reservasi (id_tamu, id_kamar, tanggal_checkin, tanggal_checkout, status_reservasi) VALUES
(1, 3, '2025-04-10', '2025-04-12', 'Confirmed'),
(2, 5, '2025-04-15', '2025-04-17', 'Pending'),
(3, 1, '2025-04-01', '2025-04-02', 'Cancelled'),
(4, 2, '2025-04-18', '2025-04-20', 'Confirmed'),
(5, 4, '2025-04-12', '2025-04-14', 'Confirmed'),
(6, 6, '2025-04-22', '2025-04-23', 'Pending'),
(7, 7, '2025-04-25', '2025-04-26', 'Confirmed'),
(8, 9, '2025-04-27', '2025-04-29', 'Confirmed'),
(9, 8, '2025-04-30', '2025-05-02', 'Cancelled'),
(10, 10, '2025-04-13', '2025-04-14', 'Confirmed'),
(11, 12, '2025-04-20', '2025-04-22', 'Pending'),
(12, 11, '2025-04-15', '2025-04-17', 'Confirmed'),
(13, 14, '2025-04-18', '2025-04-19', 'Confirmed'),
(14, 13, '2025-04-19', '2025-04-20', 'Confirmed'),
(15, 15, '2025-04-21', '2025-04-23', 'Pending'); 

-- Tambahan 5 data reservasi
INSERT INTO reservasi (id_tamu, id_kamar, tanggal_checkin, tanggal_checkout, status_reservasi) VALUES
(1, 3, '2025-04-13', '2025-04-14', 'Confirmed'),     -- kamar 3: sebelumnya 10-12 April, ini sesudahnya
(2, 5, '2025-04-18', '2025-04-19', 'Confirmed'),     -- kamar 5: sebelumnya 15-17 April
(3, 1, '2025-04-03', '2025-04-04', 'Pending'),       -- kamar 1: sebelumnya 1-2 April
(4, 2, '2025-04-22', '2025-04-23', 'Confirmed'),     -- kamar 2: sebelumnya 18-20 April
(5, 4, '2025-04-16', '2025-04-17', 'Confirmed');     -- kamar 4: sebelumnya 12-14 April


INSERT INTO pembayaran (id_reservasi, tanggal_bayar, total_pembayaran, metode_pembayaran) VALUES
(1, '2025-04-10', 800000.00, 'Transfer Bank'),
(4, '2025-04-18', 1200000.00, 'Kartu Kredit'),
(5, '2025-04-12', 1000000.00, 'QRIS'),
(7, '2025-04-25', 750000.00, 'Cash'),
(8, '2025-04-27', 2000000.00, 'Transfer Bank'),
(10, '2025-04-13', 600000.00, 'QRIS'),
(12, '2025-04-15', 1300000.00, 'Transfer Bank'),
(13, '2025-04-18', 500000.00, 'Cash'),
(14, '2025-04-19', 750000.00, 'Kartu Kredit'),
(15, '2025-04-21', 1600000.00, 'Transfer Bank');

SELECT * FROM tamu;
SELECT * FROM kamar;
SELECT * FROM fasilitas;
SELECT * FROM kamar_fasilitas;
SELECT * FROM reservasi;
SELECT * FROM pembayaran;

SHOW TABLES;

-- no 1
CREATE VIEW view_detail_reservasi AS
SELECT r.id_reservasi, t.nama AS nama_tamu, k.nomor_kamar, k.tipe_kamar, r.tanggal_checkin, r.tanggal_checkout, r.status_reservasi
FROM reservasi r
JOIN tamu t ON r.id_tamu = t.id_tamu
JOIN kamar k ON r.id_kamar = k.id_kamar;

SELECT * FROM view_detail_reservasi;

-- no 2
CREATE VIEW view_transaksi_reservasi AS
SELECT t.nama AS nama_tamu, k.nomor_kamar, k.tipe_kamar, r.tanggal_checkin, r.tanggal_checkout, p.tanggal_bayar,
p.total_pembayaran, p.metode_pembayaran
FROM reservasi r
JOIN tamu t ON r.id_tamu = t.id_tamu
JOIN kamar k ON r.id_kamar = k.id_kamar
JOIN pembayaran p ON r.id_reservasi = p.id_reservasi;

SELECT * FROM view_transaksi_reservasi;

DROP VIEW view_transaksi_reservasi;


SHOW TABLES;
-- nooo
CREATE VIEW view_tamu_dan_reservasi AS
SELECT t.nama AS nama_tamu, t.email, t.no_telepon, r.tanggal_checkin, r.tanggal_checkout, r.status_reservasi
FROM tamu t
JOIN reservasi r ON t.id_tamu = r.id_tamu;

SELECT * FROM view_tamu_dan_reservasi;

CREATE VIEW view_kamar_dan_fasilitas AS
SELECT k.nomor_kamar, k.tipe_kamar, k.harga_per_malam,GROUP_CONCAT(f.nama_fasilitas SEPARATOR ', ') AS fasilitas
FROM kamar k
LEFT JOIN kamar_fasilitas kf ON k.id_kamar = kf.id_kamar
LEFT JOIN fasilitas f ON kf.id_fasilitas = f.id_fasilitas
GROUP BY k.id_kamar;

SELECT * FROM view_kamar_dan_fasilitas;

CREATE VIEW view_kamar_tersedia AS
SELECT k.nomor_kamar, k.tipe_kamar, k.harga_per_malam, GROUP_CONCAT(f.nama_fasilitas SEPARATOR ', ') AS fasilitas
FROM kamar k
JOIN kamar_fasilitas kf ON k.id_kamar = kf.id_kamar
JOIN fasilitas f ON kf.id_fasilitas = f.id_fasilitas
WHERE k.status_kamar = 'Available'
GROUP BY k.nomor_kamar, k.tipe_kamar, k.harga_per_malam;

CREATE VIEW view_kamar_tersedia AS
SELECT 
    k.nomor_kamar,
    k.tipe_kamar,
    COUNT(kf.id_fasilitas) AS jumlah_fasilitas
FROM kamar k
LEFT JOIN kamar_fasilitas kf ON k.id_kamar = kf.id_kamar
WHERE k.status_kamar = 'Available'
GROUP BY k.id_kamar;

DROP VIEW view_kamar_tersedia;
SELECT * FROM view_kamar_tersedia;


CREATE VIEW view_jumlah_pemesanan_per_tipe_kamar AS
SELECT 
    k.tipe_kamar,
    COUNT(r.id_reservasi) AS jumlah_dipesan
FROM kamar k
JOIN reservasi r ON k.id_kamar = r.id_kamar
GROUP BY k.tipe_kamar;

SELECT * FROM view_jumlah_pemesanan_per_tipe_kamar;


DROP VIEW view_pendapatan_per_tipe_kamar;

SHOW TABLES;

