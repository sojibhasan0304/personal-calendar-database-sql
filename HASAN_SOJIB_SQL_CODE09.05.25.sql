CREATE TABLE users
(
  user_ID INT NOT NULL,
  User_Email VARCHAR(50) NOT NULL,
  User_Name CHAR(50) NOT NULL,
  User_Age INT NOT NULL,
  Password VARCHAR(50) NOT NULL,
  User_Occupation_ CHAR(50) NOT NULL,
  User_address VARCHAR(100) NOT NULL,
  PRIMARY KEY (user_ID)
);

CREATE TABLE categories_of_event
(
  ID INT NOT NULL,
  name_of_event CHAR(100) NOT NULL,
  Terms_and_codtions VARCHAR(500) NOT NULL,
  type_of_Event CHAR(100) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE event
(
  event_name VARCHAR(100) NOT NULL,
  event_ID INT NOT NULL,
  event_place CHAR(100) NOT NULL,
  start_time INT NOT NULL,
  end_time INT NOT NULL,
  Event_date DATE NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (event_ID),
  FOREIGN KEY (ID) REFERENCES categories_of_event(ID)
);

CREATE TABLE reminder
(
  ID INT NOT NULL,
  Description VARCHAR(300) NOT NULL,
  Status VARCHAR(100) NOT NULL,
  user_ID INT NOT NULL,
  event_ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (user_ID) REFERENCES users(user_ID),
  FOREIGN KEY (event_ID) REFERENCES event(event_ID),
  UNIQUE (user_ID, event_ID)
);

INSERT INTO users(user_ID, User_Email,User_Name, User_Age, Password, User_Occupation_, User_address) VALUES 
(1,'JHONSON123@gmail.com','JHONSON',20,'jhonson147', 'Student','22,Gulsan');
INSERT INTO users(user_ID, User_Email,User_Name, User_Age, Password, User_Occupation_, User_address) VALUES 
(2,'SON123@gmail.com','SON',20,'son17', 'Student','20,Gulsan');
INSERT INTO users(user_ID, User_Email,User_Name, User_Age, Password, User_Occupation_, User_address) VALUES 
(3,'JHON321@gmail.com','JHON',20,'son007', 'Student','01,Danmodi');
INSERT INTO users(user_ID, User_Email,User_Name, User_Age, Password, User_Occupation_, User_address) VALUES 
(4,'SMITH222@gmail.com','SMITH',20,'SMITH770', 'Student','10,Danmodi');
INSERT INTO users(user_ID, User_Email,User_Name, User_Age, Password, User_Occupation_, User_address) VALUES 
(5,'EVA555@gmail.com','EVA',20,'EVA779', 'Student','10,Bannani');
select*from users

INSERT INTO categories_of_event(ID,name_of_event, Terms_and_codtions,type_of_Event) VALUES 
(11,'night song','FOR EVERYONE AND NO PETS ALLOW','SONG');
INSERT INTO categories_of_event(ID,name_of_event, Terms_and_codtions,type_of_Event) VALUES 
(22,'student galaday','FOR student of utb','General');
INSERT INTO categories_of_event(ID,name_of_event, Terms_and_codtions,type_of_Event) VALUES 
(33,'SCIENCE FAIR','ONLY FOR of utb FAI','EDUCATION');
INSERT INTO categories_of_event(ID,name_of_event, Terms_and_codtions,type_of_Event) VALUES 
(44,'MOVIE','FOR EVERYONE AND NO PETS ALLOW','INTERTENMENT');
select*from categories_of_event


INSERT INTO event(event_name,event_ID, event_place,start_time,end_time,Event_date,ID) VALUES 
('night song',10,'ZLIN',9,11,'2025-06-25',11);
INSERT INTO event(event_name,event_ID, event_place,start_time,end_time,Event_date,ID) VALUES 
('student galaday',20,'ZLIN',4,10,'2025-06-20',22);
INSERT INTO event(event_name,event_ID, event_place,start_time,end_time,Event_date,ID) VALUES 
('SCIENCE FAIR',30,'ZLIN',9,11,'2025-06-15',33);
INSERT INTO event(event_name,event_ID, event_place,start_time,end_time,Event_date,ID) VALUES 
('MOVIE',40,'ZLIN',9,11,'2025-05-15',44);
select*from event


INSERT INTO reminder(ID,Description, Status,user_ID,event_ID) VALUES 
(11,'YOU HAVE AN EVENT TODAY','APPROVED',1,10);
INSERT INTO reminder(ID,Description, Status,user_ID,event_ID) VALUES 
(22,'YOU HAVE AN EVENT WEEK','DISAPPROVED',2,20);
INSERT INTO reminder(ID,Description, Status,user_ID,event_ID) VALUES 
(33,'YOU HAVE AN EVENT TODAY','APPROVED',3,30);
INSERT INTO reminder(ID,Description, Status,user_ID,event_ID) VALUES 
(44,'YOU HAVE AN EVENT WEEK','APPROVED',4,40);

select*from reminder

--(1) add columns to the USERs table.
alter table users
add Birthday date
select*from users

--(2)DROP COLUMN data 
ALTER TABLE users
drop COLUMN Birthday;

select*from users

--(3) UPDATE VALUE
UPDATE users 
SET User_Age =22,
	User_Name = 'Sojib Hasan',
	User_Email = 's_hasan@utb.cz'
	where user_ID = 1
	select*from users

--(4) WHERE example
SELECT*FROM	event
where end_time = 10;

--(5) AND example
SELECT*FROM reminder
WHERE Description = 'APPROVED' AND ID = 11


--(6) OR example
SELECT * FROM users
WHERE User_Age = 20 OR User_Occupation_ = 'Student';


--(7) ORDER BY example
SELECT * FROM users
ORDER BY User_Name ASC;

-- 8 ONE MORE EXAMPLE
SELECT * FROM users
ORDER BY User_Age;

--(9)  example
select event_ID , event_place
from event
where start_time=9

--(10) Add the country column (varchar(50)) to the user table

	ALTER TABLE users
	add country varchar(50);

	select*from users

-- (11)  Insert country = 'BANGLADESH' for USERID is '1'

	update users 
	set	country = 'BANGLADESH'
	where user_ID = 1

	select*from users

update users 
	set	country = 'BANGLADESH'
	where user_ID = 3

	update users 
	set	country = 'czech republic'
	where user_ID = 2

	update users 
	set	country = 'BANGLADESH'
	where user_ID = 4

		update users 
	set	country = 'US'
	where user_ID = 5

	SELECT*FROM users

--12. List the USER name whose age is 20
	
	select User_Name , user_ID, User_Email, User_address
	from users 
	where User_Age like 20

--13 List events that last more than 2 hours
SELECT event_name, start_time, end_time, 
       (end_time - start_time) AS duration_hours
FROM event
WHERE (end_time - start_time) > 2;

--14 List all events happening in June 2025

SELECT event_name, event_place, Event_date 
FROM event 
WHERE Event_date BETWEEN '2025-06-01' AND '2025-06-30'
ORDER BY Event_date;

-- 15 Count how many users are from each country

SELECT country, COUNT(*) AS Number_of_Users
FROM users
GROUP BY country
ORDER BY Number_of_Users DESC;

-- MODIFY CODE 
-- WORK WITH VIEWS 
--User Event Summary

CREATE VIEW UserEventSummary AS
SELECT u.User_Name, u.User_Email, 
       COUNT(r.event_ID) AS Total_Events,
       SUM(CASE WHEN r.Status = 'APPROVED' THEN 1 ELSE 0 END) AS Approved_Events
FROM users u
LEFT JOIN reminder r ON u.user_ID = r.user_ID
GROUP BY u.User_Name, u.User_Email;

SELECT*FROM UserEventSummary


-- MODIFY CODE 
-- WORK WITH TRIGGERS
--Update Last Modified Date

--colum add
ALTER TABLE event
ADD last_modified DATETIME DEFAULT GETDATE();

select*from event

-- new trigger 

CREATE TRIGGER UpdateEventModifiedDate
ON event
AFTER UPDATE
AS
BEGIN
    UPDATE event
    SET last_modified = GETDATE()
    WHERE event_ID IN (SELECT event_ID FROM inserted)
END;

-- now it's test
-- like upadte a data in table 

UPDATE event 
SET event_place = 'New Location' 
WHERE event_ID = 10;

-- is it true or not 

SELECT event_ID, event_name, last_modified 
FROM event 
WHERE event_ID = 10;


--STORED PROCEDURES
--Get User's Monthly Events

CREATE PROCEDURE GetUserMonthlyEvents
    @UserID INT,
    @Month INT,
    @Year INT
AS
BEGIN
    SELECT e.event_name, e.Event_date, e.start_time, e.end_time, 
           c.type_of_Event, r.Status
    FROM event e
    JOIN reminder r ON e.event_ID = r.event_ID
    JOIN categories_of_event c ON e.ID = c.ID
    WHERE r.user_ID = @UserID
      AND MONTH(e.Event_date) = @Month
      AND YEAR(e.Event_date) = @Year
    ORDER BY e.Event_date, e.start_time;
END;
SELECT*FROM reminder
EXEC GetUserMonthlyEvents 1, 6, 2025;

--FUNCTIONS
--Calculate Event Duration in Hours

CREATE FUNCTION CalculateEventDuration(@EventID INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Duration DECIMAL(5,2);
    
    SELECT @Duration = (end_time - start_time) / 100.0
    FROM event
    WHERE event_ID = @EventID;
    
    RETURN @Duration;
END;

select*from event

SELECT dbo.CalculateEventDuration(10) AS 'Duration (Hours)';





-- FINISH