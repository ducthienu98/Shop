package com.example.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the hoadon database table.
 * 
 */
@Entity
@NamedQuery(name="Hoadon.findAll", query="SELECT h FROM Hoadon h")
public class Hoadon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int mahoadon;

	private double tongtien;
	
	private String tennguoimua;

	private String diachi;

	private String email;

	private String sodienthoai;

	private byte trangthai;

	//bi-directional many-to-one association to Hoadonchitiet
	@OneToMany(mappedBy="hoadon")
	private List<Hoadonchitiet> hoadonchitiets;
	

	public Hoadon() {
	}
	
	public Hoadon( double tongtien, String diachi, String email, String sodienthoai,String tennguoimua) {
		this.tongtien = tongtien;
		this.diachi = diachi;
		this.email = email;
		this.sodienthoai = sodienthoai;
		this.tennguoimua = tennguoimua;
	}
	
	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSodienthoai() {
		return this.sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	
	public String getTennguoimua() {
		return this.tennguoimua;
	}

	public void setTennguoimua(String tennguoimua) {
		this.tennguoimua = tennguoimua;
	}
	
	public int getMahoadon() {
		return this.mahoadon;
	}

	public void setMahoadon(int mahoadon) {
		this.mahoadon = mahoadon;
	}

	public double getTongtien() {
		return this.tongtien;
	}

	public void setTongtien(double tongtien) {
		this.tongtien = tongtien;
	}

	public byte getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}

	public List<Hoadonchitiet> getHoadonchitiets() {
		return this.hoadonchitiets;
	}

	public void setHoadonchitiets(List<Hoadonchitiet> hoadonchitiets) {
		this.hoadonchitiets = hoadonchitiets;
	}

	public Hoadonchitiet addHoadonchitiet(Hoadonchitiet hoadonchitiet) {
		getHoadonchitiets().add(hoadonchitiet);
		hoadonchitiet.setHoadon(this);

		return hoadonchitiet;
	}

	public Hoadonchitiet removeHoadonchitiet(Hoadonchitiet hoadonchitiet) {
		getHoadonchitiets().remove(hoadonchitiet);
		hoadonchitiet.setHoadon(null);

		return hoadonchitiet;
	}

}