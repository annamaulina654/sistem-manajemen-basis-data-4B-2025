USE umkm_jawa_barat;

-- no 1
DELIMITER //
CREATE PROCEDURE AddUMKM(
    IN p_nama_usaha VARCHAR(100),
    IN p_jumlah_karyawan INT
)
BEGIN
    INSERT INTO umkm(nama_usaha, jumlah_karyawan)
    VALUES (p_nama_usaha, p_jumlah_karyawan);
END //
DELIMITER ;
CALL AddUMKM('Webora Creative', 12);
SELECT * FROM umkm WHERE nama_usaha = 'Webora Creative';

-- no 2
DELIMITER //
CREATE PROCEDURE UpdateKategoriUMKM(
    IN p_id_kategori INT,
    IN p_nama_baru VARCHAR(100)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = p_nama_baru
    WHERE id_kategori = p_id_kategori;
END //
DELIMITER ;
CALL UpdateKategoriUMKM(12, 'Ekonomi Kreatif');
SELECT * FROM kategori_umkm;

-- no 3
DELIMITER //
CREATE PROCEDURE DeletePemilikUMKM(
    IN p_id_pemilik INT
)
BEGIN
    DELETE FROM pemilik_umkm
    WHERE id_pemilik = p_id_pemilik;
END //
DELIMITER ;
CALL DeletePemilikUMKM(17);
SELECT * FROM pemilik_umkm WHERE id_pemilik = 17;

-- no 4
DELIMITER //
CREATE PROCEDURE AddProduk(
    IN p_id_umkm INT,
    IN p_nama_produk VARCHAR(100),
    IN p_harga DECIMAL(10, 2)
)
BEGIN
    INSERT INTO produk_umkm(id_umkm, nama_produk, harga)
    VALUES (p_id_umkm, p_nama_produk, p_harga);
END //
DELIMITER ;
CALL AddProduk(1, 'Keripik Pisang', 15000.00);
SELECT * FROM produk_umkm;

-- no 5
DELIMITER //
CREATE PROCEDURE GetUMKMByID(
    IN p_id_umkm INT,
    OUT p_nama_usaha VARCHAR(100),
    OUT p_jumlah_karyawan INT,
    OUT p_alamat_usaha VARCHAR(255),
    OUT p_tahun_berdiri INT
)
BEGIN
    SELECT nama_usaha, jumlah_karyawan, alamat_usaha, tahun_berdiri
    INTO p_nama_usaha, p_jumlah_karyawan, p_alamat_usaha, p_tahun_berdiri
    FROM umkm
    WHERE id_umkm = p_id_umkm;
END //
DELIMITER ;
CALL GetUMKMByID(7, @nama_usaha, @jumlah_karyawan, @alamat, @tahun_berdiri);
SELECT @nama_usaha, @jumlah_karyawan, @alamat, @tahun_berdiri;