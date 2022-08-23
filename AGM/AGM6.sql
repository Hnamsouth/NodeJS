﻿create database Assignment_06
	Id int primary key  identity(1,1), 
	Name nvarchar(255) not null unique
)

create table AuthorsAGM6(
	Id int primary key identity(1,1),
	Name nvarchar(225) not null, 
)

create table PublishionsAGM6 (
	Id int primary key identity(1,1),
	Name nvarchar(225) not null unique, 
	Address nvarchar(225) ,
);


create table BooksAGM6(

	Id varchar(25) primary key ,
	N_Books nvarchar(255) not null,
	Content ntext,
	Year_publication int not null default year(getdate()),
	Price decimal(16,0) not null check(price >= 0) default 0,
	Quantity int not null check(Quantity >=0) default 0,
	NumberPublish int not null check(NumberPublish>0) default 0, 
	TypeID int not null foreign key(TypeID) references TypesBookAGM6(ID),
	AuthorsID int not null  foreign key(AuthorsID) references AuthorsAGM6(ID),
	PublishionID int not null  foreign key(PublishionID) references PublishionsAGM6(ID),
)
	(N'Nguyễn Thị B'),(N'ĐÀO Văn Vàng'),
	(N'Nguyễn Văn Mario'),(N'Thị nở'),
	select * from BooksAGM6 where Year_publication >= 2008
--4. Liệt kê 10 cuốn sách có giá bán cao nhất
	SELECT TOP 10 * FROM BooksAGM6 ORDER BY Price desc
--5. Tìm những cuốn sách có tiêu đề chứa từ “tin học”
	select * from BooksAGM6 where N_Books like N'%Tin học%'
--6. Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần
	select * from BooksAGM6 where N_Books like 'T%' order by N_Books desc
--7. Liệt kê các cuốn sách của nhà xuất bản Tri thức
	select * from BooksAGM6 where PublishionID in (select Id from PublishionsAGM6 where Name like N'Tri thức')
--8. Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái”
select * from PublishionsAGM6

--9. Hiển thị các thông tin sau về các cuốn sách: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản,Loại sách
	select B.Id,B.N_Books,B.Year_publication,P.Name,T.Name from BooksAGM6 as B join PublishionsAGM6 as P  on B.PublishionID = P.Id
	JOIN TypesBookAGM6 AS T ON B.TypeID=T.Id

--10. Tìm cuốn sách có giá bán đắt nhất
	SELECT * FROM BooksAGM6 WHERE Price = (select max(Price) from BooksAGM6)
--11. Tìm cuốn sách có số lượng lớn nhất trong kho
	SELECT * FROM BooksAGM6 WHERE Quantity = (select max(Quantity) from BooksAGM6)
--12. Tìm các cuốn sách của tác giả “Eran Katz”
	SELECT * FROM BooksAGM6 as B WHERE b.AuthorsID = (select Id from AuthorsAGM6 where Name like 'Eran Katz')
--13. Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước
	update BooksAGM6 set Price = Price-(10*Price/100)
	where Year_publication <= 2008
--14. Thống kê số lượng sách của mỗi nhà xuất bản
	select SUM(Quantity)AS SL_SACH,PublishionID AS PublishionID from BooksAGM6 as B join PublishionsAGM6 as P on B.TypeID = P.Id GROUP BY B.PublishionID 
	SELECT * FROM PublishionsAGM6
	SELECT * FROM BooksAGM6
--15. Thống kê số lượng sách của mỗi loại sách
	select count(*) AS SL_SACH,T.Name from BooksAGM6 as B join TypesBookAGM6 as T on B.TypeID = T.Id GROUP BY T.Name
--16. Đặt chỉ mục (Index) cho trường tên sách
	create index IDX_BOOK_N
	ON BooksAGM6(N_Books)
--17. Viết view lấy thông tin gồm: Mã sách, tên sách, tác giả, nhà xb và giá bán
	create view V_BOOK_ATH AS
	SELECT B.Id AS MaSach, B.N_Books AS TenSach,ATH.Name AS TenTG,P.Name AS NhaXB,B.Price AS GiaBan FROM BooksAGM6 AS B JOIN AuthorsAGM6 AS ATH ON B.AuthorsID=ATH.Id
	JOIN PublishionsAGM6 AS P ON B.PublishionID = P.Id

	SELECT * FROM V_BOOK_ATH;
--18. Viết Store Procedure:
--◦ SP_Them_Sach: thêm mới một cuốn sách
	CREATE PROCEDURE SP_Them_Sach @Id varchar(25),@N_Books nvarchar(255),@Content ntext,@Y_PLS int,@Price decimal(16,0),@Quantity int,@Num_PLS int,@TypeID int,@AuthorsID int,@PublishionID int AS
	INSERT INTO BooksAGM6 values (@Id,@N_Books,@Content,@Y_PLS,@Price,@Quantity,@Num_PLS,@TypeID,@AuthorsID,@PublishionID)

	EXEC SP_Them_Sach @Id='B1234',@N_Books=N'THÊM SACH 1',@Content=N'NỘI DUNG ',@Y_PLS=2022,@Price=99999,@Quantity=12,@Num_PLS=1,@TypeID=3,@AuthorsID=9,@PublishionID=1;
--◦ SP_Tim_Sach: Tìm các cuốn sách theo từ khóa
	CREATE PROCEDURE SP_Tim_Sach @TimSach nvarchar(255) as
	select * from BooksAGM6 where N_Books like N'%'+@TimSach +'%';

	exec SP_Tim_Sach @TimSach=N'Tin học';
--◦ SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục
	
--19. Viết trigger không cho phép xóa các cuốn sách vẫn còn trong kho (số lượng > 0)
	create trigger TG_KDXS 
	ON BooksAGM6 for delete as
	begin 
		if exists (select * from deleted)
		begin 
			print N'Không được xóa' 
			rollback tran
		end
	end

	delete from BooksAGM6 where Id = 'B009'

--20. Viết trigger chỉ cho phép xóa một danh mục sách khi không còn cuốn sách nào thuộc chuyên mục này
				rollback tran