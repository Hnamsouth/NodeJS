CREATE DATABASE TRENLOP1
USE TRENLOP1

CREATE TABLE LopHoc
(
	ID INT PRIMARY KEY IDENTITY (1,1),
	Name varchar(255)
)
CREATE TABLE SinhVien
(
	 ID INT PRIMARY KEY IDENTITY (1,1),
	 Name varchar(255),
	 LID INT FOREIGN KEY REFERENCES LopHoc(ID)
)
ALTER TABLE  SinhVien
ALTER COLUMN Name nvarchar(255)

INSERT INTO LopHoc(Name) VALUES 
('T2204M'),('T2206F'),('T22000D'),('T2207N')

INSERT INTO SinhVien(Name,LID) VALUES 
(N'Nguyễn van a',1),
(N'Nguyễn van b',3),
(N'Nguyễn van c',2),
(N'Nguyễn van d',null)
select * from  SinhVien left join LopHoc on SinhVien.LID = LopHoc.ID
select * from  SinhVien right join LopHoc on SinhVien.LID = LopHoc.ID
select * from  SinhVien inner join LopHoc on SinhVien.LID = LopHoc.ID

CREATE VIEW SV_LOP AS
select SinhVien.ID AS MASV,LopHoc.Name AS TENLOP  from  SinhVien left join LopHoc on SinhVien.LID = LopHoc.ID

SELECT * FROM  SV_LOP WHERE MASV=4
