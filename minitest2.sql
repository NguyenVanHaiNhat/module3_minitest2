drop database if exists QuanLiDuLich;
create database if not exists QuanLiDuLich;

use QuanLiDuLich;

create table categorytour(
id int auto_increment primary key,
categoryCode varchar(255) not null,
categoryName varchar(255) not null
);	

create table city(
id int auto_increment primary key,
cityName varchar(255)
);

create table destination(
id int auto_increment primary key,
destinationName varchar(255) not null,
describes varchar(255) not null,
cost int,
city_id int not null unique,
foreign key (city_id) references city(id)
);

create table tour(
id int auto_increment primary key,
tourCode varchar(255),
category_id int,
destination_id int,
dateStart date not null,
dateEnd date not null,
foreign key (category_id) references categorytour(id),
foreign key (destination_id) references destination(id)
);

create table clients(
id int auto_increment primary key,
nameClient varchar(255) not null,
idNumber varchar(255) not null,
dateBirth date,
city_id int,
foreign key (city_id) references city(id)
);

create table ordertour(
id int auto_increment primary key,
tour_id int not null,
clients_id int not null,
statuss varchar(255),
foreign key (tour_id) references tour(id),
foreign key (clients_id) references clients(id)
);

SELECT * FROM quanlidulich.city;

insert into quanlidulich.city (cityName) value
('Quảng Nam'),
('Đà Nẵng'),
('Quảng Trị'),
('Hà Nội'),
('Bình Dương');

SELECT * FROM quanlidulich.categorytour;

insert into quanlidulich.categorytour (categoryCode, categoryName) value 
('S1', 'Normal'),
('S2', 'Vip');

SELECT * FROM quanlidulich.destination;

insert into quanlidulich.destination (destinationName, describes, cost, city_id) value
('Hội An', 'đẹp', 100000, 1),
('Cầu rồng', 'xấu', 150000, 2),
('Thành cổ', 'Quá đẹp', 200000, 3),
('Lăng Chủ tịch Hồ Chí Minh', 'thiêng liêng', 350000, 4),
('Độc lạ Bình Dương', 'Lú như cú', 10000, 5);

SELECT * FROM quanlidulich.clients;

insert into quanlidulich.clients (nameClient, idNumber, dateBirth, city_id) value
('Nguyễn Văn Hải Nhật', '045203000885', '2003-10-22', 3),
('Huỳnh Trần Thanh Dụng', '159357654852', '1994-09-15', 1),
('Nguyễn trúc vi', '147258369213', '2005-11-16', 2),
('Nguyễn Văn Ánh', '125468359425', '1998-12-12', 4),
('Nguyễn Quốc Phú', '256558756542', '1999-05-13', 5),
('Lương Văn Đạt', '785252544554', '2000-10-06', 2),
('Nguyễn Minh Phương', '554453255865', '2000-08-12', 3),
('Lê Đăng Pháp', '652584453587', '1998-01-11', 1),
('Nguyễn Đình Thống', '565312778682', '1993-02-25', 5),
('Phan Quyết Thắng', '122355521358', '1999-03-29', 5);

SELECT * FROM quanlidulich.tour;

insert into quanlidulich.tour (tourCode, category_id, destination_id, dateStart, dateEnd) value
('ST1', 1, 2, '2020-03-12', '2020-03-26'),
('ST2', 2, 4, '2020-03-13', '2020-04-12'),
('ST3', 1, 5, '2020-03-02', '2020-04-03'),
('ST4', 2, 2, '2020-12-12', '2020-12-26'),
('ST5', 1, 3, '2020-05-12', '2020-06-26'),
('ST6', 2, 1, '2020-05-02', '2020-07-26'),
('ST7', 1, 2, '2020-03-12', '2020-03-19'),
('ST8', 2, 1, '2020-03-12', '2020-06-25'),
('ST9', 1, 3, '2020-03-12', '2020-12-26'),
('ST10', 2, 5, '2020-03-12', '2021-03-12'),
('ST11', 1, 4, '2020-04-12', '2020-04-26'),
('ST12', 2, 3, '2020-06-12', '2020-07-25'),
('ST13', 1, 3, '2020-01-12', '2020-02-24'),
('ST14', 2, 5, '2020-03-12', '2020-04-27'),
('ST15', 1, 4, '2020-02-12', '2020-03-05');

SELECT * FROM quanlidulich.ordertour;

insert into quanlidulich.ordertour (tour_id, clients_id, statuss) value
(1, 1, '1'),
(2, 2, '1'),
(3, 3, '1'),
(4, 4, '1'),
(5, 5, '1'),
(6, 6, '1'),
(7, 7, '1'),
(8, 8, '1'),
(9, 9, '1'),
(10, 10, '1');

-- Thống kê số lượng tour của các thành phố

select cityName, destinationName, count(destination_id) as 'số lượng tour của thành phố'
from quanlidulich.destination join quanlidulich.city on destination.city_id = city.id
join quanlidulich.tour on destination.id = tour.destination_id
group by destination_id;
 
-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 ( dùng count và hàm month) 

select count(dateStart) as 'số tour bắt đầu từ tháng 3 năm 2020'
from quanlidulich.tour
where month(tour.dateStart) = 3 and year(tour.dateStart) = 2020;

-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020

select count(dateEnd) as 'số tour có ngày kết thúc trong tháng 4 năm 2020'
from quanlidulich.tour
where month(tour.dateEnd) = 4 and year(tour.dateEnd) = 2020;