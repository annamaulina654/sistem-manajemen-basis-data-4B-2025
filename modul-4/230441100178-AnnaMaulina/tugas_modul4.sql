-- no 1
ALTER TABLE reservasi ADD keterangan VARCHAR(255);
DESC reservasi;

-- no 2
SELECT t.nama AS nama_tamu, t.email, t.no_telepon, r.tanggal_checkin, r.tanggal_checkout, r.status_reservasi
FROM tamu t
JOIN reservasi r ON t.id_tamu = r.id_tamu;

-- no 3
SELECT * FROM tamu ORDER BY nama ASC;
SELECT * FROM kamar ORDER BY harga_per_malam DESC;

-- no 4
ALTER TABLE pembayaran MODIFY tanggal_bayar DATETIME;
DESC pembayaran;

-- no 5
SELECT t.nama, r.id_reservasi
FROM tamu t
LEFT JOIN reservasi r ON t.id_tamu = r.id_tamu;

SELECT k.nomor_kamar, f.nama_fasilitas
FROM kamar k
RIGHT JOIN kamar_fasilitas kf ON k.id_kamar = kf.id_kamar
RIGHT JOIN fasilitas f ON kf.id_fasilitas = f.id_fasilitas;

SELECT t1.id_tamu AS tamu1, t2.id_tamu AS tamu2, t1.no_telepon
FROM tamu t1
JOIN tamu t2 ON t1.no_telepon = t2.no_telepon AND t1.id_tamu < t2.id_tamu;

-- no 6
SELECT * FROM kamar WHERE harga_per_malam > 500000;
SELECT * FROM kamar WHERE harga_per_malam < 1000000;
SELECT * FROM tamu WHERE email = 'contoh@email.com';
SELECT * FROM kamar WHERE status_kamar != 'Available';
SELECT * FROM reservasi WHERE tanggal_checkout >= '2025-05-01';
                  