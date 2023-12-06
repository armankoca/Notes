create database verterinary_hospital
go

use verterinary_hospital
go

create table veterinarians (
    diploma_no bigint identity(1, 1) primary key,
    first_name nvarchar(50) not null,
    middle_name nvarchar(50) not null,
    last_name nvarchar(50) not null,
    birthday datetime not null,
    job_start_date datetime not null
)
go

create table owners (
    owner_id bigint identity(1, 1) primary key,
    name nvarchar(100) not null,
    address nvarchar(max) not null
)
go

create table phone_types (
    phone_type_id int identity(1, 1) primary key,
    description nvarchar(max) not null
)
go

create table phones (
    phone_id bigint identity(1, 1) primary key,
    phone_type_id int foreign key references phone_types(phone_type_id) not null,
    owner_id bigint foreign key references owners(owner_id) not null,
    phone char(14) not null
)
go

create table animals(
    animal_id bigint identity(1, 1) primary key,
    owner_id bigint foreign key references owners(owner_id) not null,
    name nvarchar(100),
    birthday datetime,
    description nvarchar(max)
)
go

create table veterinarians_to_animals (
    veterinarian_to_animal_id bigint identity(1, 1) primary key,
    diploma_no bigint foreign key references veterinarians(diploma_no) not null,
    animal_id bigint foreign key references animals(animal_id) not null,
    description nvarchar(max)
)
go

create table veterinarians_to_animal_prices (
    veterinarian_to_animal_price_id bigint identity(1, 1) primary key,
    veterinarian_to_animal_id bigint foreign key references veterinarians_to_animals(veterinarian_to_animal_id) not null,
    price real check(price >= 0.0) default(0.0),
    description nvarchar(max)
)
go