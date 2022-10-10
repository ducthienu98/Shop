package com.example.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the size database table.
 * 
 */
@Entity
@NamedQuery(name="Size.findAll", query="SELECT s FROM Size s")
public class Size implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String masize;

	private String tensize;

	private byte trangthai;

	//bi-directional many-to-one association to Sanphamsize
	@OneToMany(mappedBy="size")
	private List<Sanphamsize> sanphamsizes;

	public Size() {
	}

	public String getMasize() {
		return this.masize;
	}

	public void setMasize(String masize) {
		this.masize = masize;
	}

	public String getTensize() {
		return this.tensize;
	}

	public void setTensize(String tensize) {
		this.tensize = tensize;
	}

	public byte getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(byte trangthai) {
		this.trangthai = trangthai;
	}

	public List<Sanphamsize> getSanphamsizes() {
		return this.sanphamsizes;
	}

	public void setSanphamsizes(List<Sanphamsize> sanphamsizes) {
		this.sanphamsizes = sanphamsizes;
	}

	public Sanphamsize addSanphamsize(Sanphamsize sanphamsize) {
		getSanphamsizes().add(sanphamsize);
		sanphamsize.setSize(this);

		return sanphamsize;
	}

	public Sanphamsize removeSanphamsize(Sanphamsize sanphamsize) {
		getSanphamsizes().remove(sanphamsize);
		sanphamsize.setSize(null);

		return sanphamsize;
	}

}