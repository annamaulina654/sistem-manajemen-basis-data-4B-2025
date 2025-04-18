CREATE DATABASE reservasi_hotel;
USE reservasi_hotel;

CREATE TABLE tamu (
    id_tamu INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(20)
);

CREATE TABLE kamar (
    id_kamar INT PRIMARY KEY AUTO_INCREMENT,
    nomor_kamar VARCHAR(10) UNIQUE NOT NULL,
    tipe_kamar VARCHAR(50) NOT NULL,
    harga_per_malam DECIMAL(12, 2) NOT NULL,
    status_kamar ENUM('Available', 'Booked') DEFAULT 'Available'
);

CREATE TABLE fasilitas (
    id_fasilitas INT PRIMARY KEY AUTO_INCREMENT,
    nama_fasilitas VARCHAR(100) NOT NULL
);

CREATE TABLE kamar_fasilitas (
    id_kamar INT,
    id_fasilitas INT,
    PRIMARY KEY (id_kamar, id_fasilitas),
    FOREIGN KEY (id_kamar) REFERENCES kamar(id_kamar)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_fasilitas) REFERENCES fasilitas(id_fasilitas)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reservasi (
    id_reservasi INT PRIMARY KEY AUTO_INCREMENT,
    id_tamu INT,
    id_kamar INT,
    tanggal_checkin DATE NOT NULL,
    tanggal_checkout DATE NOT NULL,
    status_reservasi ENUM('Pending', 'Confirmed', 'Cancelled') NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (id_tamu) REFERENCES tamu(id_tamu)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_kamar) REFERENCES kamar(id_kamar)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE pembayaran (
    id_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    id_reservasi INT,
    tanggal_bayar DATE NOT NULL,
    total_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_reservasi) REFERENCES reservasi(id_reservasi)
    ON DELETE CASCADE ON UPDATE CASCADE
);

SHOW TABLES;
