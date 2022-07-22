CREATE DATABASE production
GO
USE production
GO
CREATE TABLE categories (
    category_id VARCHAR(10) PRIMARY KEY,
    category_name NVARCHAR(30) NOT NULL
)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(30) NOT NULL,
    brand_id nvarchar(10),
    category_id int,
    model_year INT NOT NULL,
    list_price money,
    FOREIGN KEY(brand_id) REFERENCES dbo.brands(brand_id),
    FOREIGN KEY(category_id) REFERENCES dbo.categories(category_id)
)
CREATE TABLE brands (
    brand_id NVARCHAR(10) PRIMARY KEY,
    brand_name NVARCHAR(30) not null
)
INSERT into categories(category_id,category_name)
VALUES  ('11',N'XE MÁY'),
        ('12',N'OTO'),
        ('13',N'BẾP ĐIỆN'),
        ('14',N'TỦ LẠNH'),
        ('15',N'TI VI'),
        ('16',N'MÁY HÚT BỤI'),
        ('17',N'NỒI CHIÊN'),
        ('18',N'ĐIỆN THOẠI'),
        ('19',N'ĐỒNG HỒ'),
        ('20',N'MÁY TÍNH');
INSERT INTO products(product_id,product_name,brand_id,category_id,model_year,list_price)
VALUES  (1,N'IPHONE 13 PROMAX','BI3','18','2017',30000000),
        (2,N'BPHONE B86','BI2','18','2016',18000000),
        (3,N'HÚP LÓT','BI5','19','2015',300000000),
        (4,N'RÔ LẾCH','BI4','19','2014',30000000),
        (5,N'HONDA CIVIC','BI3','12','2013',30000000),
        (6,N'AUDI A5','BI2','12','2013',30000000),
        (7,N'BẾP SUNHOUSE','BI4','13','2012',30000000),
        (8,N'BẾP KANGARU','BI1','13','2011',30000000),
        (9,N'SAMSUNG 49INCH','BI2','15','2010',30000000),
        (10,N'SONY 55INCH','BI1','15','2011',30000000),
        (11,N'HONDA PCX','BI5','11','2012',30000000),
        (12,N'WAVE ALPHA','BI5','11','2013',30000000),
        (13,N'LG 230L','BI4','14','2014',30000000),
        (14,N'ELECTROLUX 300L','BI4','14','2015',30000000),
        (15,N'VIỆT Á 5L','BI3','17','2016',30000000),
        (16,N'DAIKIN 3L','BI3','17','2017',30000000),
        (17,N'KAROPHI 5000W','BI2','16','2018',30000000),
        (18,N'PANASONIC 3000W','BI2','16','2019',30000000),
        (19,N'MACBOOK PRO','BI1','20','2021',30000000),
        (20,N'IMAC 2022','BI1','20','2020',30000000)

INSERT INTO brands(brand_id,brand_name)
VALUES  ('BI1','BPHONE'),
        ('BI2','HONDA'),
        ('BI3','YAMAHA'),
        ('BI4','MAZDA'),
        ('BI5','FORD')