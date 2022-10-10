package com.example.service;

import java.util.Optional;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Loaisanpham;
import com.example.repository.ILoaiSanPhamRepo;

@Service
public class LoaiSanPhamService {
	@Autowired
	EntityManagerFactory factory;
	@Autowired
	ILoaiSanPhamRepo iLoaiSanPhamRepo;
	
	private Session getCurrentSession() {
		return factory.unwrap(SessionFactory.class).openSession();
	}
	
	public Double coutLoaiSP(String loaiSP) {
		Session session = getCurrentSession();
		String hql="SELECT sum(soluong) FROM Sanpham inner join HoaDonChiTiet on Sanpham.masanpham = HoaDonChiTiet.masanpham where maloai = 'Ao01'";	
		Query query = session.createQuery(hql);
		Double tong = (Double) query.uniqueResult();		
		return tong;
	}
	public Optional<Loaisanpham> findById(String id){
		return  iLoaiSanPhamRepo.findById(id);
	}
}
