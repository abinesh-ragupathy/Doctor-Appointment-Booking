
create table Doctors
(
	DocId int primary key Identity(1001,1),
	DocName varchar(Max),
	DocQualification varchar(50),
	DocExperience int NOT NULL,
	DocKnownLanguage varchar(Max),
	DocCity varchar(30),
	DocBranch varchar(50),
	DocSpecialization varchar(50) 
	
);

ALTER TABLE Doctors ADD DocImagePath VARCHAR(100);

truncate table doctors;
--navalur
insert into Doctors values('Dr Kanakarajan P', 'MBBS, MD', '50', 'English, Tamil', 'Chennai', 'ETA-Navalur', 'General Physician','~/images/navalur1.jpg');
insert into Doctors values('Dr Fayeza Quraishi', 'BDS, MBA', '7', 'English, Tamil', 'Chennai', 'ETA-Navalur', 'Dentist','~/images/navalur2.jpg');
insert into Doctors values('Dr Prabhakaran M', 'MBBS; DLO; MS', '36', 'English, Tamil', 'Chennai', 'ETA-Navalur', 'ENT Specialist','~/images/navalur3.png');
--shollinganallur
insert into Doctors values('Dr Aman Kumar', 'MBBS, MD', '29', 'English, Tamil', 'Chennai', 'Sholinganallur', 'General Physician','~/images/shollinganallur1.jpg');
insert into Doctors values('Dr Flora Banik', 'BDS', '2', 'English, Tamil', 'Chennai', 'Sholinganallur', 'Dentist','~/images/shollinganallur2.jpg');
insert into Doctors values('Dr Ganapathy H', 'MBBS, MS, DLO, MNAMS', '41', 'English, Tamil', 'Chennai', 'Sholinganallur', 'ENT Specialist','~/images/shollinganallur3.jpg');
--electronic city
insert into Doctors values('Dr Anupama S Kakade', 'MBBS, MD', '8', 'English, Kanada', 'Bangalore', 'Electronic City', 'General Physician','~/images/elecCity1.jpg');
insert into Doctors values('Dr Swapna Sri K', 'BDS', '10', 'English, Kanada', 'Bangalore', 'Electronic City', 'Dentist','~/images/elecCity2.jpg');
insert into Doctors values('Dr Farmida Aman', 'MBBS, MS', '13', 'English, Kanada', 'Bangalore', 'Electronic City', 'ENT Specialist','~/images/elecCity3.png');
--gold hill square
insert into Doctors values('Dr G B Sahoo', 'MBBS, DTCD, DIH, TOH', '44', 'English, Kanada', 'Bangalore', 'Gold Hill Square', 'General Physician','~/images/goldHill1.jpg');
insert into Doctors values('Dr Caroline Ramya M', 'BDS', '11', 'English, Kanada', 'Bangalore', 'Gold Hill Square', 'Dentist','~/images/goldHill2.png');
insert into Doctors values('Dr Nagamani Y S', 'MBBS, MS', '4', 'English, Kanada', 'Bangalore', 'Gold Hill Square', 'ENT Specialist','~/images/goldHill3.jpg');
--sector 1
insert into Doctors values('Dr Akhilesh Kumar', 'MBBS, MS', '4', 'English, Hindi', 'Noida', 'Sector 1', 'General Physician','~/images/sector1.jpg');
insert into Doctors values('Dr Tulika Diwan', 'BDS, MDS', '2', 'English, Hindi', 'Noida', 'Sector 1', 'Dentist','~/images/sector2.jpg');
insert into Doctors values('Dr Dipak Desai', 'MBBS, MS, DORL', '10', 'English, Hindi', 'Noida', 'Sector 1', 'ENT Specialist','~/images/sector3.jpg');

--sez hub sector
insert into Doctors values('Dr Rajanshu Tiwari', ' MBBS, DNB', '10', 'English, Hindi', 'Noida', 'SEZ Hub Sector', 'General Physician','~/images/hubs1.jpg');
insert into Doctors values('Dr Adosh Lall', 'BDS, MDS', '21', 'English, Hindi', 'Noida', 'SEZ Hub Sector', 'Dentist','~/images/hubs2.jpg');
insert into Doctors values('Dr Ameet Kishore', 'MBBS, FRCS', '25', 'English, Hindi', 'Noida', 'SEZ Hub Sector', 'ENT Specialist','~/images/hubs3.jpg');

select *
from Doctors;

create table dCity
(
 cId int Identity(1,1) primary key,
 cName varchar(50)
);
insert into dCity values('Chennai');
insert into dCity values('Bangalore');
insert into dCity values('Noida');
select *
from dCity;

create table dBranch
(
 bId int Identity(1,1) primary key,
 bName varchar(50),
 cId int foreign key references dCity(cId)
);
insert into dBranch values('ETA-Navalur',1);
insert into dBranch values('Sholinganallur',1);
insert into dBranch values('Electronic City',2);
insert into dBranch values('Gold Hill Square',2);
insert into dBranch values('Sector 1',3);
insert into dBranch values('SEZ Hub Sector',3);
select *
from dBranch;

create table dSpecialization
(
 specId int Identity(1,1) primary key,
 specName varchar(50)
);
insert into dSpecialization values('General Physician');
insert into dSpecialization values('Dentist');
insert into dSpecialization values('ENT Specialist');
select *
from dSpecialization;

create table doctorSlots
(
	slotId int Identity(1,1) primary key,
	doctorId int foreign key references Doctors(DocId),
	slotTimes varchar(50)
);
insert into doctorSlots values(1001,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1001,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1001,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1002,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1002,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1002,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1003,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1003,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1003,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1004,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1004,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1004,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1005,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1005,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1005,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1006,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1006,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1006,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1007,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1007,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1007,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1008,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1008,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1008,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1009,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1009,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1009,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1010,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1010,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1010,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1011,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1011,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1011,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1012,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1012,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1012,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1013,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1013,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1013,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1014,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1014,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1014,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1015,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1015,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1015,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1016,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1016,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1016,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1017,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1017,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1017,'05:00 PM - 06:00 PM');

insert into doctorSlots values(1018,'09:00 AM - 10:00 AM');
insert into doctorSlots values(1018,'11:00 AM - 12:00 PM');
insert into doctorSlots values(1018,'05:00 PM - 06:00 PM');

select * from doctorSlots;

create table AllAppointments
(
	AptId int identity(1,1) primary key,
	UserName nvarchar(256) foreign key references aspnetusers(UserName),
	DoctorId int foreign key references doctors(DocId),
	SlotDate datetime,
	Slots varchar(50)
);
truncate table allappointments;
select * from AllAppointments;
sp_help 'aspnetusers'

ALTER TABLE AllAppointments ADD DrAvailability VARCHAR(10);

SELECT table_name FROM information_schema.tables
