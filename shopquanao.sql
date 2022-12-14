create database if not exists shopquanao;
use shopquanao;


create table giamgia(
	magiamgia nvarchar(5) not null,
    chitietgiam double null,
    trangthai bit default 1,
    constraint pK_giamgia primary key(magiamgia)
);


create table loaisanpham(
	maloai nvarchar(50) not null,
    tenloai nvarchar(50) null,
    trangthai bit default 1,
    constraint pK_loaisanpham primary key(maloai)
);


create table sanpham(
	masanpham nvarchar(50) not null,
    tensanpham nvarchar(50) null,
    mau nvarchar(50) null,
    gianhap double null,
    giaban double null,
    ngaynhapkho date null,
    hinhanh nvarchar(100) null,
    motasanpham nvarchar(200) null,
    maloai nvarchar(50) null,
    magiamgia nvarchar(5) not null,
    trangthai bit default 1,
    constraint pk_sanpham primary key (masanpham),
    constraint fk_sanpham_loaisanpham foreign key (maloai) references loaisanpham(maloai),
    constraint fk_sanpham_giamgia foreign key (magiamgia) references giamgia(magiamgia)
);


create table size(
	masize nvarchar(15) not null,
    tensize nvarchar(10) null,
    trangthai bit default 1,
    constraint pk_size primary key (masize)
);


create table sanphamsize(
	masanphamsize int auto_increment,
	masanpham nvarchar(50) not null,
    masize nvarchar(15) not null,
    soluong int,
    trangthai bit default 1,
    constraint pk_sanpham_size primary key (masanphamsize),
    constraint fk_sanpham_sanphamsize foreign key (masanpham) references sanpham(masanpham),
    constraint fk_size_sanphamsize foreign key (masize) references size(masize)
);


create table hoadon(
	mahoadon int AUTO_INCREMENT,
    tongtien double null,
    tennguoimua nvarchar(50) null,
    email nvarchar(100) null,
    sodienthoai nvarchar(15) null,
    diachi nvarchar(100) null,
    
    trangthai bit default 0,
    constraint pk_hoadon primary key (mahoadon)
);



create table hoadonchitiet(
	mahoadonchitiet int AUTO_INCREMENT,
    mahoadon int not null,
    masanpham nvarchar(50) not null,
    tensize nvarchar (50) not null,
    soluong int(11) null,
    thanhtien double null,
    trangthai bit default 0,
    constraint pk_hoadonchitiet primary key (mahoadonchitiet),
    constraint fk_hoadon foreign key (mahoadon) references hoadon(mahoadon),
    constraint fk_sanpham foreign key (masanpham) references sanpham(masanpham)
);

create table nhanvien(
	manv nvarchar (50) not null primary key,
    tennv nvarchar(100) not null,
    matkhau nvarchar (50) not null,
    vaitro bit not null,
    quequan nvarchar (100) not null,
    sodt nvarchar (15) not null,
    ngayvao date not null
);

insert into nhanvien values ('admin', 'Nguyen Quoc Doanh', '123456', 1, n'H???i Ph??ng', '0123445667', '2020-02-03');
-- TH??M D??? LI???U
-- B???NG GI???M GI??
insert into giamgia(magiamgia, chitietgiam) values('GG01', 0.1);
insert into giamgia(magiamgia, chitietgiam) values('GG02', 0.2);
insert into giamgia(magiamgia, chitietgiam) values('GG03', 0.3);
insert into giamgia(magiamgia, chitietgiam) values('GG04', 0.4);
insert into giamgia(magiamgia, chitietgiam) values('GG05', 0.5);

-- B???NG LO???I S???N PH???M
insert into loaisanpham(maloai, tenloai) values ('Quan01', n'Qu???n d??i');
insert into loaisanpham(maloai, tenloai) values ('Quan02', n'Qu???n ng???n');
insert into loaisanpham(maloai, tenloai) values ('Ao01', n'??o s?? mi');
insert into loaisanpham(maloai, tenloai) values ('Ao02', n'??o ph??ng');
insert into loaisanpham(maloai, tenloai) values ('Giay01', n'Gi??y nam');

-- B???NG S???N PH???M
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0001', n'QU???N JEANS SKINNY XANH', 'Xanh d????ng', 100000, 300000, '2020-07-15','quan-dai-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0002', n'QU???N JEANS MIKI XANH ??EN', 'Xanh ??en', 100000, 350000, '2020-07-15','quan-dai-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0003', n'QU???N JEANS SKY XANH D????NG', 'Xanh d????ng', 120000, 450000, '2020-07-15','quan-dai-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0004', n'QU???N JEANS SKINNY ??EN', '??en', 100000, 400000, '2020-07-15','quan-dai-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0005', n'QU???N JEANS SKINNY B???C', 'B???c', 125000, 500000, '2020-07-15','quan-dai-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 --
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0006', n'QU???N JEANS R??CH XANH BI???N', 'Xanh d????ng', 130000, 550000, '2020-07-15','quan-dai-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0007', n'QU???N JEAN R??CH G???I ??EN ', '??en', 1350000, 600000, '2020-07-15','quan-dai-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0008', n'QU???N JEAN R??CH XANH ??EN', 'Xanh ??en', 100000, 350000, '2020-07-15','quan-dai-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');

 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0009', n'QU???N JEAN R??CH XANH D????NG', 'Xanh ?????m', 100000, 350000, '2020-07-15','quan-dai-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0010', n'QU???N JEANS R??CH TR???NG', 'Tr???ng', 150000, 600000, '2020-07-15','quan-dai-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0011', n'QU???N JEANS SKINNY XANH D????NG', 'Xanh d????ng', 100000, 300000, '2020-07-15','quan-dai-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0012', n'QU???N JEANS MIKI XANH ??EN', 'Xanh ??en', 100000, 350000, '2020-07-15','quan-dai-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0013', n'QU???N JEANS SKY XANH D????NG', 'Xanh d????ng', 120000, 450000, '2020-07-15','quan-dai-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0014', n'QU???N JEANS SKINNY ??EN', '??en', 100000, 400000, '2020-07-15','quan-dai-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0015', n'QU???N JEANS SKINNY B???C', 'B???c', 125000, 500000, '2020-07-15','quan-dai-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 --
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0016', n'QU???N JEANS R??CH XANH BI???N', 'Xanh d????ng', 130000, 550000, '2020-07-15','quan-dai-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0017', n'QU???N JEAN R??CH G???I ??EN ', '??en', 1350000, 600000, '2020-07-15','quan-dai-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0018', n'QU???N JEAN R??CH XANH ??EN', 'Xanh ??en', 100000, 350000, '2020-07-15','quan-dai-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG03');

 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0019', n'QU???N JEAN R??CH XANH D????NG ?????M ', 'Xanh ?????m', 100000, 350000, '2020-07-15','quan-dai-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG02');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0020', n'QU???N JEANS R??CH TR???NG', 'Tr???ng', 150000, 600000, '2020-07-15','quan-dai-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan01', n'GG02');





  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0001', n'QU???N SHORT XANH ??EN', 'Xanh ??en', 90000, 200000, '2020-07-15','quan-ngan-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');

  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0002', n'QU???N SHORT XANH ??EN', 'Xanh ??en', 90000, 220000, '2020-07-15','quan-ngan-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0003', n'QU???N SHORT XANH ??EN', 'Xanh ??en', 100000, 300000, '2020-07-15','quan-ngan-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0004', n'QU???N SHORT XANH', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0005', n'QU???N SHORT XANH NH???T', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0006', n'QU???N SHORT X??M', 'X??m', 90000, 200000, '2020-07-15','quan-ngan-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0007', n'QU???N SHORT KAKI', 'N??u', 90000, 250000, '2020-07-15','quan-ngan-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0008', n'QU???N SHORT LINEN X??M XANH', 'X??m', 90000, 250000, '2020-07-15','quan-ngan-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0009', n'QU???N SHORT LINEN X??M XANH', 'X??m xanh', 90000, 250000, '2020-07-15','quan-ngan-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0010', n'QU???N SHORT KAKI', 'N??u', 90000, 250000, '2020-07-15','quan-ngan-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0011', n'QU???N SHORT XANH ??EN', 'Xanh ??en', 90000, 200000, '2020-07-15','quan-ngan-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');

  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0012', n'QU???N SHORT XANH ??EN', 'Xanh ??en', 90000, 220000, '2020-07-15','quan-ngan-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0013', n'QU???N SHORT XANH ??EN', 'Xanh ??en', 100000, 300000, '2020-07-15','quan-ngan-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0014', n'QU???N SHORT XANH', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0015', n'QU???N SHORT XANH NH???T', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0016', n'QU???N SHORT X??M', 'X??m', 90000, 200000, '2020-07-15','quan-ngan-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0017', n'QU???N SHORT KAKI', 'N??u', 90000, 250000, '2020-07-15','quan-ngan-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG02');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0018', n'QU???N SHORT LINEN X??M XANH', 'X??m', 90000, 250000, '2020-07-15','quan-ngan-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG03');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0019', n'QU???N SHORT LINEN X??M XANH', 'X??m xanh', 90000, 250000, '2020-07-15','quan-ngan-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG02');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0020', n'QU???N SHORT KAKI', 'N??u', 90000, 250000, '2020-07-15','quan-ngan-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Quan02', n'GG02');
 
 
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0001', n'??O THUN IN SUMMER FORM REGULAR', 'N??u', 90000, 250000, '2020-07-15','ao-ngan-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0002', n'??O THUN IN SUN OF THE BEACH XANH', 'Xanh', 90000, 210000, '2020-07-15','ao-ngan-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0003', n'??O THUN IN SUMMER FORM REGULAR N??U', 'N??u', 90000, 300000, '2020-07-15','ao-ngan-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0004', n'??O THUN IN SUMMER FORM REGULAR ??EN', '??en', 90000, 220000, '2020-07-15','ao-ngan-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0005', n'??O THUN R?? PH???I FORM LOOSE TR???NG', 'Tr???ng', 90000, 260000, '2020-07-15','ao-ngan-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0006', n'??O THUN IN SUMMER FORM TR???NG', 'Tr???ng', 90000, 250000, '2020-07-15','ao-ngan-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0007', n'??O THUN PH???I H???A TI???T ??EN', '??en', 90000, 250000, '2020-07-15','ao-ngan-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0008', n'??O THUN C??? TIM X??M', 'X??m', 90000, 190000, '2020-07-15','ao-ngan-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0009', n'??O THUN C??? TIM ??EN', '??en', 90000, 210000, '2020-07-15','ao-ngan-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0010', n'??O THUN C??? TIM TR???NG', 'Tr???ng', 90000, 200000, '2020-07-15','ao-ngan-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0011', n'??O THUN IN SUMMER FORM REGULAR', 'N??u', 90000, 250000, '2020-07-15','ao-ngan-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0012', n'??O THUN IN SUN OF THE BEACH XANH', 'Xanh', 90000, 210000, '2020-07-15','ao-ngan-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0013', n'??O THUN IN SUMMER FORM REGULAR N??U', 'N??u', 90000, 300000, '2020-07-15','ao-ngan-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0014', n'??O THUN IN SUMMER FORM REGULAR ??EN', '??en', 90000, 220000, '2020-07-15','ao-ngan-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0015', n'??O THUN R?? PH???I FORM LOOSE TR???NG', 'Tr???ng', 90000, 260000, '2020-07-15','ao-ngan-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0016', n'??O THUN IN SUMMER FORM TR???NG', 'Tr???ng', 90000, 250000, '2020-07-15','ao-ngan-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0017', n'??O THUN PH???I H???A TI???T ??EN', '??en', 90000, 250000, '2020-07-15','ao-ngan-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0018', n'??O THUN C??? TIM X??M', 'X??m', 90000, 190000, '2020-07-15','ao-ngan-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0019', n'??O THUN C??? TIM ??EN', '??en', 90000, 210000, '2020-07-15','ao-ngan-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG02');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0020', n'??O THUN C??? TIM TR???NG', 'Tr???ng', 90000, 200000, '2020-07-15','ao-ngan-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao02', n'GG02');

 
 
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0001', n'??O S?? MI XANH DA TR??I', 'Xanh', 90000, 300000, '2020-07-15','ao-dai-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0002', n'??O S?? MI X??M CHU???T', 'X??m', 90000, 310000, '2020-07-15','ao-dai-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0003', n'??O S?? MI TR???NG ??EN', '??en', 90000, 210000, '2020-07-15','ao-dai-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0004', n'??O S?? MI TR???NG', 'Tr???ng', 90000, 190000, '2020-07-15','ao-dai-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0005', n'??O S?? MI H???A TI???T TR???NG', 'Tr???ng', 90000, 250000, '2020-07-15','ao-dai-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0006', n'??O S?? MI H???A TI???T XANH BI???N ?????M', 'Xanh', 90000, 210000, '2020-07-15','ao-dai-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0007', n'??O S?? MI TR???NG', 'Tr???ng', 90000, 250000, '2020-07-15','ao-dai-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0008', n'??O S?? MI H???A TI???T ??EN', '??en', 90000, 210000, '2020-07-15','ao-dai-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0009', n'??O S?? MI H???A TI???T B??', 'N??u', 90000, 230000, '2020-07-15','ao-dai-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0010', n'??O S?? MI KAKI TH??U CH???', '??en', 90000, 210000, '2020-07-15','ao-dai-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0011', n'??O S?? MI XANH DA TR??I', 'Xanh', 90000, 300000, '2020-07-15','ao-dai-0001.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0012', n'??O S?? MI X??M CHU???T', 'X??m', 90000, 310000, '2020-07-15','ao-dai-0002.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0013', n'??O S?? MI TR???NG ??EN', '??en', 90000, 210000, '2020-07-15','ao-dai-0003.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0014', n'??O S?? MI TR???NG', 'Tr???ng', 90000, 190000, '2020-07-15','ao-dai-0004.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0015', n'??O S?? MI H???A TI???T TR???NG', 'Tr???ng', 90000, 250000, '2020-07-15','ao-dai-0005.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0016', n'??O S?? MI H???A TI???T XANH BI???N ?????M', 'Xanh', 90000, 210000, '2020-07-15','ao-dai-0006.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG03');

   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0017', n'??O S?? MI TR???NG', 'Tr???ng', 90000, 250000, '2020-07-15','ao-dai-0007.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0018', n'??O S?? MI H???A TI???T ??EN', '??en', 90000, 210000, '2020-07-15','ao-dai-0008.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0019', n'??O S?? MI H???A TI???T B??', 'N??u', 90000, 230000, '2020-07-15','ao-dai-0009.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG02');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0020', n'??O S?? MI KAKI TH??U CH???', '??en', 90000, 210000, '2020-07-15','ao-dai-0010.jpg',
 n'V???i ?????p , kh??ng x?? , kh??ng co r??t , m???m m???n d??y d???n , h??t m??? h??i c???c nhanh, m???c si??u m??t', n'Ao01', n'GG02');
 
 

 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0001', n'GI??Y CHELSEA BOOT DA L???N M??U X??M', 'X??m', 300000, 800000, '2020-07-15','giay-0001.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0002', n'GI??Y CHELSEA BOOT DA TR??N M??U N??U', 'N??u', 300000, 800000, '2020-07-15','giay-0002.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0003', n'GI??Y CHELSEA BOOT DA TR??N M??U ??EN', '??en', 300000, 800000, '2020-07-15','giay-0003.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0004', n'GI??Y TH??? THAO ??EN', '??en', 300000, 220000, '2020-07-15','giay-0004.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0005', n'GI??Y M???I M??U B??', 'N??u', 300000, 500000, '2020-07-15','giay-0005.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0006', n'GI??Y M???I XANH ??EN', '??en', 300000, 600000, '2020-07-15','giay-0006.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0007', n'GI??Y M???I M??U ??EN', '??en', 300000, 500000, '2020-07-15','giay-0007.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0008', n'GI??Y M???I M??U B?? ?????M', 'N??u', 300000, 500000, '2020-07-15','giay-0008.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0009', n'GI??Y M???I ????? ????', '?????', 300000, 600000, '2020-07-15','giay-0009.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0010', n'GI??Y M???I M??U XANH ', 'Xanh', 300000, 800000, '2020-07-15','giay-0010.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0011', n'GI??Y CHELSEA BOOT DA L???N M??U X??M', 'X??m', 300000, 800000, '2020-07-15','giay-0001.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0012', n'GI??Y CHELSEA BOOT DA TR??N M??U N??U', 'N??u', 300000, 800000, '2020-07-15','giay-0002.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0013', n'GI??Y CHELSEA BOOT DA TR??N M??U ??EN', '??en', 300000, 800000, '2020-07-15','giay-0003.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0014', n'GI??Y TH??? THAO ??EN', '??en', 300000, 220000, '2020-07-15','giay-0004.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0015', n'GI??Y M???I M??U B??', 'N??u', 300000, 500000, '2020-07-15','giay-0005.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0016', n'GI??Y M???I XANH ??EN', '??en', 300000, 600000, '2020-07-15','giay-0006.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0017', n'GI??Y M???I M??U ??EN', '??en', 300000, 500000, '2020-07-15','giay-0007.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG03');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0018', n'GI??Y M???I M??U B?? ?????M', 'N??u', 300000, 500000, '2020-07-15','giay-0008.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG02');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0019', n'GI??Y M???I ????? ????', '?????', 300000, 600000, '2020-07-15','giay-0009.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG02');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0020', n'GI??Y M???I M??U XANH ', 'Xanh', 300000, 800000, '2020-07-15','giay-0010.jpg',
 n'Da m???m, ??m, nh??? t???o c???m gi??c v???a v???n v?? tho???i m??i cho ????i ch??n', n'Giay01', n'GG02');
 
-- B???NG SIZE
insert into size(masize, tensize) values ('Size01', n'S');
insert into size(masize, tensize) values ('Size02', n'L');
insert into size(masize, tensize) values ('Size03', n'XL');
insert into size(masize, tensize) values ('Size04', n'XXL');
insert into size(masize, tensize) values ('Size05', n'29');
insert into size(masize, tensize) values ('Size06', n'30');
insert into size(masize, tensize) values ('Size07', n'31');
insert into size(masize, tensize) values ('Size08', n'32');
insert into size(masize, tensize) values ('Size09', n'33');
insert into size(masize, tensize) values ('Size10', n'38');
insert into size(masize, tensize) values ('Size11', n'39');
insert into size(masize, tensize) values ('Size12', n'40');
insert into size(masize, tensize) values ('Size13', n'41');
insert into size(masize, tensize) values ('Size14', n'42');


-- B???NG S???N PH???M SIZE

insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0001','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0001','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0001','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0001','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0001','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0002','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0002','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0002','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0002','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0002','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0003','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0003','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0003','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0003','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0003','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0004','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0004','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0004','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0004','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0004','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0005','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0005','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0005','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0005','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0005','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0006','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0006','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0006','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0006','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0006','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0007','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0007','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0007','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0007','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0007','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0008','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0008','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0008','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0008','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0008','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0009','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0009','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0009','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0009','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0009','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0010','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0010','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0010','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0010','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0010','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0011','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0011','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0011','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0011','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0011','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0012','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0012','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0012','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0012','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0012','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0013','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0013','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0013','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0013','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0013','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0014','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0014','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0014','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0014','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0014','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0015','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0015','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0015','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0015','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0015','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0016','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0016','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0016','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0016','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0016','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0017','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0017','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0017','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0017','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0017','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0018','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0018','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0018','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0018','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0018','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0019','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0019','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0019','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0019','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0019','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0020','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0020','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0020','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0020','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-dai-0020','Size09',5);



insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0001','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0001','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0001','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0001','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0001','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0002','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0002','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0002','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0002','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0002','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0003','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0003','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0003','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0003','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0003','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0004','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0004','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0004','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0004','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0004','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0005','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0005','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0005','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0005','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0005','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0006','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0006','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0006','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0006','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0006','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0007','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0007','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0007','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0007','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0007','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0008','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0008','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0008','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0008','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0008','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0009','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0009','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0009','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0009','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0009','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0010','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0010','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0010','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0010','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0010','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0011','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0011','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0011','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0011','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0011','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0012','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0012','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0012','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0012','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0012','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0013','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0013','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0013','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0013','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0013','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0014','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0014','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0014','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0014','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0014','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0015','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0015','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0015','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0015','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0015','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0016','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0016','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0016','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0016','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0016','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0017','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0017','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0017','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0017','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0017','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0018','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0018','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0018','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0018','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0018','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0019','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0019','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0019','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0019','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0019','Size09',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0020','Size05',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0020','Size06',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0020','Size07',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0020','Size08',5);
insert into sanphamsize(masanpham, masize, soluong) values ('quan-ngan-0020','Size09',5);

insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0001','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0001','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0001','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0001','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0002','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0002','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0002','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0002','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0003','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0003','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0003','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0003','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0004','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0004','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0004','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0004','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0005','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0005','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0005','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0005','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0006','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0006','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0006','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0006','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0007','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0007','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0007','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0007','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0008','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0008','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0008','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0008','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0009','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0009','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0009','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0009','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0010','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0010','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0010','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0010','Size04',5);

insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0011','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0011','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0011','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0011','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0012','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0012','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0012','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0012','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0013','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0013','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0013','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0013','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0014','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0014','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0014','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0014','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0015','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0015','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0015','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0015','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0016','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0016','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0016','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0016','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0017','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0017','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0017','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0017','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0018','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0018','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0018','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0018','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0019','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0019','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0019','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0019','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0020','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0020','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0020','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-ngan-0020','Size04',5);

insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0001','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0001','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0001','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0001','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0002','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0002','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0002','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0002','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0003','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0003','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0003','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0003','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0004','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0004','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0004','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0004','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0005','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0005','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0005','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0005','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0006','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0006','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0006','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0006','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0007','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0007','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0007','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0007','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0008','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0008','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0008','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0008','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0009','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0009','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0009','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0009','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0010','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0010','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0010','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0010','Size04',5);

insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0011','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0011','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0011','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0011','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0012','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0012','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0012','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0012','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0013','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0013','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0013','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0013','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0014','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0014','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0014','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0014','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0015','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0015','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0015','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0015','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0016','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0016','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0016','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0016','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0017','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0017','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0017','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0017','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0018','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0018','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0018','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0018','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0019','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0019','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0019','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0019','Size04',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0020','Size01',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0020','Size02',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0020','Size03',5);
insert into sanphamsize(masanpham, masize, soluong) values ('ao-dai-0020','Size04',5);

insert into sanphamsize(masanpham, masize, soluong) values ('giay-0001','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0001','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0001','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0001','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0001','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0002','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0002','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0002','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0002','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0002','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0003','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0003','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0003','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0003','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0003','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0004','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0004','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0004','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0004','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0004','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0005','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0005','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0005','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0005','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0005','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0006','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0006','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0006','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0006','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0006','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0007','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0007','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0007','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0007','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0007','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0008','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0008','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0008','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0008','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0008','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0009','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0009','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0009','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0009','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0010','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0010','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0010','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0010','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0010','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0009','Size14',5);

insert into sanphamsize(masanpham, masize, soluong) values ('giay-0011','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0011','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0011','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0011','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0011','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0012','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0012','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0012','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0012','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0012','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0013','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0013','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0013','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0013','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0013','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0014','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0014','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0014','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0014','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0014','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0015','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0015','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0015','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0015','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0015','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0016','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0016','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0016','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0016','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0016','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0017','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0017','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0017','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0017','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0017','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0018','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0018','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0018','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0018','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0018','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0019','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0019','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0019','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0019','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0019','Size14',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0020','Size10',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0020','Size11',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0020','Size12',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0020','Size13',5);
insert into sanphamsize(masanpham, masize, soluong) values ('giay-0020','Size14',5);


delete from chitietanh;
select * from sanpham;
