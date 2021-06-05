SET IDENTITY_INSERT Users ON;
insert into Users (id) values (3)
SET IDENTITY_INSERT Users OFF;

INSERT INTO Admin(id) VALUES (3)

go
create Proc studentRegister
@first_name varchar(20), 
@last_name varchar(20), 
@password varchar(20), 
@email varchar(50),
@gender bit, 
@address varchar(10)

AS

IF @first_name IS NULL or @last_name IS NULL or @password IS NULL
	or @email IS NULL or @gender IS NULL or @address IS NULL
print('one of the inputs is null')

ELSE 
INSERT INTO Users(firstName, lastName, password, gender, email, address) 
VALUES(@first_name, @last_name, @password,@gender, @email, @address)

DECLARE @ID int
SELECT @ID = id
FROM Users
WHERE email = @email
INSERT INTO Student(id) VALUES(@ID)

go
Create Proc InstructorRegister
@first_name varchar(20), 
@last_name varchar(20), 
@password varchar(20), 
@email varchar(50),
@gender bit, 
@address varchar(10)

As

IF @first_name IS NULL or @last_name IS NULL or @password IS NULL
	or @email IS NULL or @gender IS NULL or @address IS NULL
print('one of the inputs is null')

ELSE 
INSERT INTO Users(firstName, lastName, password, gender, email, address) 
VALUES(@first_name, @last_name, @password,@gender, @email, @address)

DECLARE @ID int
SELECT @ID = id
FROM Users
where email=@email
INSERT INTO Instructor(id) VALUES(@ID)

go
Create Proc UserLogin 
@ID int,
@password varchar(20),
@Success bit OUTPUT,
@Type int OUTPUT

As
DECLARE @Present int
SET @Present=1
SELECT @Present=2
FROM Student
WHERE id=@id

SELECT @Present=0
FROM Instructor
WHERE id=@ID

SET @Success =0
SELECT @Success=1, @Type=@Present
FROM Users 
WHERE id=@ID and password=@password

print 'Success:'
print @Success
print 'Type:'
print @Type

go
Create Proc addMobile
@ID varchar(20),
@mobile_number varchar(20)

AS

DECLARE @isRegistered VARCHAR(20)

SELECT @isRegistered='YES'
FROM Users
WHERE PARSE(@ID as int)=id --set @studentID=PARSE(@Sid as int) 

IF @isRegistered='YES'
insert into userMobileNumber(id, mobileNumber)
VALUES(@ID, @mobile_number)

ELSE
PRINT 'This User is Not Registered'

go
CREATE PROC AdminListInstr
AS 
SELECT U.firstName, U.lastName
FROM instructor I inner join Users U ON I.id=U.id 

go
CREATE PROC AdminViewInstructorProfile 
@instrId int

AS
DECLARE @Found BIT 
SET @Found=0
SELECT @Found=1
FROM Instructor
WHERE id=@instrId
IF @Found=0
PRINT 'This instructor is not registered'
ELSE
Select U.firstName, U.lastName, U.gender, U.email, U.address, I.rating
FROM Instructor I  inner join Users U ON I.id=U.id
WHERE @instrId = I.id

go
CREATE PROC AdminViewAllCourses
AS
SELECT name, creditHours, price, content, accepted
FROM Course 

go
CREATE PROC AdminViewNonAcceptedCourses
AS
SELECT name, creditHours, price, content
FROM Course
WHERE accepted=0

go
CREATE PROC AdminViewCourseDetails
@courseId int
AS 
SELECT name, creditHours, price, content, accepted
FROM Course
WHERE id=@courseId

go
CREATE PROC AdminAcceptRejectCourse
@adminId int,
@courseId int

AS
DECLARE @isHere VARCHAR(50)
SELECT @isHere='YES'
FROM Course
WHERE id=@courseId

DECLARE @Found BIT
SET @Found=0
SELECT @Found=1
FROM Admin
WHERE id=@adminId

IF @isHere='YES' AND @Found=1
 UPDATE Course
 SET accepted=1, adminId=@adminId WHERE  id=@courseId
ELSE 
 IF @Found=0 
  PRINT 'This Admin is not registered'
 ELSE
  PRINT  'This course does not exist'

go
CREATE PROC AdminCreatePromocode
@code varchar(6),
@isuueDate datetime,
@expiryDate datetime,
@discount decimal(4,2),
@adminId int

AS
INSERT INTO Promocode 
VALUES (@code, @isuueDate, @expiryDate, @discount, @adminId)

go
CREATE PROC AdminListAllStudents
AS
SELECT firstName, lastName
FROM Users U inner join Student S on U.id=S.id

go
CREATE PROC AdminViewStudentProfile
@sid int

AS
SELECT firstName, lastName, gender, email, address, gpa
FROM Users U INNER JOIN STUDENT S ON U.id=S.id
WHERE S.id=@sid AND U.firstName IS NOT NULL AND U.lastName IS NOT NULL AND U.gender IS NOT NULL AND U.email IS NOT NULL
AND U.address IS NOT NULL AND S.gpa IS NOT NULL
 
go
CREATE PROC AdminIssuePromocodeToStudent
@sid int,
@pid varchar(6)

AS
DECLARE @Found BIT
SELECT @Found=1
FROM Student
WHERE id=@sid

DECLARE @isHere VARCHAR(50)
SELECT @isHere='YES'
FROM Promocode
WHERE code=@pid

IF @isHere='YES' AND @Found=1
INSERT INTO StudentHasPromocode 
VALUES (@sid, @pid)
ELSE
PRINT 'Either student or promocode not found' 

go
CREATE PROC InstAddCourse
@creditHours int,
@name varchar(10),
@price DECIMAL(6,2),
@instructorId int

AS
INSERT INTO Course (creditHours, name, price, instructorId)
VALUES (@creditHours, @name, @price, @instructorId)

DECLARE @courseID INT
SELECT @courseID=ID
FROM Course
WHERE instructorId=@instructorId AND creditHours=@creditHours AND name=@name AND price=@price

INSERT INTO InstructorTeachCourse
VALUES (@instructorId, @courseID)

go
CREATE PROC UpdateCourseContent
@instrId int, 
@courseId int, 
@content varchar(20)

AS

DECLARE @Found VARCHAR(50)
SELECT @Found='YES'
FROM Course
WHERE id=@courseId AND instructorId=@instrId

IF @Found='YES'
UPDATE Course 
SET content = @content
WHERE instructorId= @instrId AND id = @courseId 
ELSE
PRINT 'This course not found'

go
CREATE PROC UpdateCourseDescription
@instrId int, 
@courseId int, 
@courseDescription varchar(200)
AS

DECLARE @Found VARCHAR(50)
SELECT @Found='YES'
FROM Course
WHERE id=@courseId AND instructorId=@instrId

IF @Found='YES'
UPDATE Course
set courseDescription= @courseDescription
WHERE instructorId=@instrId AND id=@courseId
ELSE 
PRINT 'Course does not exist'

go
CREATE PROC AddAnotherInstructorToCourse
@instId int, 
@cid int, 
@adderIns int

AS
DECLARE @Found VARCHAR(50)
SELECT @Found='YES'
FROM Course 
WHERE id=@cid AND instructorId=@adderIns

DECLARE @Found1 VARCHAR(50)
SELECT @Found1='YES'
FROM Instructor
WHERE id=@instId

IF @Found='YES' AND @Found1='YES'
INSERT INTO InstructorTeachCourse 
VALUES (@instId, @cid)
ELSE 
PRINT 'No course assigned to that instructor Or Added instructor not registered'

GO 
CREATE PROC InstructorViewAcceptedCoursesByAdmin
@instrId int

AS
DECLARE @Found VARCHAR(50)
SELECT @Found='YES'
FROM Instructor
WHERE id=@instrId

SET @Found='NO'

SELECT @Found='YES'
FROM Course 
WHERE instructorId=@instrId

DECLARE @numberOfAcceptedCourses int
SELECT @numberOfAcceptedCourses=COUNT (*)
FROM Course
WHERE accepted=1 AND instructorId=@instrId

IF @Found='YES' AND @numberOfAcceptedCourses>0
SELECT id, name, creditHours
FROM Course
WHERE instructorId=@instrId AND accepted=1 
ELSE 
IF @Found='NO'
 PRINT 'No Course related to this instructor or this instructor not registered'
ELSE
 PRINT 'No accepted courses by this instructor'

GO
CREATE PROC DefineCoursePrerequisites
@cid int , 
@prerequsiteId int

AS
DECLARE @Found1 VARCHAR(50)
SELECT @Found1='YES'
FROM Course 
WHERE id=@cid

DECLARE @Found2 VARCHAR(50)
SELECT @Found2='YES'
FROM Course
WHERE id=@prerequsiteId

IF @Found1='YES' AND @Found2='YES'
 INSERT INTO CoursePrerequisiteCourse 
 VALUES (@cid, @prerequsiteId)
ELSE
 PRINT 'One of the Courses not found'

GO
CREATE PROC DefineAssignmentOfCourseOfCertianType
@instId int, 
@cid int , 
@number int, 
@type varchar(10), 
@fullGrade int, 
@weight decimal(4,1), 
@deadline datetime, 
@content varchar(200)

AS
DECLARE @ACCPETED BIT
SELECT @ACCPETED=1
FROM Course
WHERE id=@cid AND accepted=1 AND instructorId=@instId

IF @ACCPETED=1
 INSERT INTO Assignment  
   VALUES (@cid, @number, @type, @fullGrade, @weight, @deadline, @content)
ELSE
 PRINT 'This Course is not accepted by the admin yet or not found or not assigned to this instructor'

GO  
CREATE PROC updateInstructorRate
@instId int

AS
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM Instructor
WHERE id=@instId

IF @FOUND='NO'
 PRINT 'Instructor not found'
ELSE
 DECLARE @Rating decimal(2,1)
 SELECT @Rating = avg(rate)
 FROM StudentRateInstructor
 WHERE instId=@instId

 UPDATE Instructor
 SET rating=@Rating WHERE id=@instId

GO 
CREATE PROC  ViewInstructorProfile
@instrId int

AS 
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM Instructor
WHERE id=@instrId

IF @FOUND='NO'
 PRINT 'Instructor not found'
ELSE
SELECT firstName, lastName, gender, email, address, rating, mobileNumber
FROM Users U INNER JOIN Instructor I ON U.id=I.id
             INNER JOIN UserMobileNumber UMN ON I.id=UMN.id

GO 
CREATE PROC InstructorViewAssignmentsStudents
@instId int,
@cid int

AS
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM InstructorTeachCourse 
WHERE instId=@instId AND cid=@cid

IF @FOUND='NO'
 PRINT 'This instructor does not teach this course'
ELSE
SELECT sid, STA.cid, assignmentNumber, assignmentType
FROM StudentTakeAssignement STA INNER JOIN InstructorTeachCourse ITC 
ON STA.cid=ITC.cid
WHERE ITC.instId=@instId and ITC.cid=@cid

GO
CREATE PROC InstructorGadeAssignmentOfAStudent
@instId int, 
@sid int , 
@cid int, 
@assignmentNumber int, 
@type varchar(10), 
@grade decimal(5,2)

AS
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM InstructorTeachCourse 
WHERE instId=@instId AND cid=@cid

  IF @FOUND='NO'
    PRINT 'This instructor does not teach this course'
  ELSE
    UPDATE StudentTakeAssignement
	SET Grade=@grade 
	WHERE 
	sid=@sid 
	AND cid=@cid 
	AND assignmentNumber=@assignmentNumber 
	AND assignmentType=@type

GO 
CREATE PROC ViewFeedbacksAddedByStudentsOnMyCourse
@instrId int, 
@cid int

AS
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM InstructorTeachCourse 
WHERE instId=@instrId AND cid=@cid

  IF @FOUND='NO'
    PRINT 'This instructor does not teach this course'
  ELSE
	SELECT number, comments, numberOfLikes
	FROM Feedback
	WHERE cid=@cid

GO 
CREATE PROC calculateFinalGrade
@cid int , 
@sid int , 
@insId int

AS
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM StudentTakeCourse 
WHERE instId=@insId AND cid=@cid AND sid=@sid

  IF @FOUND='NO'
    PRINT 'False Assignment'
  ELSE
DECLARE @finalGrade DECIMAL(10,2)
SELECT @finalGrade=sum((STA.Grade/A.fullGrade)*A.weight)
FROM StudentTakeAssignement STA INNER JOIN Assignment A ON STA.cid=A.cid AND STA.assignmentNumber=A.number
WHERE STA.sid=@sid


UPDATE StudentTakeCourse 
SET grade=@finalGrade WHERE sid=@sid and cid=@cid and instId=@insId and grade is null

 
GO 
CREATE PROC InstructorIssueCertificateToStudent

@cid int , 
@sid int , 
@insId int,
@issueDate datetime

AS
DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM StudentTakeCourse 
WHERE cid=@cid AND sid=@sid AND instId=@insId AND grade IS NOT NULL

  IF @FOUND='NO'
    PRINT 'Not completed yet/or this student doesnt take this course'
  ELSE
INSERT INTO StudentCertifyCourse 
VALUES (@cid, @sid, @issueDate)


GO 
create proc viewMyProfile 
@id int	
As

DECLARE @FOUND VARCHAR(50)
SET @FOUND='NO'

SELECT @FOUND='YES'
FROM Student
WHERE id=@id

  IF @FOUND='NO'
    PRINT 'Not registered'
  ELSE
  select * 
  From student s inner join Users u on s.id=u.id
  where s.id=@id 

GO 
create proc editMyProfile
@id int, 
@firstName varchar(10), 
@lastName varchar(10), 
@password varchar(10), 
@gender binary,
@email varchar(10), 
@address varchar(10)

As

if @firstName is not null
update users 
 set firstName=@firstName 
 where id=@id

 if @lastName is not null
update users 
set lastName=@lastname 
where id=@id

if @password is not null
update users 
set Password=@password
where id=@id

if @gender is not null
update users 
set	gender=@gender 
where id=@id
	
if @email is not null
update users 	
set	email=@email 
where id=@id

if @address is not null
update users 
set Address=@address
where id=@id

GO 
create proc availableCourses

As

select name
from course
where accepted=1

GO 
create proc courseInformation
@Id int 

As

select C.id, creditHours, C.name, C.courseDescription, C.price, C.content, C.adminId, C.instructorId, C.accepted, U.firstName, U.lastName
from Course C inner join users U on C.instructorId=U.id
where C.id=@Id

GO 
create proc  enrollInCourse
@sid INT,
@cid INT,
@instr int

As
DECLARE @Found BIT
SET @Found=0

SELECT @Found=1
FROM InstructorTeachCourse
WHERE cid=@cid AND instId=@instr

IF @Found=0
 PRINT 'This instructor does not teach this course'
ELSE
 insert into StudentTakeCourse (sid, cid, instId)
 values (@sid, @cid, @instr)

GO 
create proc addCreditCard
@sid int,
@number varchar(15),
@cardHolderName varchar(16),
@expiryDate datetime, 
@cvv varchar(3)

As
DECLARE @Found BIT
SET @Found=0

SELECT @Found=1
FROM student
WHERE id=@sid

IF @Found=0
 PRINT 'This student is not registered'
ELSE
insert into creditCard 
values (@number, @cardHolderName, @expiryDate, @cvv)

insert into StudentAddCreditCard
values (@sid, @number)

GO 
create proc viewPromocode
@sid int

As

select pc.code, issueDate, expiryDate, discountAmount, adminID
from StudentHasPromocode shp inner join Promocode pc on shp.code=pc.code
where shp.sid=@sid

GO 
create proc payCourse
@cid int,
@sid int

As
DECLARE @Found BIT
SET @Found=0

SELECT @Found=1
FROM StudentTakeCourse
WHERE sid=@sid and cid=@cid

IF @Found=0
 PRINT 'This student not enrolled in this course'
ELSE
update StudentTakeCourse
set payedFor=1 where sid=@sid and cid=@cid

GO 
CREATE PROC enrollInCourseViewContent
@id int, 
@cid int

AS 
DECLARE @Found BIT
SET @Found=0

SELECT @Found=1
FROM StudentTakeCourse
WHERE sid=@id and cid=@cid

IF @Found=0
 PRINT 'This student not enrolled in this course'
ELSE

SELECT id, creditHours, name, courseDescription, price, content
FROM Course 
WHERE id=@cid

GO 
CREATE PROC viewAssign
@courseId int, 
@Sid VARCHAR(10) 

AS
Declare @studentID INT
set @studentID=PARSE(@Sid as int);

SELECT A.cid, A.number, A.type, A.fullGrade, A.weight, A.deadline,A.content
FROM Assignment A INNER JOIN StudentTakeAssignement STA ON A.cid=STA.cid
WHERE STA.cid=@courseId AND STA.sid=@studentID; 
 



GO  
CREATE PROC submitAssign
@assignType VARCHAR(10),
@assignnumber int,
@sid INT, 
@cid INT

AS
DECLARE @Found BIT
SET @Found=0

SELECT @Found=1
FROM StudentTakeCourse
WHERE sid=@sid and cid=@cid

IF @Found=0
 PRINT 'This student not enrolled in this course'
ELSE

INSERT INTO StudentTakeAssignment (sid, cid, assignmentNumber, assignmentType)
VALUES(@sid, @cid, @assignnumber, @assignType)

GO 
CREATE PROC viewAssignGrades
@assignnumber int,
@assignType VARCHAR(10),
@cid INT,
@sid INT,
@assignGrade INT OUTPUT

AS
SELECT @assignGrade=grade
From StudentTakeAssignment
WHERE sid=@sid and cid=@cid and assignmentNumber=@assignnumber and assignmentType=@assignType
PRINT @assignGrade

GO 
CREATE PROC viewFinalGrade
@cid INT,
@sid INT,
@finalgrade decimal(10,2) output

AS

SELECT @finalgrade=grade
FROM StudentTakeCourse
WHERE cid=@cid and sid=@sid
print @finalgrade

GO 
CREATE PROC addFeedback
@comment VARCHAR(100),
@cid INT,
@sid INT

AS
DECLARE @Result VARCHAR(50)
SELECT @Result='YES'
FROM StudentTakeCourse
WHERE sid=@sid AND cid=@cid

IF @Result='YES'
INSERT INTO Feedback (cid, comments, sid)
VALUES (@cid, @comment, @sid)
ELSE 
PRINT 'Student Not Enrolled in this course'

GO 
CREATE PROC rateInstructor
@rate DECIMAL (2,1), 
@sid INT,
@insid INT


AS
DECLARE @result VARCHAR(50)
SELECT @result='YES'
FROM StudentTakeCourse
WHERE sid=@sid AND instId=@insid

IF @result='YES'
INSERT INTO StudentRateInstructor
VALUES (@sid, @insid, @rate)
ELSE 
PRINT 'This Student not assigned to that insrtuctor'

GO 
CREATE PROC viewCertificate
@cid INT,
@sid INT


AS
DECLARE @result BIT
SELECT @result=1
FROM StudentTakeCourse
WHERE sid=@sid AND cid=@cid AND grade IS NOT NULL

IF @result=1
SELECT *
FROM StudentCertifyCourse
ELSE
PRINT 'Course not yet finished'
