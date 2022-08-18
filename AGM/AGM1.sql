﻿-- CREATE DATABASE Assignment9

USE Assignment9 


CREATE TABLE NHACUNGCAP
(
	MaNhaCC varchar(10) primary key not null,
	TenNhaCC nvarchar(255) not null unique default 'chua ro!!' ,
	DiaChi nvarchar(50) not null default 'chua ro!!' ,
	SoDT varchar(20) unique constraint CHECK_SDT check(SoDT like '05%[0-9]' AND LEN(SoDT)>10) default 0  ,
	MaSoThue int not null unique default 0,
) 

--DROP TABLE DANGKYCUNGCAP
--DROP TABLE NHACUNGCAP

CREATE TABLE LOAIDICHVU
(
	MaLoaiDV varchar(10) primary key not null,
	TenLoaiDV nvarchar(255) not null unique ,
)

CREATE TABLE MUCPHI
(
	MaMP varchar(10) primary key not null,
	DonGia decimal(16,0) not null ,
	MoTa ntext 
)

CREATE TABLE DONGXE
(
	DongXe varchar(50) primary key  not null ,
	HangXe varchar(50) not null  ,
	SoChoNguoi int not null check(SoChoNguoi > 0 and SoChoNguoi < 100)
)

CREATE TABLE DANGKYCUNGCAP 
(
	MaDKCC varchar(10) primary key ,
	MaNhaCC varchar(10) constraint CHECK_MaNhaCC  foreign key ( MaNhaCC) references NHACUNGCAP(MaNhaCC),
	MaLoaiDV varchar(10) constraint CHECK_MaLoaiDV  foreign key ( MaLoaiDV) references LOAIDICHVU(MaLoaiDV),
	DongXe varchar(50) constraint CHECK_DongXe  foreign key (DongXe) references DONGXE(DongXe),
	MaMP varchar(10) constraint CHECK_MaMP  foreign key ( MaMP) references MUCPHI(MaMP),
	NgayBatDauCungCap  date not null default getdate(),
	NgayKetThucCungCap date not null default getdate()+3,
	SoLuongXeDangKy int not null default 1,
)
--drop table DANGKYCUNGCAP,DONGXE,LOAIDICHVU,MUCPHI,NHACUNGCAP
-- INSERT DATA NHACUNGCAP
INSERT INTO NHACUNGCAP
VALUES 
('NCC001',N'Cty TNHH Toàn Pháp',N'Hai Chau','05113999888','568941'),
('NCC002',N'Cty Cổ phần Đông Du ',N'Liên Chiểu','05113999889','456789'),
('NCC003',N'Ong Nguyen Van A',N'Hoa Thuan','05113999890','321456'),
('NCC004',N'Cty Cổ phần Toàn Cầu Xanh',N'Hai Chau','051138589451','513364'),
('NCC005',N'Cty TNHH AVA',N'Thanh Khê','05113875468 ','546546'),
('NCC006',N'Bà Trần Thị Bích Vân',N'Liên Chiểu','05113587469','524545'),
('NCC007',N'Cty TNHH Phan Thành',N'Thanh Khê','05113987456','113021'),
('NCC008',N' Ông Phan Đình Nam',N'Hoa Thuan','05113532456 ','121230'),
('NCC009',N'Tập đoàn Đông Nam Á',N'Liên Chiểu','05113937121','533654'),
('NCC0010',N'Cty Cổ phần Rạng đông',N'Liên Chiểu','05113569654','187864')
--SELECT * FROM NHACUNGCAP

 -- INSERT DATA LOAIDICHVU

 INSERT INTO LOAIDICHVU
VALUES 
('DV01',N'Dịch vụ xe taxi'),
('DV02',N'Dịch vụ xe  bus công cộng theo tuyến cố định'),
('DV03',N'Dịch vụ xe  cho thuê theo hợp đồng')
--SELECT * FROM LOAIDICHVU, MUCPHI

 -- INSERT DATA MUCPHI
INSERT INTO MUCPHI
VALUES 
('MP01','10.000',N'Áp dụng từ ngày 1/2015'),
('MP02','15.000',N'Áp dụng từ ngày 2/2015'),
('MP03','20.000',N'Áp dụng từ ngày 1/2010'),
('MP04','10.000',N'Áp dụng từ ngày 2/2011')

 -- INSERT DATA DONGXE
INSERT INTO DONGXE
VALUES 
('Hiace','Toyota','16'),
('Vios','Toyota','5'),
('Escape','Ford','5'),
('Cerato','Toyota','7'),
('Forte','Toyota','5'),
('Starex','Toyota','7'),
('Grand-i10','Toyota','7')

INSERT INTO DANGKYCUNGCAP
VALUES 
('DK001','NCC001','DV01','Hiace','MP01','2015/11/20','2016/11/20','4'),
('DK002','NCC002','DV02','Vios','MP03','2015/01/12','2017/11/20','1'),
('DK003','NCC003','DV01','Escape','MP01','2015/11/20','2018/11/20','8'),
('DK004','NCC004','DV03','Forte','MP02','2015/11/27','2017/05/30','12'),
('DK005','NCC005','DV02','Starex','MP01','2015/11/20','2016/11/20','5'),
('DK006','NCC006','DV01','Cerato','MP02','2017/10/22','2018/11/20','1'),
('DK007','NCC007','DV01','Vios','MP01','2015/01/12','2016/11/20','4'),
('DK008','NCC008','DV03','Grand-i10','MP01','2015/10/22','2016/11/20','7'),
('DK009','NCC009','DV02','Forte','MP04','2018/03/08','2019/10/12','1'),
('DK0010','NCC0010','DV02','Escape','MP01','2015/10/11','2019/11/20','2')

select * from DANGKYCUNGCAP