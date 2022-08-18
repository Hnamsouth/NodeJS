CREATE DATABASE PRIMARY_FOREIGN
GO
CREATE TABLE BoMon
(
	MaBM char(10) primary key,
	Name NVARCHAR(100) DEFAULT N'Tên bộ môn'
)
create table Lop
(
	MaLop char(10) not null,
	Name NVARCHAR(100) DEFAULT N'TÊN LỚP',
	PRIMARY KEY(MaLop),
)
create table GiaoVien
(
	MaGV char(10) not  null primary key,
	Name nvarchar(100) default N'Tên giáo viên',
	DiaChi nvarchar(100) default N'Địa chỉ giáo viên',
	NgaySinh date,
	Sex bit,
	-- TẠO KHÓA NGOẠI NGAY KHI TẠO BẢNG
	MaBM char(10) foreign key(MaBM) references BoMon(MaBM),
)

-- TẠO  KHOA NGOẠI SAU KHI TẠO BẢNG

create table HocSinh
(
	MaHS char(10) primary key,
	Name Nvarchar(100),
	
)
--DROP TABLE HocSinh,Lop,GiaoVien,BoMon
ALTER TABLE dbo.HocSinh 
ADD  MALOP char(10) FOREIGN KEY (MALOP) references dbo.Lop(MaLop);

INSERT INTO BoMon (MaBM,Name)
VALUES ('MBM1',N'Bộ môn 1')

INSERT INTO BoMon (MaBM,Name)
VALUES ('MBM2',N'Bộ môn 2')

INSERT INTO BoMon (MaBM,Name)
VALUES ('MBM3',N'Bộ môn 3')

-- them du lieu giao vien
INSERT INTO GiaoVien
VALUES('GV01' , -- MaGV - CHAR(10)
		N'GV 1', -- Name - nvarchar(100)
		N'DC 1', -- DiaChi - nvarchar(100)
		GETDATE(),-- NgaySinh date
		1, --Sex bit
		'MBM3' -- MaBM - char(10)
)

INSERT INTO GiaoVien
VALUES('GV02' , -- MaGV - CHAR(10)
		N'GV 1', -- Name - nvarchar(100)
		N'DC 1', -- DiaChi - nvarchar(100)
		GETDATE(),-- NgaySinh date
		1, --Sex bit
		'MBM1' -- MaBM - char(10)
)