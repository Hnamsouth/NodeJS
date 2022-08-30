create database EmployeeDB
use EmployeeDB;


-- create table Department
create table Department
(
	Id int primary key ,
	DepartName varchar(50) not null,
	Description varchar(100) not null
)

-- create table Employee
create table Employee
(
	EmpCode char(6) primary key ,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	Birthday date not null,
	Gender Bit default 1,
	Address varchar(100),
	DepartID Int foreign key references Department(Id),
	Salary Money, 
)
-- insert data Department table
insert into Department values
(1,'Business Administration',' Description Business administration '),
(2,'Administration and Finance',' Description  Administration and Finance'),
(3,'Budgeting','Description Budgeting'),
(4,'Career Services','Description Career Services')  

-- insert data Employee table
insert into Employee values
-- EmpCode , FirstName ,LastName ,Birthday ,Gender ,Address ,DepartID ,Salary
('E1','Em','loyee 1','2010-12-13',1,'New york',2,1000),
('E2','Em','loyee 2','2010-11-29',0,'Tokio',2,2500),
('E3','Em','loyee 3','2005-07-08',1,'Paris',2,1000),
('E4','Em','loyee 3','2003-11-13',0,'London',2,3000),
('E5','Em','loyee 1','2004-12-04',1,'New york',1,800),
('E6','Em','loyee 5','2020-05-13',1,'New york',1,4000),
('E7','Em','loyee 7','2010-11-13',1,'Ha noi',1,5000),
('E8','Em','loyee 8','2008-11-13',1,'Hai Phong',1,4000),
('E9','Em','loyee 1','2002-10-23',0,'TP HCM',3,8000),
('E10','Em','loyee 3','2001-02-17',0,'London',3,14000),
('E11','Em','loyee 10','2011-11-16',1,'Dubai',2,10000),
('E12','Em','loyee 9','1990-06-22',1,'Dubai',1,3000),
('E13','Em','loyee 11','2015-11-04',0,'London',2,1000)

--1. Chèn vào các bảng trên ít nhất 3 bản ghi cho mỗi bảng [2 dấu].
--2. Tăng lương cho tất cả nhân viên thêm 10% [0,5 mark].
	update Employee set Salary = Salary+(Salary*10/100);
--3. Sử dụng câu lệnh ALTER TABLE để thêm ràng buộc trên bảng Employee để đảm bảo rằnglương luôn lớn hơn 0 [1 điểm].
	alter table Salary
	add constraint CK_Salary check(Salary>0)
/*4. Tạo trình kích hoạt có tên tg_chkBirthday để đảm bảo tuổi của Nhân viên lớn hơn 22,
sử dụng giá trị ngày sinh để kiểm tra tuổi [2 dấu].*/
	create trigger tg_chkBirthday
	on Employee for insert as
	begin 
		if exists (select * from inserted where 22 > (getdate() - Birthday))
		begin 
		print 'tuoi khong duoc thap hon 22'
		rollback tran
		end
	end

/*5. Tạo một chỉ mục duy nhất, không phân cụm có tên là IX_DepartmentName on
Cột DepartName trên bảng Department [1 dấu].*/
create index IX_DepartmentName on Department(DepartName);
--6. Tạo chế độ xem để hiển thị mã của nhân viên, tên đầy đủ và tên bộ phận của tất cảnhân viên [2 dấu].
--. Create a view to display employee’s code, full name and department name of allemployees [2 marks].
create view V_Epl_Dpm as 
select FirstName,LastName,DepartName from Employee as e join Department as d on e.DepartID = d.Id 

/*7. Tạo một thủ tục được lưu trữ có tên sp_getAllEmp chấp nhận ID Cục là
đã cho tham số đầu vào và hiển thị tất cả nhân viên trong Bộ phận đó [2 dấu].*/
create procedure sp_getAllEmp @ID char(6) as 
select * from Employee where DepartID in 
(select Id from  Department where Id = 
(select DepartID from Employee where  EmpCode = @ID ))

exec sp_getAllEmp @ID = 'E1'
/*--8. Tạo một thủ tục được lưu trữ có tên sp_delDept chấp nhận Id 
nhân viên như đã cho đầu vào tham số để xóa một nhân viên [2 dấu].*/
create procedure sp_delDept @ID char(6) as 
delete from Employee where EmpCode = @ID

exec sp_delDept @ID = 'E1'


select * from Employee
select * from Department