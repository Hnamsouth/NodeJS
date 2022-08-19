
/*
CREATE DATABASE AGM3
USE AGM3
*/

CREATE TABLE COMPANY
(
	ID INT CONSTRAINT C_CPN PRIMARY KEY ,
	Name nvarchar(50) not null unique,
	Address nvarchar(255) not null ,
	PhoneNB varchar(20) constraint C_CPN_PHONE CHECK(PhoneNB LIKE '[0-9]%[0-9]') unique
)
CREATE TABLE PRODUCT
(
	ID INT CONSTRAINT C_PRODUCT_ID PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(255) not null unique,
	Content nvarchar(255) not null ,
	Unit nvarchar(55) not null ,
	Price int not null default 0,
	Amount int not null default 1,
	CompanyID INT CONSTRAINT C_PR_CPNID FOREIGN KEY REFERENCES COMPANY(ID)
)

-- INSERT DATA COMPANY
INSERT INTO COMPANY VALUES
(111,'Asus','USA','999999'),
(222,'Dell','USA','868686'),
(333,'Acer','USA','111111'),
(444,'SamSung','USA','222222'),
(555,'Aple','USA','353535'),
(666,'Nokia','USA','666666'),
(777,'HP','USA','696969'),
(888,'SONY','USA','123456')

-- INSERT DATA COMPANY PRODUCT
INSERT INTO PRODUCT(Name,Content,Unit,Price,Amount,CompanyID) VALUES
(N'Máy Tính T450',N'Máy nhập mới ',N'Chiếc','1000',10,),				--1
(N'Điện Thoại Nokia5670',N'Điện thoại đang hot ',N'Chiếc','200',28,),	--2
(N'Máy In Samsung 450',N'Máy in đang ế ',N'Chiếc','100',64,),			--3
(N'Điện Thoại 11O2',N'Máy đập không vỡ',N'Chiếc','500',107,),			--4
(N'Điện Thoại 110I',N'Bảo hành chọn đời ',N'Chiếc','2000',653,)		--5

/*
3. Viết các câu lệnh để thêm dữ liệu vào các bảng
Cho vào hai dữ liệu tưng tự như bảng đề bài trên*/
--4. Viết các câu lênh truy vấn để
--a) Hiển thị tất cả các hãng sản xuất.
--b) Hiển thị tất cả các sản phẩm.

--a) Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên.
--b) Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
--c) Hiển thị thông tin của hãng Asus.
--d) Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
 --liệt kê danh sách sp của hãng asus

-- 6. Viết các câu lệnh truy vấn để lấy
--a) Số hãng sản phẩm mà cửa hàng có.
--b) Số mặt hàng mà cửa hàng bán.
--c) Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
--d) Tổng số đầu sản phẩm của toàn cửa hàng
/*
7. Thay đổi những thay đổi sau trên cơ sở dữ liệu
a) Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
b) Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.
c) Viết các câu lệnh để xác định các khóa ngoại và khóa chính của bảng*/
