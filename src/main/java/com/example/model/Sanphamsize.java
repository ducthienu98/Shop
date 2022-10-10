package com.example.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the sanphamsize database table.
 * 
 */
@Entity
@NamedQuery(name="Sanphamsize.findAll", query="SELECT s FROM Sanphamsize s")
public class Sanphamsize implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int masanphamsize;

	private int soluong;

	private byte trangthai;

	//bi-directional many-to-one association to Sanpham
	@ManyToOne
	@JoinColumn(name="masanpham")
	private Sanpham sanpham;

	//bi-directional many-to-one association to Size
	@ManyToOne
	@JoinColumn(name="masize")
	private Size size;

	public Sanphamsize() {
	}

	public int getMasanphamsize() {
		return this.masanphamsize;
	}

	public void setMasanphamsize(int masanphamsize) {
		this.masanphamsize = masanphamsize;
	}

	public int getSoluong() {
		return this.soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public byte getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}


	public Sanpham getSanpham() {
		return this.sanpham;
	}

	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}

	public Size getSize() {
		return this.size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

}