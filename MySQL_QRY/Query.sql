CREATE TABLE `class`(
	id INT AUTO_INCREMENT,
	NAME VARCHAR(255) NOT NULL ,
	PRIMARY KEY (id)
);
CREATE TABLE `students`
(
	id INT AUTO_INCREMENT,
	STN_Name VARCHAR(255) NOT NULL,
	Age INT DEFAULT 0,
	ClassID INT ,
	PRIMARY KEY (id),
	FOREIGN KEY(classID) REFERENCES class(id)
);
CREATE TABLE `teachers`
(
	id INT AUTO_INCREMENT ,
	Name VARCHAR(255) NOT NULL,
	
)

INSERT INTO class(NAME) VALUES 
('t2204m'),('t2203f'),('t2205g'),('t2205h'),('t2207j');
INSERT INTO students(STN_Name,Age,ClassID) VALUES 
('hoc sinh 1',20,1),('hoc sinh 3',20,1),('hoc sinh 6',25,2),('hoc sinh e',24,4),
('hoc sinh5',20,4),('hoc sinh 2',40,5),('hoc sinh s',30,2),('hoc sinh s',28,1)
SELECT * FROM students  AS S JOIN class AS C ON C.id = S.ClassID 

-- TIM HS TRONG LOP T2204M
SELECT * FROM students WHERE ClassID = 
(SELECT id FROM class WHERE NAME = 't2204m')





