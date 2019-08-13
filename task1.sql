drop table if exists booking;
drop table if exists event;
drop table if exists client;
drop table if exists tour;

create table tour (
    tourName            nvarchar(100),
    tourDescription     nvarchar(500),
    primary key (tourName)
);

create table client (
    clientId            int,
    surname             nvarchar(100),
    givenName           nvarchar(100),
    gender              nvarchar(1),
    primary key (clientId)
);

create table event (
    tourName            nvarchar(100),
    eventYear           int,
    eventMonth          nvarchar(3),
    eventDay            int,
    eventFee            money,
    primary key (tourName, eventYear, eventMonth, eventDay),
    foreign key (tourName) references tour
);

create table booking (
    clientId            int,
    tourName            nvarchar(100),
    eventYear           int,
    eventMonth          nvarchar(3),
    eventDay            int,
    dateBooked          date,
    payment             money,
    primary key (clientId, tourName, eventYear, eventMonth, eventDay),
    foreign key (clientId) references client,
    foreign key (tourName, eventYear, eventMonth, eventDay) references event
);

insert into tour (tourName, tourDescription) values
('North', 'Tour of wineries and outlets of the Bendigo and Castlemaine region');

insert into client (clientId, surname, givenName, gender) values
(1, 'Price', 'Taylor', 'M'),
(6345123, 'Romig', 'Mark', 'M');

insert into event (tourName, eventYear, eventMonth, eventDay, eventFee) values
('North', 2016, 'Jan', 9, 200);

insert into booking (clientId, tourName, eventYear, eventMonth, eventDay, dateBooked, payment) values
(1, 'North', 2016, 'Jan', 9, '2015-12-10', 200);

-- SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
-- FROM INFORMATION_SCHEMA.TABLES
-- GO

-- SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
-- FROM INFORMATION_SCHEMA.TABLES
-- where table_name in ('tour', 'client', 'event', 'booking')
-- GO