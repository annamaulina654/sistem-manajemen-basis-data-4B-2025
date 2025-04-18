CREATE DATABASE akademik_prodi;
USE akademik_prodi;

CREATE TABLE ProgramStudi (
    id_prodi INT PRIMARY KEY AUTO_INCREMENT,
    nama_prodi VARCHAR(100)
);

CREATE TABLE Mahasiswa (
    nim CHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    angkatan YEAR,
    id_prodi INT,
    FOREIGN KEY (id_prodi) REFERENCES ProgramStudi(id_prodi)
);

CREATE TABLE Dosen (
    nip CHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    id_prodi INT,
    FOREIGN KEY (id_prodi) REFERENCES ProgramStudi(id_prodi)
);

CREATE TABLE MataKuliah (
    kode_mk CHAR(6) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT,
    nip CHAR(10),
    FOREIGN KEY (nip) REFERENCES Dosen(nip)
);

CREATE TABLE Semester (
    id_semester INT PRIMARY KEY AUTO_INCREMENT,
    nama_semester VARCHAR(20),
    tahun_ajaran VARCHAR(10)
);

CREATE TABLE KRS (
    id_krs INT PRIMARY KEY AUTO_INCREMENT,
    nim CHAR(10),
    kode_mk CHAR(6),
    id_semester INT,
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk),
    FOREIGN KEY (id_semester) REFERENCES Semester(id_semester)
);


INSERT INTO ProgramStudi (nama_prodi) VALUES
('Informatika'), ('Sistem Informasi'), ('Teknik Komputer');

INSERT INTO Mahasiswa VALUES
('2304411001', 'Aldo Pratama', 2022, 1),
('2304411002', 'Rina Aprilia', 2022, 1),
('2304411003', 'Budi Santoso', 2023, 2),
('2304411004', 'Citra Lestari', 2023, 2),
('2304411005', 'Doni Saputra', 2021, 3),
('2304411006', 'Erni Wulandari', 2021, 1),
('2304411007', 'Fajar Nugroho', 2022, 2),
('2304411008', 'Gina Fitriani', 2020, 3),
('2304411009', 'Hana Ramadhani', 2022, 1),
('2304411010', 'Indra Maulana', 2023, 2);

INSERT INTO Dosen VALUES
('1234567891', 'Dr. Andi Setiawan', 1),
('1234567892', 'Prof. Budi Mulyono', 1),
('1234567893', 'Dr. Citra Dewi', 2),
('1234567894', 'Dra. Dewi Ayu', 2),
('1234567895', 'Dr. Eko Wahyudi', 3),
('1234567896', 'Ir. Farah Ningsih', 1),
('1234567897', 'Dr. Guntur Alam', 2),
('1234567898', 'Dra. Hani Sari', 3),
('1234567899', 'Dr. Indri Wati', 1),
('1234567810', 'Prof. Joko Santoso', 3);

INSERT INTO MataKuliah VALUES
('MK001', 'Basis Data', 3, '1234567891'),
('MK002', 'Pemrograman Dasar', 4, '1234567892'),
('MK003', 'Sistem Operasi', 3, '1234567893'),
('MK004', 'Jaringan Komputer', 3, '1234567894'),
('MK005', 'Pemrograman Web', 3, '1234567895'),
('MK006', 'Matematika Diskrit', 2, '1234567896'),
('MK007', 'Algoritma', 4, '1234567897'),
('MK008', 'Kecerdasan Buatan', 3, '1234567898'),
('MK009', 'Manajemen Proyek', 2, '1234567899'),
('MK010', 'Keamanan Jaringan', 3, '1234567810');

INSERT INTO Semester (nama_semester, tahun_ajaran) VALUES
('Ganjil', '2023/2024'),
('Genap', '2023/2024');

SELECT * FROM Mahasiswa;
SELECT * FROM Dosen;
SELECT * FROM MataKuliah;
SELECT * FROM ProgramStudi;
SELECT * FROM Semester;
SELECT * FROM KRS;

INSERT INTO KRS (nim, kode_mk, id_semester) VALUES
('2304411001', 'MK001', 1),
('2304411002', 'MK002', 1),
('2304411003', 'MK003', 1),
('2304411004', 'MK004', 1),
('2304411005', 'MK005', 2);

ALTER TABLE MataKuliah RENAME TO Mata_Kuliah;
SHOW TABLES;

DROP DATABASE akademik_prodi;
