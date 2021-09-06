create database Mock_Project
go

use Mock_Project
begin
create table employee(
employeeId bigint primary key identity(1,1),
account varchar(50) not null,
department varchar(50) not null,
employeeAddress varchar(50),
employeeBirthdate date not null,
employeeEmail varchar(50),
employeeName varchar(50) not null,
employeePhone varchar(10) not null,
password varchar(20) not null,
sex varchar(1) not null check(sex='M' or sex='F')
);

create table parkinglot(
parkId bigint primary key identity(1,1),
parkArea bigint not null,
parkName varchar(50) not null,
parkPlace varchar(11) not null,
parkPrice bigint not null,
parkStatus varchar(50)
);

create table car(
licensePlate varchar(50) primary key not null,
carColor varchar(11),
carType varchar(50),
company varchar(50) not null,
parkId bigint foreign key references parkinglot(parkId)
);

create table trip(
tripId bigint primary key identity(1,1),
bookedTicketNumber int,
carType varchar(11) not null,
departureDate date not null,
departureTime time not null,
destination varchar(50) not null,
driver varchar(11) not null,
maximumOnlineTicketNumber int not null
);

create table bookingoffice(
officeId bigint primary key identity(1,1),
endContractDeadline date not null,
officeName varchar(50) not null,
officePhone varchar(11) not null,
officePlace varchar(50) not null,
officePrice bigint not null,
startContractDeadline date not null,
tripId bigint foreign key references trip(tripId)
);

create table ticket(
ticketId bigint primary key identity(1,1),
bookingTime time,
customerName varchar(11),
licensePlate varchar(50) foreign key references car(licensePlate),
tripId bigint foreign key references trip(tripId)
);
end