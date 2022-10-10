package com.example.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 * The persistent class for the sanpham database table.
 * 
 */
@Entity
public class Sanpham {
	@Id
	private String masanpham;

	private double giaban;

	private double gianhap;

	private String hinhanh;

	private String mau;

	private String motasanpham;

	private java.sql.Date ngaynhapkho;

	private String tensanpham;

	private byte trangthai;

	// bi-directional many-to-one association to Hoadonchitiet
	@OneToMany(mappedBy = "sanpham")
	private List<Hoadonchitiet> hoadonchitiets;

	// bi-directional many-to-one association to Giamgia
	@ManyToOne
	@JoinColumn(name = "magiamgia")
	private Giamgia giamgia;

	// bi-directional many-to-one association to Loaisanpham
	@ManyToOne
	@JoinColumn(name = "maloai")
	private Loaisanpham loaisanpham;

	// bi-directional many-to-one association to Sanphamsize
	@OneToMany(mappedBy = "sanpham")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Sanphamsize> sanphamsizes;

	public Sanpham() {
	}

	public Sanpham(String masanpham, double giaban, double gianhap, String hinhanh, String mau, String motasanpham,
			java.sql.Date ngaynhapkho, String tensanpham, byte trangthai, List<Hoadonchitiet> hoadonchitiets,
			Giamgia giamgia, Loaisanpham loaisanpham, List<Sanphamsize> sanphamsizes) {
		super();
		this.masanpham = masanpham;
		this.giaban = giaban;
		this.gianhap = gianhap;
		this.hinhanh = hinhanh;
		this.mau = mau;
		this.motasanpham = motasanpham;
		this.ngaynhapkho = ngaynhapkho;
		this.tensanpham = tensanpham;
		this.trangthai = trangthai;
		this.hoadonchitiets = hoadonchitiets;
		this.giamgia = giamgia;
		this.loaisanpham = loaisanpham;
		this.sanphamsizes = sanphamsizes;
	}

	public String getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}

	public double getGiaban() {
		return giaban;
	}

	public void setGiaban(double giaban) {
		this.giaban = giaban;
	}

	public double getGianhap() {
		return gianhap;
	}

	public void setGianhap(double gianhap) {
		this.gianhap = gianhap;
	}

	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public String getMau() {
		return mau;
	}

	public void setMau(String mau) {
		this.mau = mau;
	}

	public String getMotasanpham() {
		return motasanpham;
	}

	public void setMotasanpham(String motasanpham) {
		this.motasanpham = motasanpham;
	}

	public java.sql.Date getNgaynhapkho() {
		return ngaynhapkho;
	}

	public void setNgaynhapkho(java.sql.Date ngaynhapkho) {
		this.ngaynhapkho = ngaynhapkho;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public byte getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}

	public List<Hoadonchitiet> getHoadonchitiets() {
		return hoadonchitiets;
	}

	public void setHoadonchitiets(List<Hoadonchitiet> hoadonchitiets) {
		this.hoadonchitiets = hoadonchitiets;
	}

	public Giamgia getGiamgia() {
		return giamgia;
	}

	public void setGiamgia(Giamgia giamgia) {
		this.giamgia = giamgia;
	}

	public Loaisanpham getLoaisanpham() {
		return loaisanpham;
	}

	public void setLoaisanpham(Loaisanpham loaisanpham) {
		this.loaisanpham = loaisanpham;
	}

	public List<Sanphamsize> getSanphamsizes() {
		return sanphamsizes;
	}

	public void setSanphamsizes(List<Sanphamsize> sanphamsizes) {
		this.sanphamsizes = sanphamsizes;
	}

}