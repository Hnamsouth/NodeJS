﻿-- cấu trúc truy vấn 
USE HowKteam -- chọn database để sử dụng
go


SELECT * FROM BOMON

SELECT MABM AS N'CỘT 1', TENBM AS 'COT 2' FROM BOMON
-- THÊM N'' PHÍA TRƯỚC NỘI DUNG ĐỂ VIET TIẾNG VIỆT 
-- AS THAY THẾ TÊN TRƯỜNG 


SELECT * FROM GIAOVIEN
SELECT * FROM BOMON
-- NẾU TRUY VẤN RIÊNG 2 TABLE THÌ SẼ HIỂN THỊ RA 2 BẢNG
SELECT * FROM GIAOVIEN,BOMON
-- NẾU TRUY VẤN CHUNG 1 LÚC 2 BẢNG. CÁC DỮ LIỆU CỦA 2 BẢNG SẼ ĐC GỘP CHUNG LẠI 1 BẢNG


