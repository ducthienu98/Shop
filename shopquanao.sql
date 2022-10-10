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

insert into nhanvien values ('admin', 'Nguyen Quoc Doanh', '123456', 1, n'Hải Phòng', '0123445667', '2020-02-03');
-- THÊM DỮ LIỆU
-- BẢNG GIẢM GIÁ
insert into giamgia(magiamgia, chitietgiam) values('GG01', 0.1);
insert into giamgia(magiamgia, chitietgiam) values('GG02', 0.2);
insert into giamgia(magiamgia, chitietgiam) values('GG03', 0.3);
insert into giamgia(magiamgia, chitietgiam) values('GG04', 0.4);
insert into giamgia(magiamgia, chitietgiam) values('GG05', 0.5);

-- BẢNG LOẠI SẢN PHẨM
insert into loaisanpham(maloai, tenloai) values ('Quan01', n'Quần dài');
insert into loaisanpham(maloai, tenloai) values ('Quan02', n'Quần ngắn');
insert into loaisanpham(maloai, tenloai) values ('Ao01', n'Áo sơ mi');
insert into loaisanpham(maloai, tenloai) values ('Ao02', n'Áo phông');
insert into loaisanpham(maloai, tenloai) values ('Giay01', n'Giày nam');

-- BẢNG SẢN PHẨM
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0001', n'QUẦN JEANS SKINNY XANH', 'Xanh dương', 100000, 300000, '2020-07-15','quan-dai-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0002', n'QUẦN JEANS MIKI XANH ĐEN', 'Xanh đen', 100000, 350000, '2020-07-15','quan-dai-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0003', n'QUẦN JEANS SKY XANH DƯƠNG', 'Xanh dương', 120000, 450000, '2020-07-15','quan-dai-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0004', n'QUẦN JEANS SKINNY ĐEN', 'Đen', 100000, 400000, '2020-07-15','quan-dai-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0005', n'QUẦN JEANS SKINNY BẠC', 'Bạc', 125000, 500000, '2020-07-15','quan-dai-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 --
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0006', n'QUẦN JEANS RÁCH XANH BIỂN', 'Xanh dương', 130000, 550000, '2020-07-15','quan-dai-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0007', n'QUẦN JEAN RÁCH GỐI ĐEN ', 'Đen', 1350000, 600000, '2020-07-15','quan-dai-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0008', n'QUẦN JEAN RÁCH XANH ĐEN', 'Xanh đen', 100000, 350000, '2020-07-15','quan-dai-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');

 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0009', n'QUẦN JEAN RÁCH XANH DƯƠNG', 'Xanh đậm', 100000, 350000, '2020-07-15','quan-dai-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0010', n'QUẦN JEANS RÁCH TRẮNG', 'Trắng', 150000, 600000, '2020-07-15','quan-dai-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0011', n'QUẦN JEANS SKINNY XANH DƯƠNG', 'Xanh dương', 100000, 300000, '2020-07-15','quan-dai-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0012', n'QUẦN JEANS MIKI XANH ĐEN', 'Xanh đen', 100000, 350000, '2020-07-15','quan-dai-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0013', n'QUẦN JEANS SKY XANH DƯƠNG', 'Xanh dương', 120000, 450000, '2020-07-15','quan-dai-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0014', n'QUẦN JEANS SKINNY ĐEN', 'Đen', 100000, 400000, '2020-07-15','quan-dai-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0015', n'QUẦN JEANS SKINNY BẠC', 'Bạc', 125000, 500000, '2020-07-15','quan-dai-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 --
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0016', n'QUẦN JEANS RÁCH XANH BIỂN', 'Xanh dương', 130000, 550000, '2020-07-15','quan-dai-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0017', n'QUẦN JEAN RÁCH GỐI ĐEN ', 'Đen', 1350000, 600000, '2020-07-15','quan-dai-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0018', n'QUẦN JEAN RÁCH XANH ĐEN', 'Xanh đen', 100000, 350000, '2020-07-15','quan-dai-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG03');

 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0019', n'QUẦN JEAN RÁCH XANH DƯƠNG ĐẬM ', 'Xanh đậm', 100000, 350000, '2020-07-15','quan-dai-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG02');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-dai-0020', n'QUẦN JEANS RÁCH TRẮNG', 'Trắng', 150000, 600000, '2020-07-15','quan-dai-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan01', n'GG02');





  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0001', n'QUẦN SHORT XANH ĐEN', 'Xanh đen', 90000, 200000, '2020-07-15','quan-ngan-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');

  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0002', n'QUẦN SHORT XANH ĐEN', 'Xanh đen', 90000, 220000, '2020-07-15','quan-ngan-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0003', n'QUẦN SHORT XANH ĐEN', 'Xanh đen', 100000, 300000, '2020-07-15','quan-ngan-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0004', n'QUẦN SHORT XANH', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0005', n'QUẦN SHORT XANH NHẠT', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0006', n'QUẦN SHORT XÁM', 'Xám', 90000, 200000, '2020-07-15','quan-ngan-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0007', n'QUẦN SHORT KAKI', 'Nâu', 90000, 250000, '2020-07-15','quan-ngan-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0008', n'QUẦN SHORT LINEN XÁM XANH', 'Xám', 90000, 250000, '2020-07-15','quan-ngan-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0009', n'QUẦN SHORT LINEN XÁM XANH', 'Xám xanh', 90000, 250000, '2020-07-15','quan-ngan-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0010', n'QUẦN SHORT KAKI', 'Nâu', 90000, 250000, '2020-07-15','quan-ngan-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0011', n'QUẦN SHORT XANH ĐEN', 'Xanh đen', 90000, 200000, '2020-07-15','quan-ngan-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');

  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0012', n'QUẦN SHORT XANH ĐEN', 'Xanh đen', 90000, 220000, '2020-07-15','quan-ngan-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0013', n'QUẦN SHORT XANH ĐEN', 'Xanh đen', 100000, 300000, '2020-07-15','quan-ngan-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0014', n'QUẦN SHORT XANH', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0015', n'QUẦN SHORT XANH NHẠT', 'Xanh', 90000, 220000, '2020-07-15','quan-ngan-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0016', n'QUẦN SHORT XÁM', 'Xám', 90000, 200000, '2020-07-15','quan-ngan-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG01');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0017', n'QUẦN SHORT KAKI', 'Nâu', 90000, 250000, '2020-07-15','quan-ngan-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG02');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0018', n'QUẦN SHORT LINEN XÁM XANH', 'Xám', 90000, 250000, '2020-07-15','quan-ngan-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG03');

insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0019', n'QUẦN SHORT LINEN XÁM XANH', 'Xám xanh', 90000, 250000, '2020-07-15','quan-ngan-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG02');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('quan-ngan-0020', n'QUẦN SHORT KAKI', 'Nâu', 90000, 250000, '2020-07-15','quan-ngan-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Quan02', n'GG02');
 
 
 
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0001', n'ÁO THUN IN SUMMER FORM REGULAR', 'Nâu', 90000, 250000, '2020-07-15','ao-ngan-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0002', n'ÁO THUN IN SUN OF THE BEACH XANH', 'Xanh', 90000, 210000, '2020-07-15','ao-ngan-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0003', n'ÁO THUN IN SUMMER FORM REGULAR NÂU', 'Nâu', 90000, 300000, '2020-07-15','ao-ngan-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0004', n'ÁO THUN IN SUMMER FORM REGULAR ĐEN', 'Đen', 90000, 220000, '2020-07-15','ao-ngan-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0005', n'ÁO THUN RÃ PHỐI FORM LOOSE TRẮNG', 'Trắng', 90000, 260000, '2020-07-15','ao-ngan-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0006', n'ÁO THUN IN SUMMER FORM TRẮNG', 'Trắng', 90000, 250000, '2020-07-15','ao-ngan-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0007', n'ÁO THUN PHỐI HỌA TIẾT ĐEN', 'Đen', 90000, 250000, '2020-07-15','ao-ngan-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0008', n'ÁO THUN CỔ TIM XÁM', 'Xám', 90000, 190000, '2020-07-15','ao-ngan-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0009', n'ÁO THUN CỔ TIM ĐEN', 'Đen', 90000, 210000, '2020-07-15','ao-ngan-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0010', n'ÁO THUN CỔ TIM TRẮNG', 'Trắng', 90000, 200000, '2020-07-15','ao-ngan-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0011', n'ÁO THUN IN SUMMER FORM REGULAR', 'Nâu', 90000, 250000, '2020-07-15','ao-ngan-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0012', n'ÁO THUN IN SUN OF THE BEACH XANH', 'Xanh', 90000, 210000, '2020-07-15','ao-ngan-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0013', n'ÁO THUN IN SUMMER FORM REGULAR NÂU', 'Nâu', 90000, 300000, '2020-07-15','ao-ngan-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0014', n'ÁO THUN IN SUMMER FORM REGULAR ĐEN', 'Đen', 90000, 220000, '2020-07-15','ao-ngan-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0015', n'ÁO THUN RÃ PHỐI FORM LOOSE TRẮNG', 'Trắng', 90000, 260000, '2020-07-15','ao-ngan-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0016', n'ÁO THUN IN SUMMER FORM TRẮNG', 'Trắng', 90000, 250000, '2020-07-15','ao-ngan-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0017', n'ÁO THUN PHỐI HỌA TIẾT ĐEN', 'Đen', 90000, 250000, '2020-07-15','ao-ngan-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0018', n'ÁO THUN CỔ TIM XÁM', 'Xám', 90000, 190000, '2020-07-15','ao-ngan-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0019', n'ÁO THUN CỔ TIM ĐEN', 'Đen', 90000, 210000, '2020-07-15','ao-ngan-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG02');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-ngan-0020', n'ÁO THUN CỔ TIM TRẮNG', 'Trắng', 90000, 200000, '2020-07-15','ao-ngan-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao02', n'GG02');

 
 
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0001', n'ÁO SƠ MI XANH DA TRƠI', 'Xanh', 90000, 300000, '2020-07-15','ao-dai-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0002', n'ÁO SƠ MI XÁM CHUỘT', 'Xám', 90000, 310000, '2020-07-15','ao-dai-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0003', n'ÁO SƠ MI TRẮNG ĐEN', 'Đen', 90000, 210000, '2020-07-15','ao-dai-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0004', n'ÁO SƠ MI TRẮNG', 'Trắng', 90000, 190000, '2020-07-15','ao-dai-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0005', n'ÁO SƠ MI HỌA TIẾT TRẮNG', 'Trắng', 90000, 250000, '2020-07-15','ao-dai-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0006', n'ÁO SƠ MI HỌA TIẾT XANH BIỂN ĐẬM', 'Xanh', 90000, 210000, '2020-07-15','ao-dai-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0007', n'ÁO SƠ MI TRẮNG', 'Trắng', 90000, 250000, '2020-07-15','ao-dai-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0008', n'ÁO SƠ MI HỌA TIẾT ĐEN', 'Đen', 90000, 210000, '2020-07-15','ao-dai-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0009', n'ÁO SƠ MI HỌA TIẾT BÒ', 'Nâu', 90000, 230000, '2020-07-15','ao-dai-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0010', n'ÁO SƠ MI KAKI THÊU CHỮ', 'Đen', 90000, 210000, '2020-07-15','ao-dai-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0011', n'ÁO SƠ MI XANH DA TRƠI', 'Xanh', 90000, 300000, '2020-07-15','ao-dai-0001.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0012', n'ÁO SƠ MI XÁM CHUỘT', 'Xám', 90000, 310000, '2020-07-15','ao-dai-0002.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0013', n'ÁO SƠ MI TRẮNG ĐEN', 'Đen', 90000, 210000, '2020-07-15','ao-dai-0003.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0014', n'ÁO SƠ MI TRẮNG', 'Trắng', 90000, 190000, '2020-07-15','ao-dai-0004.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0015', n'ÁO SƠ MI HỌA TIẾT TRẮNG', 'Trắng', 90000, 250000, '2020-07-15','ao-dai-0005.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0016', n'ÁO SƠ MI HỌA TIẾT XANH BIỂN ĐẬM', 'Xanh', 90000, 210000, '2020-07-15','ao-dai-0006.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG03');

   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0017', n'ÁO SƠ MI TRẮNG', 'Trắng', 90000, 250000, '2020-07-15','ao-dai-0007.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0018', n'ÁO SƠ MI HỌA TIẾT ĐEN', 'Đen', 90000, 210000, '2020-07-15','ao-dai-0008.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG01');
 
   insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0019', n'ÁO SƠ MI HỌA TIẾT BÒ', 'Nâu', 90000, 230000, '2020-07-15','ao-dai-0009.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG02');
 
insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('ao-dai-0020', n'ÁO SƠ MI KAKI THÊU CHỮ', 'Đen', 90000, 210000, '2020-07-15','ao-dai-0010.jpg',
 n'Vải đẹp , không xù , không co rút , mềm mịn dày dặn , hút mồ hôi cực nhanh, mặc siêu mát', n'Ao01', n'GG02');
 
 

 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0001', n'GIÀY CHELSEA BOOT DA LỘN MÀU XÁM', 'Xám', 300000, 800000, '2020-07-15','giay-0001.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0002', n'GIÀY CHELSEA BOOT DA TRƠN MÀU NÂU', 'Nâu', 300000, 800000, '2020-07-15','giay-0002.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0003', n'GIÀY CHELSEA BOOT DA TRƠN MÀU ĐEN', 'Đen', 300000, 800000, '2020-07-15','giay-0003.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0004', n'GIÀY THỂ THAO ĐEN', 'Đen', 300000, 220000, '2020-07-15','giay-0004.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0005', n'GIÀY MỌI MÀU BÒ', 'Nâu', 300000, 500000, '2020-07-15','giay-0005.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0006', n'GIÀY MỌI XANH ĐEN', 'Đen', 300000, 600000, '2020-07-15','giay-0006.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0007', n'GIÀY MỌI MÀU ĐEN', 'Đen', 300000, 500000, '2020-07-15','giay-0007.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0008', n'GIÀY MỌI MÀU BÒ ĐẬM', 'Nâu', 300000, 500000, '2020-07-15','giay-0008.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0009', n'GIÀY MỌI ĐỎ ĐÔ', 'Đỏ', 300000, 600000, '2020-07-15','giay-0009.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0010', n'GIÀY MỌI MÀU XANH ', 'Xanh', 300000, 800000, '2020-07-15','giay-0010.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
 insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0011', n'GIÀY CHELSEA BOOT DA LỘN MÀU XÁM', 'Xám', 300000, 800000, '2020-07-15','giay-0001.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0012', n'GIÀY CHELSEA BOOT DA TRƠN MÀU NÂU', 'Nâu', 300000, 800000, '2020-07-15','giay-0002.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0013', n'GIÀY CHELSEA BOOT DA TRƠN MÀU ĐEN', 'Đen', 300000, 800000, '2020-07-15','giay-0003.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0014', n'GIÀY THỂ THAO ĐEN', 'Đen', 300000, 220000, '2020-07-15','giay-0004.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0015', n'GIÀY MỌI MÀU BÒ', 'Nâu', 300000, 500000, '2020-07-15','giay-0005.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0016', n'GIÀY MỌI XANH ĐEN', 'Đen', 300000, 600000, '2020-07-15','giay-0006.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG01');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0017', n'GIÀY MỌI MÀU ĐEN', 'Đen', 300000, 500000, '2020-07-15','giay-0007.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG03');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0018', n'GIÀY MỌI MÀU BÒ ĐẬM', 'Nâu', 300000, 500000, '2020-07-15','giay-0008.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG02');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0019', n'GIÀY MỌI ĐỎ ĐÔ', 'Đỏ', 300000, 600000, '2020-07-15','giay-0009.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG02');
 
  insert into sanpham(masanpham, tensanpham, mau, gianhap, giaban, ngaynhapkho, hinhanh, motasanpham, maloai, magiamgia)
 values ('giay-0020', n'GIÀY MỌI MÀU XANH ', 'Xanh', 300000, 800000, '2020-07-15','giay-0010.jpg',
 n'Da mềm, êm, nhẹ tạo cảm giác vừa vặn và thoải mái cho đôi chân', n'Giay01', n'GG02');
 
-- BẢNG SIZE
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


-- BẢNG SẢN PHẨM SIZE

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
