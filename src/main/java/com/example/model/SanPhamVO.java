package com.example.model;

public class SanPhamVO {
	private String masanpham;	
	private String tensanpham;
	private String mau;
	private double gianhap;
	private double giaban;
	private java.sql.Date ngaynhapkho;
	private String hinhanh;
	private String motasanpham;
	private String maloai;
	private String magiamgia;
	private byte trangthai;
	
	public SanPhamVO(String masanpham, String tensanpham, String mau, double gianhap, double giaban, java.sql.Date ngaynhapkho,
			String hinhanh, String motasanpham, String maloai, String magiamgia, byte trangthai) {
		
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.mau = mau;
		this.gianhap = gianhap;
		this.giaban = giaban;
		this.ngaynhapkho = ngaynhapkho;
		this.hinhanh = hinhanh;
		this.motasanpham = motasanpham;
		this.maloai = maloai;
		this.magiamgia = magiamgia;
		this.trangthai = trangthai;
	}

	public SanPhamVO() {
		
	}

	public String getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public String getMau() {
		return mau;
	}

	public void setMau(String mau) {
		this.mau = mau;
	}

	public double getGianhap() {
		return gianhap;
	}

	public void setGianhap(double gianhap) {
		this.gianhap = gianhap;
	}

	public double getGiaban() {
		return giaban;
	}

	public void setGiaban(double giaban) {
		this.giaban = giaban;
	}

	public java.sql.Date getNgaynhapkho() {
		return ngaynhapkho;
	}

	public void setNgaynhapkho(java.sql.Date ngaynhapkho) {
		this.ngaynhapkho = ngaynhapkho;
	}

	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public String getMotasanpham() {
		return motasanpham;
	}

	public void setMotasanpham(String motasanpham) {
		this.motasanpham = motasanpham;
	}

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public String getMagiamgia() {
		return magiamgia;
	}

	public void setMagiamgia(String magiamgia) {
		this.magiamgia = magiamgia;
	}

	public byte getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}
	
	
	
	
	
	
}