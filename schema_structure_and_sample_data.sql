create table item_dim(
	item_key integer,
	item_code varchar(10),
	item_name varchar(100),
	eff_bgn_dt date,
	eff_end_dt date
);

insert into item_dim values(2024010101,'ICVBO01','BrandOne Vanilla Ice Cream','2024-01-01','9999-12-31');
insert into item_dim values(2024010102,'ICVBT01','BrandTwo Vannila Ice Cream','2024-01-01','9999-12-31');
insert into item_dim values(2024010103,'ICDCBT01','BrandTwo Dark Chocolate Ice Cream','2024-01-01','9999-12-31');
insert into item_dim values(2024010104,'ICCCT01','BrandOne Chaco Chip Ice Cream','2024-01-15','9999-12-31');

select * from item_dim;


create table location_dim(
	location_key integer,
	location_code varchar(20),
	location_name varchar(100),
	country_name varchar(100),
	zip_code varchar(20)
);

insert into location_dim values(20240101,'LOCC1L1','Location One','Country1','ZIP001');
insert into location_dim values(20240102,'LOCC1L2','Location Two','Country1','ZIP002');
insert into location_dim values(20240103,'LOCC2L1','Location L1C2','Country2','ZIP005');


create table stock_point_dim(
	 stock_point_key integer,
	 stock_point_code varchar(10),
	 stock_point_name varchar(100),
	 stock_point_location varchar(100),
	 stock_point_address varchar(100),
	 stock_point_country varchar(30),
	 stock_point_zip_code varchar(20)
);


insert into stock_point_dim values(101,'SPC1L101','Stock Point One','Location One','Address SP1','Country1','ZIP001');
insert into stock_point_dim values(102,'SPC1L201','Stock Point Two','Location Two','Address SP2','Country1','ZIP002');


create table customer_dim(
	customer_key integer,
	customer_name varchar(70),
	customer_email varchar(30),
	customer_location varchar(50),
	customer_address varchar(100),
	customer_country varchar(30),
	customer_zip_code varchar(20),
	eff_bgn_dt date,
	eff_end_dt date
);

insert into customer_dim values(10001,'C1 Groceries','c1groceries@c1.com','Location One','Customer Address 1','Country1','ZIP001','2022-05-01','9999-12-31');
insert into customer_dim values(10002,'C2 Panshop','c2panshop@c2pan.com','Location One','Customer Address 2','Country1','ZIP001','2023-06-01','9999-12-31');
insert into customer_dim values(10003,'C3 Restaurant','c3restaurant@c3res.com','Location One','Customer Address 3','Country1','ZIP001','2020-03-13','9999-12-31');
insert into customer_dim values(10004,'C4 Panshop','c4panshop@c4pan.com','Location Two','Customer Address 4','Country1','ZIP002','2021-02-01','9999-12-31');
insert into customer_dim values(10005,'C5 Groceries','c5groceries@c5groc.com','Location Two','Customer Address 5','Country1','ZIP002','2022-06-01','9999-12-31');

drop table sales_fact

create table sales_fact(
  location_key integer,
  stock_point_key integer,
  customer_key integer,
  order_number varchar(10),	
  item_key integer,
  item_code varchar(10),
  item_name varchar(100),
  purchase_date date,
  purchase_qty int,
  purchase_amount decimal	
);


insert into sales_fact values(20240101,101,10001,'PO1',2024010101,'ICVBO01','BrandOne Vanilla Ice Cream','2024-01-03',5,500);
insert into sales_fact values(20240101,101,10001,'PO1',2024010102,'ICVBT01','BrandTwo Vannila Ice Cream','2024-01-03',7,650);
insert into sales_fact values(20240102,102,10004,'PO-1-2',null,'ICVBT01',null,'2024-01-05',9,800);
insert into sales_fact values(20240101,101,10002,'PO2',null,null,'BrandOne Chaco Chip Ice Cream','2024-01-21',11,750);
insert into sales_fact values(20240102,102,10005,'PO-5-2',2024010103,null,null,'2024-01-18',13,1100);