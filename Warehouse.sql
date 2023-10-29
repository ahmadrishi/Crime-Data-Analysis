CREATE DATABASE crimes;

use crimes;


CREATE TABLE DIM_STATUS(
statusID varchar(2) primary key,
statusDesc varchar(128)
);

CREATE TABLE DIM_PREMIS(
premisID int primary key,
premisDesc varchar(128)
);

CREATE TABLE DIM_WEAPONS(
weaponID int primary key,
weaponDesc varchar(128)
);

CREATE TABLE VICT_DESCENT(
id int primary key,
victDescent varchar(32)
);

CREATE TABLE DIM_VICTUMS(
caseNumber int primary key,
VictAge int,
VictDescent int,
VictSex char(1) NOT NULL,
foreign key(VictDescent) references VICT_DESCENT(id)
);

CREATE TABLE DIM_TIME(
caseNumber int primary key,
DateReport Date,
DateOcc Date,
TimeOcc Time
);

CREATE TABLE DIM_AREA(
areaID int primary key,
areaName varchar(128)
);

CREATE TABLE DIM_LOCATION(
areaID int,
location varchar(128) UNIQUE,
LON double,
LAT double,
foreign key(areaID) references DIM_AREA(areaID)
);

CREATE TABLE DIM_CRIMES(
crimeID int primary key,
crimeDesc varchar(128)
);

CREATE TABLE FACTS(
areaID int,
crimeID int,
caseNumber int unique,
premisID int,
statusID varchar(2),
weaponID int,
foreign key(areaID) references DIM_AREA(areaID),
foreign key(crimeID) references DIM_CRIMES(crimeID),
foreign key(caseNumber) references DIM_VICTUMS(caseNumber),
foreign key(caseNumber) references DIM_TIME(caseNumber),
foreign key(premisID) references DIM_PREMIS(premisID),
foreign key(statusID) references DIM_STATUS(statusID),
foreign key(weaponID) references DIM_WEAPONS(weaponID)
);
