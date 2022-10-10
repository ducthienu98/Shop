package com.example.cart;

import java.util.HashMap;
import java.util.Map;

import com.example.model.Sanpham;



public class Cart {
	
	public HashMap<String, CartItem> addCart(String masanpham, int soLuong, String size,Sanpham sanPham, HashMap<String, CartItem> cart) {
		CartItem cartItem = new CartItem(sanPham, size, soLuong);
		if(cartItem != null && cart.containsKey(masanpham)) {
			cartItem = cart.get(masanpham);
			cartItem.setSoLuong(soLuong);
			cartItem.setTongTien(cartItem.getSoLuong() * cartItem.getSanPham().getGiaban());
		}
		cart.put(masanpham, cartItem);
		return cart;
	}
	
	public HashMap<String, CartItem> editCart(String masanpham, int soLuong, HashMap<String, CartItem> cart) {
		if(cart == null) {
			return cart;
		}
		CartItem cartItem = new CartItem();
		if(cart.containsKey(masanpham)) {
			cartItem = cart.get(masanpham);
			cartItem.setSoLuong(soLuong);
			double tongTien = soLuong * cartItem.getSanPham().getGiaban(); 
			cartItem.setTongTien(tongTien);
		}
		cart.put(masanpham, cartItem);
		return cart;
	}
	
	public HashMap<String, CartItem> deleteCart(String masanpham, HashMap<String, CartItem> cart) {
		if(cart == null) {
			return cart;
		}
		if(cart.containsKey(masanpham)) {
			cart.remove(masanpham);
		}
		return cart;
	}
	
	public int tongSoLuong(HashMap<String, CartItem> cart) {
		int tong = 0;
		for(Map.Entry<String, CartItem> cartItem : cart.entrySet()) {
			tong += cartItem.getValue().getSoLuong();	
		}
		return tong;
	}
	
	public double tongTien(HashMap<String, CartItem> cart) {
		double tong = 0;
		for(Map.Entry<String, CartItem> cartItem : cart.entrySet()) {
			tong += cartItem.getValue().getTongTien();	
		}
		return tong;
	}
	
}
