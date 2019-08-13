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
('North', 'Tour of wineries and outlets of the Bendigo and Castlemaine region'),
('South', 'Tour of whiskey distilleries'),
('East', 'Tour of breweries'),
('West', 'Pub Crawl');

insert into client (clientId, surname, givenName, gender) values
(1, 'Price', 'Taylor', 'M'),
(2, 'Poppins', 'Mary', 'F'),
(3, 'Williams', 'Robin', 'M'),
(6345123, 'Romig', 'Mark', 'M');

insert into event (tourName, eventYear, eventMonth, eventDay, eventFee) values
('North', 2016, 'Jan', 9, 200),
('South', 2016, 'Feb', 14, 150),
('East', 2016, 'Jan', 28, 185),
('West', 2016, 'Mar', 3, 150);

insert into booking (clientId, tourName, eventYear, eventMonth, eventDay, dateBooked, payment) values
(1, 'North', 2016, 'Jan', 9, '2015-12-10', 200),
(2, 'South', 2016, 'Feb', 14, '2015-12-18', 150),
(3, 'East', 2016, 'Jan', 28, '2015-12-29', 185),
(6345123, 'West', 2016, 'Mar', 3, '2016-01-20', 150);

-- SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
-- FROM INFORMATION_SCHEMA.TABLES
-- GO

-- SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
-- FROM INFORMATION_SCHEMA.TABLES
-- where table_name in ('tour', 'client', 'event', 'booking')
-- GO