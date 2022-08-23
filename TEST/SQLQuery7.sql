

create table Types(
	Id int primary key  identity(1,1), -- phó mặc việc tăng dl cho database sẽ tự động tăng. 1...n
	Name nvarchar(255) not null unique
)
-- identity(1,1) xác thực //  unique: duy nhất

create table authors(
	id int primary key identity(1,1),
	Name nvarchar(225) not null unique -- ko đc để chống và ràng buộc chỉ 1 giá trị duy nhất
)

create table Publishions (
	id int primary key identity(1,1),
	Name nvarchar(225) not null unique, 
	Address nvarchar(225),
);
-- khi đã tạo bảng rồi mà muốn thêm thuộc tính cho trường của bảng đó 
 alter table authors add constraint CK_pk_authors primary key (Name)

create table Books(
	id int primary key identity(1,1),
	Name nvarchar(255) not null,
	Content text,
	Year_of_publication int not null default GETDATE(), -- GETDATE(): lấy ngày giờ hiện tại của hệ thống
	NumberPublish int not null check(NumberPublish>0) default 0, -- ràng buộc check: nếu NumberPublish > 0 thì ms chấp nhận
	Price decimal(16,0) not null check(price >= 0) default 0, -- nếu ko có giá trị nhận vào thì mặc định (default) là 0
	Qty int not null check(Qty >=0) default 0,
	TypeID int not null foreign key(TypeID) references Types(ID),
	PublishionID int not null  foreign key(PublishionID) references Publishions(ID),
	AuthorsID int not null  foreign key(AuthorsID) references Authors(ID),
)
-- nếu qh 1-1 thì thêm unique để ràng buộc
-- nvarchar & varchar trong SQL và varchar trong Mysql

alter table Authors


