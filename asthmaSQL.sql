create database `sql_asthma`;
show databases;
USE `sql_asthma`;
drop database `sql_asthma`;

create table `doctor`(
	`employee_ID` varchar(10) primary KEY
);
create table `nurse`(
	`employee_ID` varchar(10) primary key,
    `is_case_manager` boolean
);
create table `clinic_info.`(
	`clinic_ID` varchar(5) primary key,
    `department` varchar(15),
    `doctor` varchar(10),
    `nurse` varchar(10),
    constraint `fk_doctor_clinicinfo` foreign key (`doctor`) references `doctor`(`employee_ID`),
    constraint `fk_nurse_clinicinfo` foreign key (`nurse`) references `nurse` (`employee_ID`)
    
);

create table `patient`(
	`ID` varchar(10) primary KEY
);

-- 刪除關聯
-- alter table `enrollment` drop constraint `fk_patient_enrollment`;
-- alter table `enrollment` drop constraint `fk_casemanager_enrollment`;
-- alter table `enrollment` drop constraint `fk_doctor_enrollment`;
-- drop table `enrollment`;

create table `enrollment`(
	`enrollment_ID` varchar(10) PRIMARY KEY,
	`ID` varchar(10),
    `case_manager` varchar(10),
    `doctor` varchar(10),
	CONSTRAINT `fk_patient_enrollment` FOREIGN KEY  (`ID`) REFERENCES `patient`(`ID`),
    constraint `fk_nurse_enrollment` foreign key (`case_manager`) references `nurse`(`employee_ID`),
    constraint `fk_doctor_enrollment` foreign key (`doctor`) references `doctor`(`employee_ID`)
); 

CREATE table `tracking`(
	`track_ID` varchar(10) primary key,
    `enrollment_ID` VARCHAR(10),
    constraint `fk_enrollment_tracking`foreign key (`enrollment_ID`) references `enrollment`(`enrollment_ID`)
);
-- DROP table 	`registration`;
create table `registration`(
	`date` date ,
    `clinic_ID` varchar(10) ,
    `waiting_number` int ,
    `ID` varchar(10),
    primary key (`date`,`clinic_ID`,`ID`),
    constraint `fk_clinicinfo_registration` foreign key (`clinic_ID`) references `clinic_info.`(`clinic_ID`),
    constraint `fk_patient_registration` foreign key (`ID`) references `patient`(`ID`)
);