package com.example.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the loaisanpham database table.
 * 
 */
@Entity
@NamedQuery(name="Loaisanpham.findAll", query="SELECT l FROM Loaisanpham l")
public class Loaisanpham implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String maloai;

	private String tenloai;

	private byte trangthai;

	//bi-directional many-to-one association to Sanpham
	@OneToMany(mappedBy="loaisanpham")
	private List<Sanpham> sanphams;

	public Loaisanpham() {
	}

	public String getMaloai() {
		return this.maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public String getTenloai() {
		return this.tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public byte getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}

	public List<Sanpham> getSanphams() {
		return this.sanphams;
	}

	public void setSanphams(List<Sanpham> sanphams) {
		this.sanphams = sanphams;
	}

	public Sanpham addSanpham(Sanpham sanpham) {
		getSanphams().add(sanpham);
		sanpham.setLoaisanpham(this);

		return sanpham;
	}

	public Sanpham removeSanpham(Sanpham sanpham) {
		getSanphams().remove(sanpham);
		sanpham.setLoaisanpham(null);

		return sanpham;
	}

}