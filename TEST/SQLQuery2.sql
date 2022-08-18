USE Custemers
GO
create table Custemers(
	ID int primary key not null ,
	Name nvarchar(50) not null ,
	Address nvarchar(255) not null ,
)

create table Numbers(
	phoneNB varchar(100) not null primary key 
	constraint Check_phoneNB check(phoneNB like '[0-9]%[0-9]' and (LEN(phoneNB))<11),  -- NOT LIKE '%[^0-9]%' -- LIKE '09%[0-9]'
	-- check() hàm kiểm tra 
	-- LEN() hàm tính độ dài chuỗi 
	-- not like '%[^0-9]%' // '%[^0-9]%' là đối tượng có giá trị ko nằm trong phạm vi từ 1 -9 
	-- dùng thêm not like để phủ định điều trên tức là đối tượng có giá trị nằm trong phạm vi từ 1 -9
	typenumber nvarchar(30) not null ,
	Registration Date not null,
	CTMID int CONSTRAINT Check_CTMID foreign key (CTMID) references Custemers(ID) 
)

--drop table Custemers
--drop table Numbers

-- insert data number custemers
SELECT * FROM Custemersinsert into Custemersvalues('123456789' , N'Nguyễn Nguyệt A', N'Hà Nội'),('987654321' , N'Nguyễn Nguyệt A', N'Hà Nội'),('123459876' , N'Nguyễn Nguyệt C', N'Hai phong'),('456848684' , N'Nguyễn Nguyệt D', N'DA NANG'),('654165184' , N'Nguyễn Nguyệt E', N'NHA TRANG')

-- insert data number
select * from Numbers
insert into Numbers 
values 
('096765624','tra truoc','2020/12/12','123456789'),
('0984561233','tra sau','2022/03/17','123456789'),
('0974532516','tra truoc','2020/02/28','987654321'),
('0123456789','tra truoc','2021/12/12','123456789'),
('0123456798','tra sau','2020/12/12','123459876'),
('0123456987','tra sau','2019/12/12','456848684'),
('0111111111','tra sau','2020/12/12','654165184')

/*UPDATE CustemersSET NumberID = ('0123456789')WHERE ID='123456789'*/--Hiển thị toàn bộ thông tin của thuê bao có số: 0123456789SELECT * FROM NumbersWHERE phoneNB='0123456789'--Hiển thị thông tin về khách hàng có số CMTND: 123456789SELECT * FROM CustemersWHERE ID='123456789'--Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
SELECT phoneNB FROM Numbers
 WHERE CTMID='123456789'
-- Liệt kê các thuê bao đăng ký vào ngày 12/12/09
SELECT phoneNB FROM Numbers
WHERE Registration='2020/12/12'
--Liệt kê các thuê bao có địa chỉ tại Hà Nội-- --Tổng số khách hàng của công ty.
 SELECT COUNT (ID) FROM Custemers
 --Tổng số thuê bao của công ty.
  SELECT COUNT (phoneNB) FROM Numbers
 --Tổng số thuê bào đăng ký ngày 12/12/09.
  SELECT COUNT (phoneNB) as nB FROM Numbers WHERE Registration='2020/12/12'
 --Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao SELECT * FROM  Numbers AS NB  JOIN Custemers AS CTM ON NB.CTMID=CTM.ID-- Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
	ALTER TABLE Numbers
	ALTER COLUMN Registration DATE not null;
-- Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại.
	
	ALTER TABLE Numbers
	ALTER COLUMN  Registration CONSTRAINT check_DATE_rgt default getdate() ;

-- Viết câu lệnh để thay đổi số điện tho	ại phải bắt đầu 09
	ALTER TABLE Numbers
	--DROP CONSTRAINT Check_phoneNB
	ADD constraint Check_phoneNB check(phoneNB not like '^09%[^0-9]' and (LEN(phoneNB))<11)
	--ADD phoneNB varchar(100) check(phoneNB not like '09%[^0-9]' and (LEN(phoneNB))<11)
	 
-- Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.	ALTER TABLE Numbers
	ADD RewardPoints int ;		-- 	DELETE FROM Numbers WHERE phoneNB='...'	