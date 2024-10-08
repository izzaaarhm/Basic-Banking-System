
INSERT INTO nasabah (
    first_name, 
    last_name, 
    alamat_nasabah
) VALUES
  ('John', 'Doe', '123 Apple St'),
  ('Bob', 'Barker', '456 Banana Ave'),
  ('Charlie', 'Clark', '789 Cherry Blvd');
  ('Alice', 'Anderson', '101 Cedar Lane'),
  ('Jane', 'Doe', '202 Birch Boulevard'),
  ('Alice', 'Smith', '303 Willow Drive'),
  ('Bob', 'Smith', '404 Elm Court'),
  ('Charlie', 'Brown', '505 Aspen Way'),
  ('David', 'Brown', '606 Chestnut Circle'),
  ('Eve', 'Johnson', '707 Sycamore Place'),
  ('Frank', 'Johnson', '808 Maple Street'),
  ('Grace', 'Williams', '909 Oak Avenue'),
  ('Henry', 'Williams', '113Pine Road');

--untuk melihat 5 nasabah yang pertama mendaftar
SELECT *
FROM nasabah ORDER BY id_nasabah ASC
LIMIT 5;

--untuk melihat jumlah nasabah
SELECT COUNT(*) FROM nasabah;

--untuk melihat nama lengkap nasabah dalam 1 kolom
SELECT
    id_nasabah,
    nasabah.first_name || ' ' || nasabah.last_name AS nama_nasabah,
    alamat_nasabah
FROM nasabah;

--update untuk mengganti alamat seorang nasabah
UPDATE nasabah
SET alamat_nasabah = '202 Birch Boulevard'
WHERE first_name = 'John';




