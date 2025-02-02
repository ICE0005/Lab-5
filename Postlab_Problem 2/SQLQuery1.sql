-- Dropping existing tables if they exist
DROP TABLE IF EXISTS GUIDE;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS RESERVATION;
DROP TABLE IF EXISTS TRIP;
DROP TABLE IF EXISTS TRIP_GUIDES;
DROP TABLE IF EXISTS PARTICIPANT;
DROP TABLE IF EXISTS ADVENTURE_CLASS;
DROP TABLE IF EXISTS PARTICIPANT_CLASS;

-- Creating GUIDE table
CREATE TABLE GUIDE
(
    GUIDE_NUM CHAR(4) PRIMARY KEY,
    LAST_NAME CHAR(15),
    FIRST_NAME CHAR(15),
    ADDRESS CHAR(25),
    CITY CHAR(25),
    STATE CHAR(2),
    POSTAL_CODE CHAR(5),
    PHONE_NUM CHAR(12),
    HIRE_DATE DATE 
);

-- Creating CUSTOMER table
CREATE TABLE CUSTOMER
(
    CUSTOMER_NUM CHAR(4) PRIMARY KEY,
    LAST_NAME CHAR(30) NOT NULL,
    FIRST_NAME CHAR (30),
    ADDRESS CHAR(35),
    CITY CHAR(35),
    STATE CHAR(2),
    POSTAL_CODE CHAR(5),
    PHONE CHAR(12) 
);

-- Creating RESERVATION table
CREATE TABLE RESERVATION
(
    RESERVATION_ID CHAR(7) PRIMARY KEY,
    TRIP_ID DECIMAL(3,0),
    TRIP_DATE DATE,
    NUM_PERSONS DECIMAL(3,0),
    TRIP_PRICE DECIMAL(6,2),
    OTHER_FEES DECIMAL(6,2),
    CUSTOMER_NUM CHAR(4) 
);

-- Creating TRIP table
CREATE TABLE TRIP
(
    TRIP_ID DECIMAL(3,0) PRIMARY KEY,
    TRIP_NAME CHAR(75),
    START_LOCATION CHAR(50),
    STATE CHAR(2),
    DISTANCE DECIMAL(4,0),
    MAX_GRP_SIZE DECIMAL(4,0),
    TYPE CHAR(20),
    SEASON CHAR(20) 
);

-- Creating TRIP_GUIDES table
CREATE TABLE TRIP_GUIDES
(
    TRIP_ID DECIMAL(3,0),
    GUIDE_NUM CHAR(4),
    PRIMARY KEY (TRIP_ID, GUIDE_NUM) 
);

-- Creating PARTICIPANT table
CREATE TABLE PARTICIPANT
(
    PARTICIPANT_NUM CHAR(4) PRIMARY KEY,
    LAST_NAME CHAR(30),
    FIRST_NAME CHAR(30),
    ADDRESS CHAR(35),
    CITY CHAR(35),
    STATE CHAR(2),
    POSTAL_CODE CHAR(5),
    PHONE CHAR(12),
    DATE_OF_BIRTH DATE 
);

-- Creating ADVENTURE_CLASS table
CREATE TABLE ADVENTURE_CLASS
(
    CLASS_NUM CHAR(4) PRIMARY KEY,
    CLASS_DESC CHAR(100),
    MAX_PEOPLE DECIMAL(3,0),
    CLASS_FEE DECIMAL(6,2)
);

-- Creating PARTICIPANT_CLASS table
CREATE TABLE PARTICIPANT_CLASS
(
    PARTICIPANT_NUM CHAR(4),
    CLASS_NUM CHAR(4),
    CLASS_DATE DATE,
    PRIMARY KEY (PARTICIPANT_NUM, CLASS_NUM, CLASS_DATE),
    FOREIGN KEY (PARTICIPANT_NUM) REFERENCES PARTICIPANT(PARTICIPANT_NUM),
    FOREIGN KEY (CLASS_NUM) REFERENCES ADVENTURE_CLASS(CLASS_NUM)
);

-- Inserting data into GUIDE table
INSERT INTO GUIDE VALUES ('AM01','Abrams','Miles','54 Quest Ave.','Williamsburg','MA','01096','617-555-6032','2012-06-03');
INSERT INTO GUIDE VALUES ('BR01','Boyers','Rita','140 Oakton Rd.','Jaffrey','NH','03452','603-555-2134','2012-03-04');
INSERT INTO GUIDE VALUES ('DH01','Devon','Harley','25 Old Ranch Rd.','Sunderland','MA','01375','781-555-7767','2012-01-08');
INSERT INTO GUIDE VALUES ('GZ01','Gregory','Zach','7 Moose Head Rd.','Dummer','NH','03588','603-555-8765','2012-11-04');
INSERT INTO GUIDE VALUES ('KS01','Kiley','Susan','943 Oakton Rd.','Jaffrey','NH','03452','603-555-1230','2013-04-08');
INSERT INTO GUIDE VALUES ('KS02','Kelly','Sam','9 Congaree Ave.','Fraconia','NH','03580','603-555-0003','2013-06-10');
INSERT INTO GUIDE VALUES ('MR01','Marston','Ray','24 Shenandoah Rd.','Springfield','MA','01101','781-555-2323','2015-09-14');
INSERT INTO GUIDE VALUES ('RH01','Rowan','Hal','12 Heather Rd.','Mount Desert','ME','04660','207-555-9009','2014-06-02');
INSERT INTO GUIDE VALUES ('SL01','Stevens','Lori','15 Riverton Rd.','Coventry','VT','05825','802-555-3339','2014-09-05');
INSERT INTO GUIDE VALUES ('UG01','Unser','Glory','342 Pineview St.','Danbury','CT','06810','203-555-8534','2015-02-02');

-- Inserting data into CUSTOMER table
INSERT INTO CUSTOMER VALUES ('101','Northfold','Liam','9 Old Mill Rd.','Londonderry','NH','03053','603-555-7563');
INSERT INTO CUSTOMER VALUES ('102','Ocean','Arnold','2332 South St. Apt 3','Springfield','MA','01101','413-555-3212');
INSERT INTO CUSTOMER VALUES ('103','Kasuma','Sujata','132 Main St. #1','East Hartford','CT','06108','860-555-0703');
INSERT INTO CUSTOMER VALUES ('104','Goff','Ryan','164A South Bend Rd.','Lowell','MA','01854','781-555-8423');
INSERT INTO CUSTOMER VALUES ('105','McLean','Kyle','345 Lower Ave.','Wolcott','NY','14590','585-555-5321');
INSERT INTO CUSTOMER VALUES ('106','Morontoia','Joseph','156 Scholar St.','Johnston','RI','02919','401-555-4848');
INSERT INTO CUSTOMER VALUES ('107','Marchand','Quinn','76 Cross Rd.','Bath','NH','03740','603-555-0456');
INSERT INTO CUSTOMER VALUES ('108','Rulf','Uschi','32 Sheep Stop St.','Edinboro','PA','16412','814-555-5521');
INSERT INTO CUSTOMER VALUES ('109','Caron','Jean Luc','10 Greenfield St.','Rome','ME','04963','207-555-9643');
INSERT INTO CUSTOMER VALUES ('110','Bers','Martha','65 Granite St.','York','NY','14592','585-555-0111');
INSERT INTO CUSTOMER VALUES ('112','Jones','Laura','373 Highland Ave.','Somerville','MA','02143','857-555-6258');
INSERT INTO CUSTOMER VALUES ('115','Vaccari','Adam','1282 Ocean Walk','Ocean CITY','NJ','08226','609-555-5231');
INSERT INTO CUSTOMER VALUES ('116','Murakami','Iris','7 Cherry Blossom St.','Weymouth','MA','02188','617-555-6665');
INSERT INTO CUSTOMER VALUES ('119','Chau','Clement','18 Ark Ledge Ln.','Londonderry','VT','05148','802-555-3096');
INSERT INTO CUSTOMER VALUES ('120','Gernowski','Sadie','24 Stump Rd.','Athens','ME','04912','207-555-4507');
INSERT INTO CUSTOMER VALUES ('121','Bretton-Borak','Siam','10 Old Main St.','Cambridge','VT','05444','802-555-3443');
INSERT INTO CUSTOMER VALUES ('122','Hefferson','Orlagh','132 South St. Apt 27','Manchester','NH','03101','603-555-3476');
INSERT INTO CUSTOMER VALUES ('123','Barnett','Larry','25 Stag Rd.','Fairfield','CT','06824','860-555-9876');
INSERT INTO CUSTOMER VALUES ('124','Busa','Karen','12 Foster St.','South Windsor','CT','06074','857-555-5532');
INSERT INTO CUSTOMER VALUES ('125','Peterson','Becca','51 Fredrick St.','Albion','NY','14411','585-555-0900');
INSERT INTO CUSTOMER VALUES ('126','Brown','Brianne','154 Central St.','Vernon','CT','06066','860-555-3234');

-- Inserting data into RESERVATION table
INSERT INTO RESERVATION VALUES ('1600001',40,'2016-03-26',2,55.00,0.00,'101');
INSERT INTO RESERVATION VALUES ('1600002',21,'2016-06-08',2,95.00,0.00,'101');
INSERT INTO RESERVATION VALUES ('1600003',28,'2016-09-12',1,35.00,0.00,'103');
INSERT INTO RESERVATION VALUES ('1600004',26,'2016-10-16',4,45.00,15.00,'104');
INSERT INTO RESERVATION VALUES ('1600005',39,'2016-06-25',5,55.00,0.00,'105');
INSERT INTO RESERVATION VALUES ('1600006',32,'2016-06-18',1,65.00,0.00,'106');
INSERT INTO RESERVATION VALUES ('1600007',29,'2016-05-03',2,110.00,10.00,'107');
INSERT INTO RESERVATION VALUES ('1600008',33,'2016-07-19',2,80.00,5.00,'108');
INSERT INTO RESERVATION VALUES ('1600009',22,'2016-06-01',2,50.00,0.00,'109');
INSERT INTO RESERVATION VALUES ('1600010',25,'2016-10-19',1,75.00,0.00,'110');
INSERT INTO RESERVATION VALUES ('1600011',31,'2016-06-04',1,85.00,15.00,'112');
INSERT INTO RESERVATION VALUES ('1600012',38,'2016-03-16',2,55.00,0.00,'115');
INSERT INTO RESERVATION VALUES ('1600013',30,'2016-04-05',2,95.00,10.00,'116');
INSERT INTO RESERVATION VALUES ('1600014',27,'2016-04-20',4,65.00,5.00,'119');
INSERT INTO RESERVATION VALUES ('1600015',37,'2016-06-29',3,75.00,0.00,'120');
INSERT INTO RESERVATION VALUES ('1600016',35,'2016-05-05',1,85.00,5.00,'121');
INSERT INTO RESERVATION VALUES ('1600017',36,'2016-09-09',1,65.00,0.00,'122');
INSERT INTO RESERVATION VALUES ('1600018',34,'2016-08-22',1,75.00,10.00,'123');
INSERT INTO RESERVATION VALUES ('1600019',20,'2016-09-12',1,35.00,0.00,'124');
INSERT INTO RESERVATION VALUES ('1600020',23,'2016-09-12',2,55.00,5.00,'125');
INSERT INTO RESERVATION VALUES ('1600021',24,'2016-11-15',3,65.00,15.00,'126');

-- Inserting data into TRIP table
INSERT INTO TRIP VALUES (20,'Biking- South River Falls','South River Falls','VA',10,10,'Biking','Spring');
INSERT INTO TRIP VALUES (21,'Boating- Dalehead Lake','Dalehead Lake','PA',15,6,'Boating','Summer');
INSERT INTO TRIP VALUES (22,'Biking- West Hale','West Hale','VT',12,8,'Biking','Summer');
INSERT INTO TRIP VALUES (23,'Hiking- Mount Ascutney','Mount Ascutney','VT',8,12,'Hiking','Spring');
INSERT INTO TRIP VALUES (24,'Hiking- Mount Snow','Mount Snow','VT',15,8,'Hiking','Fall');
INSERT INTO TRIP VALUES (25,'Camping- Silver Lake','Silver Lake','NH',5,15,'Camping','Fall');
INSERT INTO TRIP VALUES (26,'Rafting- Rapids of Kent','Rapids of Kent','CT',12,6,'Rafting','Fall');
INSERT INTO TRIP VALUES (27,'Hiking- Tully Mountain','Tully Mountain','MA',6,10,'Hiking','Spring');
INSERT INTO TRIP VALUES (28,'Biking- Cape Cod Rail Trail','Cape Cod Rail Trail','MA',10,10,'Biking','Spring');
INSERT INTO TRIP VALUES (29,'Camping- Bass River State Forest','Bass River State Forest','NJ',15,10,'Camping','Spring');
INSERT INTO TRIP VALUES (30,'Rafting- Red River Gorge','Red River Gorge','KY',10,8,'Rafting','Spring');
INSERT INTO TRIP VALUES (31,'Boating- Tall Pines','Tall Pines','ME',8,10,'Boating','Summer');
INSERT INTO TRIP VALUES (32,'Boating- Lake Onega','Lake Onega','ME',15,10,'Boating','Summer');
INSERT INTO TRIP VALUES (33,'Camping- Lower Falls','Lower Falls','NY',12,8,'Camping','Summer');
INSERT INTO TRIP VALUES (34,'Camping- Savoy Mountain','Savoy Mountain','MA',6,6,'Camping','Summer');
INSERT INTO TRIP VALUES (35,'Biking- Heavens Peak','Heavens Peak','NH',10,12,'Biking','Summer');
INSERT INTO TRIP VALUES (36,'Biking- Upper Ridge','Upper Ridge','ME',12,10,'Biking','Summer');
INSERT INTO TRIP VALUES (37,'Camping- Otter Creek','Otter Creek','VT',15,10,'Camping','Spring');
INSERT INTO TRIP VALUES (38,'Rafting- Clear Creek','Clear Creek','OH',5,8,'Rafting','Spring');
INSERT INTO TRIP VALUES (39,'Rafting- Seven Hills','Seven Hills','OH',8,10,'Rafting','Summer');
INSERT INTO TRIP VALUES (40,'Boating- Whispering Pines','Whispering Pines','NH',15,12,'Boating','Spring');

-- Inserting data into TRIP_GUIDES table
INSERT INTO TRIP_GUIDES VALUES (20,'SL01');
INSERT INTO TRIP_GUIDES VALUES (21,'KS01');
INSERT INTO TRIP_GUIDES VALUES (21,'MR01');
INSERT INTO TRIP_GUIDES VALUES (22,'KS02');
INSERT INTO TRIP_GUIDES VALUES (22,'MR01');
INSERT INTO TRIP_GUIDES VALUES (23,'MR01');
INSERT INTO TRIP_GUIDES VALUES (24,'GZ01');
INSERT INTO TRIP_GUIDES VALUES (25,'MR01');
INSERT INTO TRIP_GUIDES VALUES (25,'KS01');
INSERT INTO TRIP_GUIDES VALUES (26,'MR01');
INSERT INTO TRIP_GUIDES VALUES (26,'SL01');
INSERT INTO TRIP_GUIDES VALUES (27,'AM01');
INSERT INTO TRIP_GUIDES VALUES (28,'KS01');
INSERT INTO TRIP_GUIDES VALUES (28,'BR01');
INSERT INTO TRIP_GUIDES VALUES (29,'SL01');
INSERT INTO TRIP_GUIDES VALUES (30,'KS01');
INSERT INTO TRIP_GUIDES VALUES (31,'MR01');
INSERT INTO TRIP_GUIDES VALUES (31,'KS01');
INSERT INTO TRIP_GUIDES VALUES (32,'KS01');
INSERT INTO TRIP_GUIDES VALUES (33,'KS02');
INSERT INTO TRIP_GUIDES VALUES (34,'SL01');
INSERT INTO TRIP_GUIDES VALUES (35,'KS01');
INSERT INTO TRIP_GUIDES VALUES (35,'AM01');
INSERT INTO TRIP_GUIDES VALUES (36,'KS01');
INSERT INTO TRIP_GUIDES VALUES (37,'KS02');
INSERT INTO TRIP_GUIDES VALUES (38,'MR01');
INSERT INTO TRIP_GUIDES VALUES (38,'KS01');
INSERT INTO TRIP_GUIDES VALUES (39,'KS02');
INSERT INTO TRIP_GUIDES VALUES (40,'KS01');

-- Inserting data into PARTICIPANT table
INSERT INTO PARTICIPANT VALUES ('P001', 'Smith', 'John', '123 Maple St', 'Springfield', 'MA', '01103', '413-555-1234', '1985-01-23');
INSERT INTO PARTICIPANT VALUES ('P002', 'Doe', 'Jane', '456 Elm St', 'Hartford', 'CT', '06105', '860-555-5678', '1990-07-15');

-- Inserting data into ADVENTURE_CLASS table
INSERT INTO ADVENTURE_CLASS VALUES ('C001', 'Hiking Basics', 20, 50.00);
INSERT INTO ADVENTURE_CLASS VALUES ('C002', 'Advanced Biking', 15, 75.00);

-- Inserting data into PARTICIPANT_CLASS table
INSERT INTO PARTICIPANT_CLASS VALUES ('P001', 'C001', '2023-08-15');
INSERT INTO PARTICIPANT_CLASS VALUES ('P002', 'C002', '2023-08-16');

-- Viewing data from all tables
SELECT * FROM GUIDE;
SELECT * FROM CUSTOMER;
SELECT * FROM RESERVATION;
SELECT * FROM TRIP;
SELECT * FROM TRIP_GUIDES;
SELECT * FROM PARTICIPANT;
SELECT * FROM ADVENTURE_CLASS;
SELECT * FROM PARTICIPANT_CLASS;
