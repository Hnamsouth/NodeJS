-- các cách thêm primary key.
-- 1 thêm ngay sau khi tạo tường(feild)
-- 2 thêm lệnh primary key (id)   bên trong lệnh tạo table
-- 3 add thêm primary key nếu bảng đó chưa có dùng alter. ALTER TABLE testOK1 ADD PRIMARY KEY (id)

-- thêm CONSTRAINT PK_Test1 : đặt tên cho primary key . nếu muốn xoa  PK_Test1 thì primary key cũng bị xóa 

create table testPK1
(
	id int primary key,
	Name VARCHAR(255) not null default 'hoangnam'
)


insert dbo.testPK1(id)
values (0)

insert dbo.testPK1(id)
values (1)

insert dbo.testPK1(id)
values (2)

insert dbo.testPK1(id)
values (3)

-- 

create table testPK2
(
	id int not null,
	Name VARCHAR(255) not null default 'hoangnam'
)

ALTER TABLE testPK2 
ADD CONSTRAINT pktest2
PRIMARY KEY (id)

SELECT * FROM testPK2
insert dbo.testPK2(id)
values (0)

insert dbo.testPK2(id)
values (1)
-- 2 TRƯỜNG KHÓA CHÍNH

create table testPK5
(
	id1 int not null,
	id2 int not null,
	Name VARCHAR(255) not null default 'hoangnam'
	PRIMARY KEY (id1,id2)
)
