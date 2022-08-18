create database Subscribers

create table Number(
	ID int not null primary key ,
	RegisterDate date not null default GETDATE(),
)

create table TypeNumber (

	type varchar(50) not null 
)

create table Custemers(

	Name nvarchar(50) not null ,
	CMT int not null primary key ,
	Address varchar(255) not null ,
	TBnumber int not null foreign key(TBnumber) references Number(ID),

)
