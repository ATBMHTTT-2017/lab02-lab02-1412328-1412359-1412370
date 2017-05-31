--SCRIPT TAO CSDL--
--Tao bang Nhan Vien
CREATE TABLE NhanVien
(
  maNV      VARCHAR(5)     CONSTRAINT NhanVien_PK  PRIMARY KEY,
  hoTen     VARCHAR(30),
  diaChi    VARCHAR(30),
  dienThoai VARCHAR(12),
  email     VARCHAR(30),
  maPhong   NUMBER(3),
  chiNhanh  NUMBER(3),
  luong     NUMBER
);
--Tao bang Chi Nhanh
CREATE TABLE ChiNhanh
(
  maCN            NUMBER(3)     CONSTRAINT ChiNhanh_PK PRIMARY KEY,
  tenCN           VARCHAR(30),
  truongChiNhanh  VARCHAR(5)    CONSTRAINT ChiNhanh_FK REFERENCES NhanVien(maNV)
);
--Tao bang Phong Ban
CREATE TABLE PhongBan
(
  maPhong       NUMBER(3)     CONSTRAINT PhongBan_PK PRIMARY KEY,
  tenPhong      VARCHAR(30),
  truongPhong   VARCHAR(5)    CONSTRAINT PhongBan_FK1 REFERENCES NhanVien(maNV),
  ngayNhanChuc  DATE,
  soNhanVien    NUMBER,
  chiNhanh      NUMBER(3)     CONSTRAINT PhongBan_FK2 REFERENCES ChiNhanh(maCN)
);
--Them khoa ngoai cho bang Nhan Vien
ALTER TABLE NhanVien ADD CONSTRAINT NhanVien_FK1 FOREIGN KEY(maPhong) REFERENCES PhongBan(maPhong);
ALTER TABLE NhanVien ADD CONSTRAINT NhanVien_FK2 FOREIGN KEY(chiNhanh) REFERENCES ChiNhanh(maCN);
--Tao bang Du An
CREATE TABLE DuAn
(
  maDA        NUMBER(3)     CONSTRAINT DuAn_PK PRIMARY KEY,
  tenDA       VARCHAR(30),
  kinhPhi     NUMBER,
  phongChuTri NUMBER(3)     CONSTRAINT DuAn_FK1 REFERENCES PhongBan(maPhong),
  truongDA    VARCHAR(5)    CONSTRAINT DuAn_FK2 REFERENCES NhanVien(maNV)
);
--Tao bang Phan Cong
CREATE TABLE PhanCong
(
  maNV    VARCHAR(5),
  duAn    NUMBER(3),
  vaiTro  VARCHAR(20),
  phuCap  NUMBER,
  CONSTRAINT PhanCong_PK PRIMARY KEY(maNV, duAn),
  CONSTRAINT PhanCong_FK1 FOREIGN KEY(maNV) REFERENCES NhanVien(maNV),
  CONSTRAINT PhanCong_FK2 FOREIGN KEY(duAn) REFERENCES DuAn(maDA)
);
--Tao bang Chi Tieu
CREATE TABLE ChiTieu
(
  maChiTieu   NUMBER(3)     CONSTRAINT ChiTieu_PK PRIMARY KEY,
  tenChiTieu  VARCHAR(30),
  soTien      NUMBER,
  duAn        NUMBER(3)     CONSTRAINT ChiTieu_FK REFERENCES DuAn(maDA)
);

--SCRIPT THEM DU LIEU--
--Insert du lieu cho bang Chi Nhanh (chua co du lieu NhanVien nen bo qua cot truongChiNhanh)
INSERT INTO ChiNhanh(maCN, tenCN) VALUES(1,'TP.HCM');
INSERT INTO ChiNhanh(maCN, tenCN) VALUES(2,'Da Lat');
INSERT INTO ChiNhanh(maCN, tenCN) VALUES(3,'Ha Noi');
INSERT INTO ChiNhanh(maCN, tenCN) VALUES(4,'Da Nang');
INSERT INTO ChiNhanh(maCN, tenCN) VALUES(5,'Can Tho');
--Insert du lieu cho bang Phong Ban (Chua co du lieu NhanVien nen bo qua cot truongPhong)
INSERT INTO PhongBan(maPhong, tenPhong, ngayNhanChuc, soNhanVien, chiNhanh) 
VALUES(1,'Nhan Su',TO_DATE('25/01/2017','dd/mm/yyyy'),5,5);
INSERT INTO PhongBan(maPhong, tenPhong, ngayNhanChuc,soNhanVien, chiNhanh) 
VALUES(2,'Tai Chinh',TO_DATE('10/01/2017','dd/mm/yyyy'),6,4);
INSERT INTO PhongBan(maPhong, tenPhong, ngayNhanChuc,soNhanVien, chiNhanh) 
VALUES(3,'Ke Toan',TO_DATE('08/03/2017','dd/mm/yyyy'),3,3);
INSERT INTO PhongBan(maPhong, tenPhong, ngayNhanChuc,soNhanVien, chiNhanh) 
VALUES(4,'Ke Hoach',TO_DATE('19/02/2017','dd/mm/yyyy'),4,2);
INSERT INTO PhongBan(maPhong, tenPhong, ngayNhanChuc,soNhanVien, chiNhanh) 
VALUES(5,'Ky Thuat',TO_DATE('30/04/2017','dd/mm/yyyy'),7,1);
--Insert du lieu cho bang NhanVien
INSERT INTO NhanVien
VALUES('NV1','Nguyen Van A','Q1','0932123567','nva@gmail.com',1,5,5000000);
INSERT INTO NhanVien
VALUES('NV2','Tran Van B','Q3','0932257896','tvb@gmail.com',1,5,6500000);
INSERT INTO NhanVien
VALUES('NV3','Tran Thi C','Q7','0932122567','nvc@gmail.com',1,5,7000000);
INSERT INTO NhanVien
VALUES('NV4','Nguyen Van D','Q12','0132123567','nvd@gmail.com',1,5,9000000);
INSERT INTO NhanVien
VALUES('NV5','Nguyen Thi E','Binh Thanh','0932123467','nve@gmail.com',1,5,10000000);
INSERT INTO NhanVien
VALUES('NV6','Nguyen Be F','Nha Be','0932523567','nvf@gmail.com',2,4,4000000);
INSERT INTO NhanVien
VALUES('NV7','Nguyen Cao G','Can Gio','0932123567','nvg@gmail.com',2,4,6750000);
INSERT INTO NhanVien
VALUES('NV8','Tran Van H','Cu Chi','0932173567','nvh@gmail.com',2,4,8250000);
INSERT INTO NhanVien
VALUES('NV9','Nguyen Van I','Q2','0932123567','nvi@gmail.com',2,4,15000000);
INSERT INTO NhanVien
VALUES('NV10','Nguyen Van J','Q4','0932123567','nvj@gmail.com',2,4,14000000);
INSERT INTO NhanVien
VALUES('NV11','Nguyen Van K','Q9','0932123567','nvk@gmail.com',2,4,12500000);
INSERT INTO NhanVien
VALUES('NV12','Nguyen Van L','Q8','0932123567','nvl@gmail.com',3,3,5500000);
INSERT INTO NhanVien
VALUES('NV13','Nguyen Van M','Q11','0932123567','nvm@gmail.com',3,3,8800000);
INSERT INTO NhanVien
VALUES('NV14','Nguyen Van N','Phu Nhuan','0932123567','nvn@gmail.com',3,3,5760000);
INSERT INTO NhanVien
VALUES('NV15','Nguyen Van O','Go Vap','0933123567','nvo@gmail.com',4,2,5000000);
INSERT INTO NhanVien
VALUES('NV16','Nguyen Van P','Hoc Mon','0932923567','nvp@gmail.com',4,2,8000000);
INSERT INTO NhanVien
VALUES('NV17','Nguyen Van Q','Q5','0432423567','nvq@gmail.com',4,2,9500000);
INSERT INTO NhanVien
VALUES('NV18','Nguyen Van R','Q6','0652123567','nvr@gmail.com',4,2,5600000);
INSERT INTO NhanVien
VALUES('NV19','Nguyen Van S','Q1','0432123567','nvs@gmail.com',5,1,7800000);
INSERT INTO NhanVien
VALUES('NV20','Nguyen Van T','Can Gio','0972123567','nvt@gmail.com',5,1,3800000);
INSERT INTO NhanVien
VALUES('NV21','Nguyen Van U','Cu Chi','0932823567','nvu@gmail.com',5,1,11000000);
INSERT INTO NhanVien
VALUES('NV22','Nguyen Van V','Thu Duc','0930123567','nvv@gmail.com',5,1,6800000);
INSERT INTO NhanVien
VALUES('NV23','Nguyen Van W','Binh Chanh','1932123567','nvw@gmail.com',5,1,8900000);
INSERT INTO NhanVien
VALUES('NV24','Nguyen Van X','Q3','0922123567','nvx@gmail.com',5,1,9600000);
INSERT INTO NhanVien
VALUES('NV25','Nguyen Van Y','Q8','0972823567','nvy@gmail.com',5,1,1200000);
--Cap nhat du lieu khoa ngoai truongPhong cho bang PhongBan
UPDATE PhongBan SET truongPhong = 'NV2' WHERE maPhong = 1;
UPDATE PhongBan SET truongPhong = 'NV8' WHERE maPhong = 2;
UPDATE PhongBan SET truongPhong = 'NV12' WHERE maPhong = 3;
UPDATE PhongBan SET truongPhong = 'NV17' WHERE maPhong = 4;
UPDATE PhongBan SET truongPhong = 'NV21' WHERE maPhong = 5;
--Cap nhat du lieu khoa ngoai truongChiNhanh cho bang ChiNhanh
UPDATE ChiNhanh SET truongChiNhanh = 'NV23' WHERE maCN = 1;
UPDATE ChiNhanh SET truongChiNhanh = 'NV16' WHERE maCN = 2;
UPDATE ChiNhanh SET truongChiNhanh = 'NV14' WHERE maCN = 3;
UPDATE ChiNhanh SET truongChiNhanh = 'NV7' WHERE maCN = 4;
UPDATE ChiNhanh SET truongChiNhanh = 'NV1' WHERE maCN = 5;
--Insert du lieu cho bang Du An
INSERT INTO DuAn VALUES(1,'Du An 1',10000000,2,'NV10');
INSERT INTO DuAn VALUES(2,'Du An 2',12500000,5,'NV20');
INSERT INTO DuAn VALUES(3,'Du An 3',15000000,4,'NV16');
INSERT INTO DuAn VALUES(4,'Du An 4',7000000,3,'NV13');
INSERT INTO DuAn VALUES(5,'Du An 5',50000000,1,'NV5');
--Insert du lieu cho bang Chi Tieu
INSERT INTO ChiTieu VALUES(1,'Quan Ly',6000000,5);
INSERT INTO ChiTieu VALUES(2,'Vat Lieu',9570000,1);
INSERT INTO ChiTieu VALUES(3,'Luong',1300000,3);
INSERT INTO ChiTieu VALUES(4,'Tro Cap',1000000,2);
INSERT INTO ChiTieu VALUES(5,'Van Chuyen',8500000,4);
--Insert du lieu cho bang PhanCong
INSERT INTO PhanCong VALUES('NV1',5,'Leader',5000000);
INSERT INTO PhanCong VALUES('NV7',1,'Timekeeper',6500000);
INSERT INTO PhanCong VALUES('NV12',4,'Secretary',7000000);
INSERT INTO PhanCong VALUES('NV16',3,'Coder',3000000);
INSERT INTO PhanCong VALUES('NV24',2,'Designer',4000000);

--Create users
CREATE USER NV1 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV2 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV3 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV4 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV5 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV6 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV7 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV8 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV9 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV10 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV11 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV12 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV13 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV14 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV15 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV16 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV17 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV18 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV19 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV20 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV21 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV22 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV23 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV24 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;

CREATE USER NV25 IDENTIFIED BY 123456
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT UNLOCK;
