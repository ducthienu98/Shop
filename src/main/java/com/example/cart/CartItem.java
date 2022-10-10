package com.example.cart;

import com.example.model.Sanpham;

public class CartItem {
	private Sanpham sanPham;
	private int soLuong;
	private double tongTien;
	private String size;
	
	public CartItem(Sanpham sanPham, String size, int soLuong) {
		this.sanPham = sanPham;
		this.soLuong = soLuong;
		this.tongTien = sanPham.getGiaban();
		this.size = size;
	}

	public void setSanPham(Sanpham sanPham) {
		this.sanPham = sanPham;
	}
	
	public CartItem() {
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public Sanpham getSanPham() {
		return sanPham;
	}

	public double getTongTien() {
		tongTien = sanPham.getGiaban() * soLuong;
		return tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}	
	
	
}
