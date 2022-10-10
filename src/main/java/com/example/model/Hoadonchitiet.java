package com.example.model;

import java.io.Serializable;
import javax.persistence.*;

import com.example.model.Hoadon;


/**
 * The persistent class for the hoadonchitiet database table.
 * 
 */
@Entity
@NamedQuery(name="Hoadonchitiet.findAll", query="SELECT h FROM Hoadonchitiet h")
public class Hoadonchitiet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int mahoadonchitiet;

	

	private int soluong;

	private double thanhtien;

	private byte trangthai;
	
	private String tensize;
	
	//bi-directional many-to-one association to Hoadon
	@ManyToOne
	@JoinColumn(name="mahoadon")
	private Hoadon hoadon;

	//bi-directional many-to-one association to Sanpham
	@ManyToOne
	@JoinColumn(name="masanpham")
	private Sanpham sanpham;

	public Hoadonchitiet( int soluong,double thanhtien, Hoadon hoadon, Sanpham sanpham, String tensize) {
		this.soluong = soluong;
		this.thanhtien = thanhtien;
		this.hoadon = hoadon;
		this.sanpham = sanpham;
		this.tensize = tensize;
	}
	
	public Hoadonchitiet() {
	}

	
	
	public String getTensize() {
		return tensize;
	}

	public void setTensize(String tensize) {
		this.tensize = tensize;
	}

	public int getMahoadonchitiet() {
		return this.mahoadonchitiet;
	}

	public void setMahoadonchitiet(int mahoadonchitiet) {
		this.mahoadonchitiet = mahoadonchitiet;
	}

	

	public int getSoluong() {
		return this.soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public double getThanhtien() {
		return this.thanhtien;
	}

	public void setThanhtien(double thanhtien) {
		this.thanhtien = thanhtien;
	}

	public byte getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}

	public Hoadon getHoadon() {
		return this.hoadon;
	}

	public void setHoadon(Hoadon hoadon) {
		this.hoadon = hoadon;
	}

	public Sanpham getSanpham() {
		return this.sanpham;
	}

	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}

}