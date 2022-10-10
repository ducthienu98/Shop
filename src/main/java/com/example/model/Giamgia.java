package com.example.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the giamgia database table.
 * 
 */
@Entity
@NamedQuery(name="Giamgia.findAll", query="SELECT g FROM Giamgia g")
public class Giamgia implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String magiamgia;

	private double chitietgiam;

	private byte trangthai;

	//bi-directional many-to-one association to Sanpham
	@OneToMany(mappedBy="giamgia")
	private List<Sanpham> sanphams;

	public Giamgia() {
	}

	public String getMagiamgia() {
		return this.magiamgia;
	}

	public void setMagiamgia(String magiamgia) {
		this.magiamgia = magiamgia;
	}

	public double getChitietgiam() {
		return this.chitietgiam;
	}

	public void setChitietgiam(double chitietgiam) {
		this.chitietgiam = chitietgiam;
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
		sanpham.setGiamgia(this);

		return sanpham;
	}

	public Sanpham removeSanpham(Sanpham sanpham) {
		getSanphams().remove(sanpham);
		sanpham.setGiamgia(null);

		return sanpham;
	}

}