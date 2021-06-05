create database Gucera;

create table Users
(
  id int primary key identity NOT NULL,
  firstName varchar(20),
  lastName varchar(20),
  password varchar(20),
  gender bit,
  email varchar(50) unique,
  address varchar(10)   

 );
 
 Create table Instructor
 (
   id int ,
   rating decimal(2,1) default 0.0,
   primary key (id),
   foreign key (id) references Users on delete cascade on update cascade
 );

 
 Create table UserMobileNumber
 (
   id int   ,
   mobileNumber varchar(20),
   primary key (id, mobileNumber),
   foreign key (id) references Users on delete cascade on update cascade
 
 );

 
 
 create table Student
 (
   id int primary key,
   gpa decimal(5,2) DEFAULT 0.00,
   foreign key (id) references Users on delete cascade on update cascade

   );


   create table Admin
   (
    id int,
    primary key (id),
    foreign key(id) references Users on delete cascade on update cascade
    );

    create table Course
    (
    id int primary key identity,
    creditHours int,
    name varchar(10),
    courseDescription varchar(200),
    price   decimal(6,2),
    content  varchar(20),
    adminId  int , 
    instructorId int,  
    accepted bit default 0,
    foreign key (instructorId) references Instructor,
    foreign key (adminId) references Admin
    );

    
    

    create table Assignment 
    (
      cid int  ,
      number int ,
      type varchar(10),
      fullGrade int,
      weight decimal(4,1),
      deadline datetime,
      content varchar(200),
      primary key (cid, number, type),
      foreign key(cid) references Course on delete cascade on update cascade
    );
    

    create table Feedback
    (
     cid int,
     number int identity,
     comments varchar(100),
     numberOfLikes int default 0,
     sid int,
     primary key(cid, number),
     foreign key(cid) references Course on delete cascade on update cascade,
     foreign key(sid) references Student on delete cascade on update cascade
   );



   create table Promocode 
   (
    code varchar(6) Primary key, 
    issueDate datetime,
    expiryDate datetime,
    discountAmount decimal (4,2),
    adminID int foreign key references Admin on delete cascade on update cascade ---leeh m2lsh multiple cascade path?
    );

    
    create table StudentHasPromocode
    (
     sid int,
     code varchar(6),
     primary key(code, sid),
     foreign key (sid) references Student,
     foreign key(code) references Promocode on delete cascade on update cascade
     );
     
   create table creditCard
     (
     number varchar(15) primary key,
     cardHolderName varchar(16),
     expiryDate datetime,
     cvv varchar(3)
     );

     create table StudentAddCreditCard
     (
     sid int,
     creditCardNumber varchar(15),
     primary key(sid, creditCardNumber),
     foreign key(sid) references student on delete cascade on update cascade,
     foreign key(creditCardNumber) references creditCard on delete cascade on update cascade
     );

     create table StudentTakeCourse  
     (
        sid int ,
        cid int, 
        instId int,
        payedFor bit,
        grade decimal(10,2),
        primary key (sid, cid ,instId),
        Foreign Key (sid) references Student on delete cascade on update cascade,
        foreign kEY (cid)  references Course ,
        foreign key (instId) references Instructor 
      );

     create table StudentTakeAssignement
   (
    sid int,
    cid int, 
    assignmentNumber int,
    assignmentType varchar(10),
    Grade decimal(5,2), 
    primary key (sid, cid, assignmentNumber, assignmentType, Grade) , 
    foreign key (sid) references Student,
    foreign key(cid,assignmentNumber, assignmentType) references Assignment (cid, number, type)
   
   );

   create table StudentRateInstructor
   (
    sid int,
    instId int,
    rate decimal(2,1),
    foreign Key (sid) references Student on delete cascade on update cascade,
    foreign key (instId) references Instructor 
    );

create table StudentCertifyCourse
(
sid int,
cid int,
issueDate datetime,
Primary Key (sid, cid),
Foreign Key (sid) references Student on delete cascade on update cascade,
Foreign Key (cid) references course on delete cascade on update cascade
);


create table CoursePrerequisiteCourse(
cid int,
prerequisiteId int,
Primary Key( cid, prerequisiteId),
Foreign Key (cid) references course on delete cascade on update cascade,
Foreign key (prerequisiteId) references course 
);


create table InstructorTeachCourse 
(
instId int,
cid int,
Primary key (instId, cid),
Foreign Key (instId) references Instructor on delete cascade on update cascade,
Foreign Key (cid) references course on delete cascade on update cascade
);


