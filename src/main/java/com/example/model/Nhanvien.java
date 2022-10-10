package com.example.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;


/**
 * The persistent class for the nhanvien database table.
 * 
 */
@Entity
@NamedQuery(name="Nhanvien.findAll", query="SELECT n FROM Nhanvien n")
public class Nhanvien implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String manv;

	private String matkhau;

	private Date ngayvao;

	private String quequan;

	private String sodt;

	private String tennv;

	private byte vaitro;

	public Nhanvien() {
	}

	public String getManv() {
		return this.manv;
	}

	public void setManv(String manv) {
		this.manv = manv;
	}

	public String getMatkhau() {
		return this.matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public Date getNgayvao() {
		return this.ngayvao;
	}

	public void setNgayvao(Date ngayvao) {
		this.ngayvao = ngayvao;
	}

	public String getQuequan() {
		return this.quequan;
	}

	public void setQuequan(String quequan) {
		this.quequan = quequan;
	}

	public String getSodt() {
		return this.sodt;
	}

	public void setSodt(String sodt) {
		this.sodt = sodt;
	}

	public String getTennv() {
		return this.tennv;
	}

	public void setTennv(String tennv) {
		this.tennv = tennv;
	}

	public byte getVaitro() {
		return this.vaitro;
	}

	public void setVaitro(byte vaitro) {
		this.vaitro = vaitro;
	}

}