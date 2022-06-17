-- Lưu Khắc Đăng Dương 20205076
-- Việt Nhật 03-K65
#midterm: thuc tap CSDL
#class id: viet nhat 03-k65
#student id: 20205076
#student name: Luu Khac Dang Duong


create database duongC
go
use duongC
go

create table GiangVien
(   GV# varchar(10) primary key not null,
    HoTen nvarchar(30) not null,
	NamSinh int not null,
	DiaChi nvarchar(50) not null
	)

create table DeTai
(   DT# varchar(10) primary key not null,
    TenDT nvarchar(50) not null,
	TheLoai nvarchar(20) not null
	)

create table SinhVien
(   SV# nvarchar(10) primary key not null,
    TenSV nvarchar(30) not null,
	NgaySinh date not null,
	QueQuan nvarchar(20) not null,
	Lop nvarchar(20) not null
	)

create table HuongDan (
   GV# varchar(10) not null,
    DT# varchar(10)  not null,
	SV# nvarchar(10) not null,
	NamThucHien int not null,
	KetQua float not null,
	foreign key(GV#) references dbo.GiangVien(GV#),
	foreign key(DT#) references dbo.DeTai(DT#),
	foreign key(SV#) references dbo.SinhVien(SV#)
	)
INSERT into GiangVien(GV#,HoTen,NamSinh,DiaChi)
VALUES  ('GV001',N'Bùi Sỹ Thắng','1990',N'Hà Nội'),
        ('GV002',N'Đới Sỹ Bình','1998',N'thái Bình'),
        ('GV003',N'Lê Thế Huy','1997',N'Nghệ An'),
        ('GV004',N'Trần Thị Anh','1996',N'Bắc Giang'),
        ('GV005',N'Vũ Đình Nam','1995',N'Bắc Ninh'),
        ('GV006',N'Lưu Đăng Dương','1994',N'Cao Bằng'),
        ('GV007',N'Trần Đình Trung','1993',N'Lạng Sơn'),
        ('GV008',N'Hoàng Bùi Minh Chí','1992',N'Quảng Ninh'),
        ('GV009',N'Lê Đình Đức','1989',N'Thanh Hoá'),
        ('GV012',N'Đới Duy Triều','1991',N'Hải Phòng');

INSERT Into DeTai(DT#,TenDT,TheLoai)
VALUES  ('DT001',N'Xe Điện',N'Công nghệ'),
        ('DT002',N'Bánh răng',N'Ứng Dụng'),
        ('DT003',N'Nước oxi già',N'hoá học'),
        ('DT004',N'amd 6000',N'CPU'),
        ('DT005',N'vật liệu chống cháy',N'Ứng Dụng'),
        ('DT006',N'động cơ gió',N'động cơ'),
        ('DT007',N'tiền dbzcoin',N'tiền ảo'),
        ('DT008',N'chống ngập hà nội',N'môi trường'),
        ('DT009',N'vinhome giáp nhị',N'quy hoạch'),
        ('DT010',N'vacxin đậu mùa khỉ',N'y học');

insert into SinhVien(SV#,TenSV,NgaySinh,QueQuan,Lop)
VALUES  ('SV01',N'NGUYỄN THANH LONG','2001-05-17',N'Hải Phòng','VN01'),
        ('SV02',N'NGUYỄN XUÂN DŨNG','2000-05-18',N'HÀ NAM','VN02'),
        ('SV03',N'CHU NGỌC ANH','2003-05-17',N'HAI BÀ TRƯNG','VN03'),
        ('SV04',N'NGUYỄN VĂN NAM','2004-05-17',N'BẮC GIANG','VN04'),
        ('SV05',N'PHẠM CÔNG TẠC','2005-05-17',N'Hải Phòng','VN05'),
        ('SV06',N'NGUYỄN MINH TUẤN','1992-05-17',N'hoàng cầu','VN06'),
        ('SV07',N'NGUYỄN NAM LIÊN','1993-05-17',N'mai chí thọ','VN07'),
        ('SV08',N'TRỊNH THANH HÙNG','1994-05-17',N'lê duẩn','VN07'),
        ('SV09',N'HỒ ANH SƠN','2002-05-17',N'đại cồ việt','VN06'),
        ('SV10',N'NGUYỄN VĂN HIỆU','2001-05-17',N'tạ quang bửu','VN05'),
        ('SV11',N'LÂM VĂN TUẤN','2000-05-17',N'trần đại nghĩa','VN04'),
        ('SV12',N'HOÀNG VĂN LƯƠNG','1986-05-17',N'độc lập','VN03'),
        ('SV13',N'ĐỖ ĐỨC LƯU','2003-05-17',N'giải phóng','VN02'),
        ('SV14',N'NGUYỄN VĂN ĐỊNH','2004-05-17',N'lý thường kiệt','VN01'),
        ('SV15',N'HOÀNG VĂN ĐỨC NHẬT','2005-05-17',N'Hải Phòng','VN03');

INSERT Into HuongDan(GV#,DT#,SV#,NamThucHien,KetQua)
VALUES  ('GV001','DT002','SV03','2022','6'),
        ('GV002','DT001','SV04','2021','5'),
        ('GV003','DT003','SV02','2020','7'),
        ('GV004','DT003','SV05','2019','8'),
        ('GV004','DT004','SV11','2018','9'),
        ('GV005','DT004','SV07','2017','9.5'),
        ('GV012','DT001','SV01','2016','4'),
        ('GV005','DT005','SV08','2015','7'),
        ('GV001','DT005','SV09','2014','6'),
        ('GV001','DT006','SV10','2013','5'),
        ('GV012','DT006','SV06','2012','3'),
        ('GV006','DT007','SV12','2011','8'),
        ('GV006','DT007','SV13','2010','9'),
        ('GV006','DT008','SV14','2009','10'),
        ('GV007','DT008','SV15','2008','7')

-- Đưa ra thông tin về giảng viên có mã là "GV001"
SELECT * FROM GiangVien WHERE GV#='GV001'

-- Cho biết bao nhiêu đề tài thuộc thể loại "Ứng Dụng"
SELECT COUNT(*) as soluong from DeTai WHERE TheLoai=N'Ứng Dụng'

-- Cho biết giảng viên có mã "GV012" đã hướng dẫn bao nhiêu sinh viên có quê quán ở "Hải phòng"
SELECT COUNT(*) as soluong FROM HuongDan As HD,
SinhVien As sv 
WHERE HD.SV#=sv.SV# AND HD.GV#='GV012' AND Sv.QueQuan=N'Hải Phòng'

--Cho biết tên đề tài chưa có ai làm
SELECT * FROM DeTai As DT
EXCEPT
SELECT DT1. * FROM DeTai As DT1 INNER JOIN HuongDan As HD
ON HD.DT#=DT1.DT#

--Cập nhật thông tin cho Nguyễn Xuân Dũng
UPDATE SinhVien Set NgaySinh='1991-11-12' WHERE TenSV=N'NGUYỄN XUÂN DŨNG' AND QueQuan=N'HÀ NAM'

SELECT * FROM SinhVien

--Xoá thông tin sinh viên "Nguyễn Văn Nam"
DELETE  FROM SinhVien
where TenSV = 'Nguyễn Văn Nam' and QueQuan = 'Bắc Giang';

-- Tạo view để đưa ra các thông tin về đề tài hướng dẫn sinh viên của các giảng viên
CREATE VIEW thongtin as SELECT * FROM HuongDan 
WHERE NamThucHien='2022'


-- Sử dụng view vừa tạo cho biết thông tin các đề tài hướng dẫn năm 2022
SELECT * from thongtin 

-- Thực hiện phân quyền 
CREATE LOGIN ThuyNV WITH PASSWORD = 'thuy123)'
    CREATE USER NguyenVanThuy FOR LOGIN ThuyNV

CREATE LOGIN QuanTL  WITH PASSWORD ='quan123)'
    CREATE USER  TranLamQuan for login QuanTL
GRANT SELECT ON HUONGDAN  TO NguyenVanThuy
GRANT SELECT ON GIANGVIEN  TO NguyenVanThuy


GRANT SELECT
ON GIANGVIEN  TO TranLamQuan
GRANT ALTER
ON GIANGVIEN  TO TranLamQuan
GRANT ALTER
ON SinhVien  TO TranLamQuan
GRANT ALTER
ON DeTai  TO TranLamQuan
GRANT ALTER
ON HuongDan  TO TranLamQuan

GRANT SELECT
ON GIANGVIEN  TO NguyenVanThuy
GRANT ALTER
ON GIANGVIEN  TO NguyenVanThuy
GRANT ALTER
ON SinhVien  TO NguyenVanThuy
GRANT ALTER
ON DeTai  TO NguyenVanThuy
GRANT ALTER
ON HuongDan  TO NguyenVanThuy

--3
BACKUP DATABASE duongC to disk = '/Users/luuduong/Downloads/LuuKhacDangDuong_20205076_Thuctapcsdl.bak'

restore database duongc from disk = '/Users/luuduong/Downloads/LuuKhacDangDuong_20205076_Thuctapcsdl.bak' 
