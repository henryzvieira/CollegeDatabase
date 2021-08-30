/*HENRIQUE VIEIRA DE OLIVEIRA ID:20190611 HIGHER DIPLOMA IN SCIENCE IN COMPUTING*/

/*TASK 2 EXERCISE 1 - Create the database and all tables specified in the dataset (relational model) 
to meet the specifications identified in task one. Clearly document all DDL statements used in this 
process.(10 Marks) */

CREATE database College;

USE College;
CREATE TABLE Department (
DepartmentID INTEGER NOT NULL,
DepartmentName VARCHAR(25),
CollegePhone VARCHAR(10) DEFAULT "01-7654321",
OpeningTime VARCHAR (23),
PRIMARY KEY (DepartmentID),
UNIQUE (DepartmentName)
);

CREATE TABLE Staff(
StaffID INTEGER NOT NULL,
StaffFName VARCHAR(15),
StaffLName VARCHAR(15),
Jobtitle VARCHAR(15),
StartDate DATE,
DaysOff INTEGER,
DepartmentID INTEGER,
PRIMARY KEY (StaffID),
UNIQUE (StaffFNAme, StaffLName),
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Module(
ModuleID INTEGER NOT NULL,
ModuleName VARCHAR(30),
StaffID INTEGER,
PRIMARY KEY (ModuleID),
UNIQUE (ModuleName),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Course(
CourseID INTEGER NOT NULL,
CourseName VARCHAR(40),
Level INTEGER,
CourseTitle VARCHAR(12),
DeliveryMethod VARCHAR(10),
Duration INTEGER,
Semesters INTEGER,
CourseFee INTEGER,
DepartmentID INTEGER,
PRIMARY KEY (CourseID),
UNIQUE (CourseName),
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Incorporates_Module(
ModuleID INTEGER,
CourseID INTEGER,
FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Student(
StudentID INTEGER NOT NULL,
FName VARCHAR(15),
LName VARCHAR(15),
BirthDate DATE,
Email VARCHAR(20),
Address VARCHAR(25),
Phone VARCHAR(16) DEFAULT "+86 382 146 1542",
CourseID INTEGER,
PRIMARY KEY (StudentID),
UNIQUE (FName, LName),
UNIQUE (email),
UNIQUE (Phone),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Takes_Modules(
ModuleID INTEGER,
StudentID INTEGER,
ModuleGrade INTEGER,
ModuleResult VARCHAR(9),
FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Fee_Student(
CourseID INTEGER,
StudentID INTEGER,
FeeStatus VARCHAR(10),
FirstPay DATE,
SecondPay DATE,
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Progress_Student(
CourseID INTEGER,
StudentID INTEGER,
CourseYear INTEGER,
CourseGrade INTEGER,
CourseResult VARCHAR(12),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

/*TASK 2 EXERCISE 2 - Populate all database tables with the desired data to a minimum of 10 tuples per 
relation. Clearly document all DML statements used in this process (10 Marks)*/

USE college;

INSERT INTO Department 
(DepartmentID, DepartmentName, CollegePhone, OpeningTime) 
VALUES 
(200, "College Adm", "01-7654300", "08:00 to 19:00"),
(201, "School of Computing", "01-7654301", "08:00 to 17:00"),
(202, "School of Business", "01-7654302", "09:00 to 18:00"),
(203, "School of Education", "01-7654303", "08:00 to 14:00"),
(204, "School of Finance", "01-7654304", "09:00 to 16:00"),
(205, "School of HR", "01-7654305", "08:00 to 16:00"),
(206, "School of Social Science", "01-7654306", "14:00 to 19:00"),
(207, "School of Arts ", "01-7654307", "13:00 to 18:00"),
(208, "School of Engineering", "01-7654308", "09:00 to 18:00"),
(209, "School of Health", "01-7654309", "08:00 to 17:00");

INSERT INTO Staff
(StaffID, StaffFName, StaffLName, Jobtitle, StartDate, DaysOff, DepartmentID) 
VALUES 
(10001, "Matthew", "Le Lievre", "Office Worker", "2007-05-05", 28, 200),
(10002, "Benedicta", "Baulk", "Office Worker", "2013-05-05", 7, 200),
(10003, "Keslie", "Whanstall", "Dean", "2013-05-05", 23, 200),
(10004, "Dee dee", "Tattoo", "Lecturer", "2019-05-05", 19, 201),
(10005, "Jarad", "Trenbay", "Lecturer", "2004-05-05", 3, 201),
(10006, "Cati", "Fulger", "Lecturer", "2008-05-05", 1, 201),
(10007, "Susanna", "Newlands", "Lecturer", "2002-05-05", 29, 201),
(10008, "Olga", "Matovic", "Lecturer", "2004-05-05", 20, 201),
(10009, "Bryn", "Dominighi", "Lecturer", "2000-05-05", 24, 201),
(10010, "Hoebart", "Crabb", "Lecturer", "2020-05-05", 19, 201),
(10011, "Georgina", "Daverin", "Lecturer", "2012-05-05", 22, 201),
(10012, "Trueman", "Quinney", "Lecturer", "2014-05-05", 7, 201),
(10013, "Michael", "Renforth", "Lecturer", "2009-05-05", 16, 202),
(10014, "Rik", "Bernardot", "Lecturer", "2017-05-05", 9, 203),
(10015, "Eunice", "Brick", "Lecturer", "2009-05-05", 10, 204),
(10016, "Celestyna", "Mullins", "Lecturer", "2013-05-05", 1, 205),
(10017, "Trudi", "Kelbie", "Lecturer", "2001-05-05", 25, 206),
(10018, "Bonnibelle", "Kalf", "Lecturer", "2020-05-05", 11, 207),
(10019, "Jim", "Hirtz", "Lecturer", "2020-05-05", 10, 208),
(10020, "Vinnie", "Beasleigh", "Lecturer", "2005-05-05", 4, 209);

INSERT INTO Module
(ModuleID, ModuleName, StaffID) 
VALUES
(202001, "Business", 10013),
(203001, "Education", 10014),
(204001, "Finance", 10015),
(205001, "HR", 10016),
(206001, "Social Science", 10017),
(207001, "Arts ", 10018),
(208001, "Engineering", 10019),
(209001, "Health", 10020),
(201001, "OOSE", 10004),
(201002, "Advanced Programming", 10005),
(201003, "Data Structures", 10006),
(201004, "Distributed Systems", 10007),
(201005, "Web Design", 10008),
(201006, "Algorithims", 10009),
(201007, "Introduction to Databases", 10010),
(201008, "Server Side", 10011),
(201009, "Software Development", 10012);

INSERT INTO Course
(CourseID, CourseName, Level, CourseTitle, DeliveryMethod, Duration, Semesters, CourseFee, DepartmentID) 
VALUES
(202100, "Higher in Business", 6,"Higher", "Classroom", 2, 4, 5000, 202),
(203100, "Higher in Education", 6,"Higher", "Classroom", 2, 4, 5000, 203),
(204100, "Higher in Finance", 6,"Higher", "Classroom", 2, 4, 5000, 204),
(205100, "Certificate in HR", 7,"Certificate", "Classroom", 1, 3, 6000, 205),
(206100, "Certificate in Social", 7,"Certificate", "Classroom", 1, 3, 6000, 206),
(207100, "Honours in Arts ", 8,"Honours", "Classroom", 4, 12, 40000, 207),
(208100, "Honours in Build", 8,"Honours", "Classroom", 4, 12, 40000, 208),
(209100, "Masters in Health", 9,"Masters", "Classroom", 1, 3, 12000, 209),
(201100, "Higher in Cyber", 8,"Higher", "Classroom", 1, 3, 10000, 201),
(201101, "Higher in Computing", 8,"Higher", "Classroom", 1, 3, 10000, 201),
(201102, "Higher in Cloud", 8,"Higher", "Classroom", 1, 3, 10000, 201),
(201103, "PHD in Cloud", 10,"PHD", "Classroom", 1, 3, 20000, 201),
(201104, "PHD in Computing", 10,"PHD", "Classroom", 1, 4, 20000, 201);

INSERT INTO Incorporates_Module
(ModuleID, CourseID)
VALUES
(202001, 202100),
(203001, 203100),
(204001, 204100),
(205001, 205100),
(206001, 206100),
(207001, 207100),
(208001, 208100),
(209001, 209100),
(201001, 201100),
(201002, 201101),
(201003, 201102),
(201004, 201103),
(201005, 201104),
(201006, 201100),
(201007, 201101),
(201008, 201102),
(201009, 201103),
(201001, 201104);

INSERT INTO Student
(StudentID, FName, LName, BirthDate, Email, Address, Phone, CourseID)
VALUES
(400030, "Onofredo", "Luetkemeyers", "1989-04-04", "oluetkeeyer0@ucd.edu", "93 Pleasure Way", "+30 583 647 7850", 202100),
(400031, "Guillermo", "Attow", "1983-01-29", "gttow1@redcro.org", "11 Kennedy Point", "+72 880 750 0807", 203100),
(400032, "Abner", "Takis", "1994-10-16", "tki2@ete.gov", "31 Rutledge Junction", "+51 266 484 8782", 204100),
(400033, "Teodora", "Ivanin", "1983-03-19", "tivi3@blog.co", "79235 Holmberg Drive", "+38 451 634 2382", 205100),
(400034, "Thoma", "Hatfull", "1999-02-17", "thtfull4@phi.co", "59 Bultman Park", "+22 259 219 5021", 206100),
(400035, "Helenka", "Hardisty", "1987-02-24", "hhrdity5@bluehot.co", "6 Melby Circle", "+51 664 132 8869", 207100),
(400036, "Heddi", "Dunridge", "1980-07-04", "hdunrdge6@pb.org", "48 Mccormick Junction", "+46 628 374 6373", 208100),
(400037, "Everett", "Capponer", "1997-07-10", "ecpponer7@pb.org", "800 Iowa Parkway", "+86 343 258 1799", 209100),
(400038, "Jeri", "Clemence", "1992-07-09", "jcleence8@bc.net.u", "31148 Fairfield Alley", "+51 435 385 0242", 201100),
(400039, "Corey", "Cleife", "2000-11-27", "cclefe9@gzodo.co", "7 Ohio Hill", "+59 185 441 4484", 201101),
(400040, "Breena", "Dudin", "1999-09-22", "bdudn@hnytt.co", "15647 Browning Hill", "+12 267 840 8481", 201102),
(400041, "Yul", "Rennebeck", "1990-05-26", "yrennebeckb@grvtr.co", "5 Haas Trail", "+30 702 672 0259", 201103),
(400042, "Marcos", "Calbaithe", "1997-12-03", "clbthec@u.gov", "54 Melrose Circle", "+98 973 327 2379", 201104),
(400043, "Rosaleen", "Dornan", "1982-11-23", "rdornnd@.edu", "62375 Mosinee Street", "+52 191 737 4371", 201104),
(400044, "Ken", "Evreux", "1984-03-10", "kevreuxe@ted.co", "4 Schlimgen Terrace", "+86 660 483 1451", 201104),
(400045, "Emmett", "Rathborne", "1985-07-23", "erthbornef@econot.co", "212 Wayridge Alley", "+55 280 606 5234", 201104),
(400046, "Madalyn", "Racine", "1999-03-20", "rcneg@lvejournl.co", "7 Gateway Court", "+63 928 877 9254", 201104),
(400047, "Jan", "Lorimer", "1993-05-10", "jlorerh@nfoeek.co.jp", "12 Fieldstone Parkway", "+32 505 341 4991", 201104),
(400048, "Vernice", "De Miranda", "1989-06-04", "vderd@bc.et.u", "59945 American Lane", "+62 162 248 7825", 201104),
(400049, "Iorgo", "Mustarde", "1980-07-15", "utrdej@toplt.cz", "7952 Fulton Place", "+46 714 799 3275", 201104),
(400050, "Nanni", "Dober", "1995-04-13", "doberk@xhuet.co", "062 Mosinee Way", "+46 849 408 3318", 201104),
(400051, "Blinnie", "Sends", "1985-02-10", "bedl@ozll.org", "92199 Straubel Hill", "+42 961 776 9323", 201104),
(400052, "Aurelia", "Bernt", "1983-08-11", "bert@zo.co.jp", "4 Donald Street", "+86 937 204 2533", 201104),
(400053, "Eugene", "Neubigging", "1994-09-22", "eeubggg@europ.eu", "67138 Katie Road", "+54 921 664 6552", 201104),
(400054, "Vern", "Birkwood", "1983-11-29", "vbrkwoodo@bueder.co", "850 Riverside Plaza", "+86 139 432 7837", 201104),
(400055, "Jamie", "Bearne", "1989-01-05", "jberep@eby.co", "195 Manley Park", "+33 500 889 3102", 201104),
(400056, "Gardener", "Gerran", "1985-07-09", "ggerrq@boutd.fo", "8 Hermina Place", "+86 361 553 4936", 201104),
(400057, "De", "Vaneschi", "1990-08-11", "dvechr@cdc.gov", "5 Prentice Circle", "+40 374 463 7779", 201104),
(400058, "Ivonne", "Dearman", "1987-08-09", "ider@google.co.jp", "3 Declaration Place", "+14 989 379 6679", 201104),
(400059, "Claudia", "Di Matteo", "1996-04-17", "cditteot@dot.gov", "4 Messerschmidt Drive", "+86 382 146 1542", 201104),
(400060, "Emelyne", "Atcock", "1986-02-27", "etcocku@icio.u", "3 Prairie Rose Court", "+96 567 358 4095", 201104),
(400061, "Nye", "Dicty", "1988-07-11", "dictyv@big.co", "84 Road Trail", "+55 573 741 4093", 201104),
(400062, "Sim", "Wrathmell", "1980-01-09", "wrthellw@jv.co", "7 Road Junction", "+58 854 556 5994", 201104);

INSERT INTO Takes_Modules
(ModuleID, StudentID, ModuleGrade, ModuleResult)
VALUES
(202001, 400030, 60, "Approved"),
(203001, 400031, 65, "Approved"),
(204001, 400032, 70, "Approved"),
(205001, 400033, 75, "Approved"),
(206001, 400034, 80, "Approved"),
(207001, 400035, 85, "Approved"),
(208001, 400036, 90, "Approved"),
(209001, 400037, 95, "Approved"),
(201001, 400038, 60, "Approved"),
(201001, 400039, 65, "Approved"),
(201001, 400040, 70, "Approved"),
(201001, 400041, 75, "Approved"),
(201001, 400042, 80, "Approved"),
(201001, 400043, 85, "Approved"),
(201001, 400044, 90, "Approved"),
(201001, 400045, 95, "Approved"),
(201001, 400046, 60, "Approved"),
(201001, 400047, 65, "Approved"),
(201001, 400048, 70, "Approved"),
(201001, 400049, 75, "Approved"),
(201001, 400050, 80, "Approved"),
(201001, 400051, 85, "Approved"),
(201001, 400052, 90, "Approved"),
(201001, 400053, 95, "Approved"),
(201001, 400054, 60, "Approved"),
(201001, 400055, 65, "Approved"),
(201001, 400056, 70, "Approved"),
(201001, 400057, 75, "Approved"),
(201001, 400058, 80, "Approved"),
(201001, 400059, 85, "Approved"),
(201001, 400060, 90, "Approved"),
(201001, 400061, 95, "Approved"),
(201001, 400062, 60, "Approved"),
(201002, 400054, 65, "Approved"),
(201003, 400055, 70, "Approved"),
(201004, 400056, 75, "Approved"),
(201005, 400057, 80, "Approved"),
(201006, 400058, 85, "Approved"),
(201007, 400059, 90, "Approved"),
(201008, 400060, 95, "Approved"),
(201009, 400061, 70, "Approved"),
(201001, 400062, 75, "Approved");

INSERT INTO Fee_Student
(CourseID, StudentID, FeeStatus, FirstPay, SecondPay)
VALUES
(202100, 400030,  "Open", "2020-01-01", NULL),
(203100, 400031,  "Open", "2020-01-01", NULL),
(204100, 400032,  "Paid", "2020-01-01", "2021-01-01"),
(205100, 400033,  "Open", "2021-01-01", NULL),
(206100, 400034,  "Paid", "2021-01-01", "2021-01-01"),
(207100, 400035,  "Paid", "2018-01-01", "2021-01-01"),
(208100, 400036,  "Paid", "2018-01-01", "2021-01-01"),
(209100, 400037,  "Open", "2021-01-01", NULL),
(201100, 400038,  "Paid", "2021-01-01", "2021-03-03"),
(201101, 400039,  "Open", "2021-01-01", NULL),
(201102, 400040,  "Paid", "2021-01-01", "2021-03-03"),
(201103, 400041,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400042,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400043,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400044,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400045,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400046,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400047,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400048,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400049,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400050,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400051,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400052,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400053,  "Paid", "2021-01-01", "2021-03-03"),
(201104, 400054,  "Open", "2021-01-01", NULL),
(201104, 400055,  "Open", "2021-01-01", NULL),
(201104, 400056,  "Paid", "2021-01-01", "2021-02-02"),
(201104, 400057,  "Paid", "2021-01-01", "2021-02-02"),
(201104, 400058,  "Paid", "2021-01-01", "2021-02-02"),
(201104, 400059,  "Paid", "2021-01-01", "2021-02-02"),
(201104, 400060,  "Paid", "2021-01-01", "2021-02-02"),
(201104, 400061,  "Paid", "2021-01-01", "2021-02-02"),
(201104, 400062,  "Paid", "2021-01-01", "2021-02-02");

INSERT INTO Progress_Student
(CourseID, StudentID, CourseYear, CourseGrade, CourseResult)
VALUES
(202100, 400030,  2, NULL, "IN PROGRESS"),
(203100, 400031,  2, NULL, "IN PROGRESS"),
(204100, 400032,  2, NULL, "IN PROGRESS"),
(205100, 400033,  1, NULL, "IN PROGRESS"),
(206100, 400034,  1, NULL, "IN PROGRESS"),
(207100, 400035,  4, NULL, "IN PROGRESS"),
(208100, 400036,  4, NULL, "IN PROGRESS"),
(209100, 400037,  1, NULL, "IN PROGRESS"),
(201100, 400038,  1, NULL, "IN PROGRESS"),
(201101, 400039,  1, NULL, "IN PROGRESS"),
(201102, 400040,  1, NULL, "IN PROGRESS"),
(201103, 400041,  1, NULL, "IN PROGRESS"),
(201104, 400042,  1, NULL, "IN PROGRESS"),
(201104, 400043,  1, NULL, "IN PROGRESS"),
(201104, 400044,  1, NULL, "IN PROGRESS"),
(201104, 400045,  1, NULL, "IN PROGRESS"),
(201104, 400046,  1, NULL, "IN PROGRESS"),
(201104, 400047,  1, NULL, "IN PROGRESS"),
(201104, 400048,  1, NULL, "IN PROGRESS"),
(201104, 400049,  1, NULL, "IN PROGRESS"),
(201104, 400050,  1, NULL, "IN PROGRESS"),
(201104, 400051,  1, NULL, "IN PROGRESS"),
(201104, 400052,  1, NULL, "IN PROGRESS"),
(201104, 400053,  1, NULL, "IN PROGRESS"),
(201104, 400054,  1, NULL, "IN PROGRESS"),
(201104, 400055,  1, NULL, "IN PROGRESS"),
(201104, 400056,  1, NULL, "IN PROGRESS"),
(201104, 400057,  1, NULL, "IN PROGRESS"),
(201104, 400058,  1, NULL, "IN PROGRESS"),
(201104, 400059,  1, NULL, "IN PROGRESS"),
(201104, 400060,  1, NULL, "IN PROGRESS"),
(201104, 400061,  1, NULL, "IN PROGRESS"),
(201104, 400062,  1, NULL, "IN PROGRESS");

/*TASK 3 EXERCISE 1 - Change all students in year one of any course to year two. (2 Marks)*/
USE College;

UPDATE Progress_student
SET CourseYear = 2
WHERE CourseYear = 1;

/*TASK 3 EXERCISE 2 - Modify the status of any student in year 4 of all courses to indicate 
that they have now completed the course. (2 Marks)*/
USE College;

UPDATE Progress_student
SET CourseResult = "COMPLETED"
WHERE CourseYear = 4;

/*TASK 3 EXERCISE 3 - Delete all students who have outstanding fees which have not been paid for
 more than 6 months. (2 Marks)*/
USE College;

DELETE fee
FROM Fee_Student fee
INNER JOIN Student s ON s.StudentID = fee.StudentID 
WHERE TIMESTAMPDIFF(MONTH, fee.FirstPay, current_date()) > 6 AND fee.FeeStatus = "Open";

DELETE FROM progress_student 
WHERE StudentID NOT IN (SELECT Fee_Student.StudentID FROM Fee_Student);

DELETE FROM Takes_Modules 
WHERE StudentID NOT IN (SELECT Fee_Student.StudentID FROM Fee_Student);

DELETE FROM Student 
WHERE StudentID NOT IN (SELECT Fee_Student.StudentID FROM Fee_Student);

 /*TASK 3 EXERCISE 4 - Display the first name, surname and grade of all students sorting the results so
 the highest grades are first. (2 Marks)*/
USE College;

SELECT FName, LName, ModuleGrade
FROM student, takes_modules
WHERE Student.StudentID = Takes_Modules.StudentID
ORDER BY ModuleGrade DESC;

/*TASK 3 EXERCISE 5 - Add one new record to each table. (2 Marks) */
 USE College;
 
INSERT INTO Department VALUES(210, "Fashion School", "01-7654310", "08:00 to 17:00");

INSERT INTO Staff VALUES(10021, "Henrique", "Oliveira", "Lecturer", "2021-01-01", 6, 210);

INSERT INTO Module VALUES(210001, "Trending", 10021);

INSERT INTO Course VALUES(210100, "Higher in Fashion", 8, "Higher", "Classroom", 1, 3, 10000, 210);

INSERT INTO Incorporates_Module VALUES(210001, 210100);

INSERT INTO Student VALUES(400063, "Lu", "Chao", "1980-01-09", "wrtkhellw@jv.com", "8 Arrowood Junction", "+58 854 556 5993", 210100);

INSERT INTO Takes_Modules VALUES(210001, 400063, 90, "Approved");

INSERT INTO Fee_Student VALUES(210100, 400063, "Paid", "2021-01-01", "2021-01-01");

INSERT INTO Progress_Student VALUES(210100, 400063, "1", NULL, "IN PROGRESS");

/*TASK 3 EXERCISE 6 - Delete one record from all tables. (2 Marks)*/
USE College;

DELETE FROM Progress_Student WHERE CourseID = 210100 AND StudentID = 400063;

DELETE FROM Fee_Student WHERE CourseID = 210100 AND StudentID = 400063;

DELETE FROM Takes_Modules WHERE ModuleID = 210001 AND StudentID = 400063;

DELETE FROM Student WHERE StudentID = 400063;

DELETE FROM Incorporates_Module WHERE ModuleID = 210001 AND CourseID = 210100;

DELETE FROM Course WHERE CourseID = 210100;

DELETE FROM Module WHERE ModuleID = 210001;

DELETE FROM Staff WHERE StaffID = 10021;

DELETE FROM Department WHERE DepartmentID = 210;

/*TASK 3 EXERCISE 7 - Find the total number of days off for all staff, order
 this by least days off. (2 Marks) */
USE College;
 
SELECT *
FROM Staff
ORDER BY DaysOff ASC;
 
/*TASK 3 EXERCISE 8 - Count how many students are doing a business course. (2 Marks) */
USE College; 

SELECT COUNT(*) AS BusinessStudents
FROM Student s
INNER JOIN Course c on c.CourseID = s.CourseID
INNER JOIN Department d on d.DepartmentID = c.DepartmentID
WHERE d.DepartmentName = "School of Business";

/*TASK 3 EXERCISE 9 - Change the roll of all staff who have a job title Office worker to 
Administrator. (2 Marks)*/
USE College;

UPDATE Staff
SET JobTitle = "Administrator"
WHERE Jobtitle = "Office worker";

/*TASK 3 EXERCISE 10 - Change all courses entitled PHD to Doctorial. (2 Marks)*/
USE College;

UPDATE Course
SET CourseTitle = "Doctorial"
WHERE CourseTitle = "PHD";

/*TASK 3 EXERCISE 11 - Set the delivery method of all courses to online*/
USE College;

UPDATE Course
SET DeliveryMethod = "Online";

/*TASK 3 EXERCISE 12 - Update the opening times of the college to say closed to visitors. (2 Marks)*/
USE College;

UPDATE Department
SET Openingtime = "Closed to visitors";

/*TASK 3 EXERCISE 13 - Drop all information contained in the course's relation. (2 Marks)*/
USE College;

ALTER TABLE Progress_Student DROP FOREIGN KEY Progress_Student_ibfk_1;

ALTER TABLE Fee_Student DROP FOREIGN KEY Fee_Student_ibfk_1;

ALTER TABLE Student DROP FOREIGN KEY Student_ibfk_1;

ALTER TABLE Incorporates_Module DROP FOREIGN KEY Incorporates_Module_ibfk_2;

DELETE FROM Course;

/*TASK 3 EXERCISE 14 - Delete all courses from the database with an academic level of 6 or less. (2 Marks)*/
USE College;

DELETE pro
FROM Progress_Student pro
INNER JOIN Course cour ON cour.CourseID = pro.CourseID 
WHERE cour.Level <= 6;

DELETE FROM Fee_Student 
WHERE CourseID NOT IN (SELECT Progress_Student.CourseID FROM Progress_Student);

DELETE FROM Incorporates_Module 
WHERE CourseID NOT IN (SELECT Progress_Student.CourseID FROM Progress_Student);

DELETE FROM Takes_Modules
WHERE StudentID NOT IN (SELECT Progress_Student.StudentID FROM Progress_Student);

DELETE FROM Student
WHERE CourseID NOT IN (SELECT Progress_Student.CourseID FROM Progress_Student);

DELETE FROM Course 
WHERE level <= 6;

/*TASK 3 EXERCISE 15 - Set the college phone number to be 01-7654321. (2 Marks) */
USE College;

UPDATE Department
SET CollegePhone = "01-7654321";

/*TASK 3 EXERCISE 16 - Set the dean of the college to be called Michael Dean. (2 Marks)*/
USE College;

UPDATE Staff
SET StaffFName = "Michael"
WHERE Jobtitle = "Dean";

UPDATE Staff
SET StaffLName = "Dean"
WHERE Jobtitle = "Dean";

/*TASK 3 EXERCISE 17 - Show all staff members who have been working there for longer than 4 years. (2 Marks) */
USE College;

SELECT *
FROM Staff
WHERE TIMESTAMPDIFF(YEAR, StartDate, current_date()) > 4;

/*TASK 3 EXERCISE 18 - Show all courses that the college offers which run over 3 semesters and have a minimum 
of 20 participants per class. (2 Marks) */
USE College;

SELECT c.CourseID, c.CourseName, c.Semesters, count(s.CourseID) AS cnt
FROM Course c
INNER JOIN Student s ON s.CourseID = c.CourseID
WHERE c.Semesters > 3
GROUP BY c.CourseName
HAVING cnt > 20;

/*TASK 3 EXERCISE 19 - Identify how many students have the word road in their address. (1 Marks) */
USE College;

SELECT COUNT(*) AS RoadinAdress
FROM Student
WHERE Address LIKE '%road%';

/*TASK 3 EXERCISE 20 - Create a view that will show the result of a query drawing information from three tables at once. (3 marks)*/
USE College;

CREATE VIEW STUDENTINFO AS
SELECT s.StudentID, s.FName, s.LName, s.BirthDate, s.Email, s.Address, s.Phone, s.CourseID, 
p.CourseYear, p.CourseGrade, p.CourseResult,
f.FeeStatus, f.FirstPay, f.SecondPay
FROM Student s JOIN Progress_Student p ON s.StudentID = p.StudentID
JOIN Fee_Student f ON p.StudentID = f.StudentID;


