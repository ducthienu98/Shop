package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Nhanvien;
import com.example.repository.INhanVienRepo;

@Service
public class NhanVienService {

	@Autowired
	INhanVienRepo iSanPhamSizeRepo;

	public void deleteNV(String id) {
		iSanPhamSizeRepo.deleteById(id);
		System.out.println("delete thanh cong");
	}

	public List<Nhanvien> getAll() {
		return (List<Nhanvien>) iSanPhamSizeRepo.findAll();
	}

	public void saveNV(Nhanvien nhanVien) {
		iSanPhamSizeRepo.save(nhanVien);
		System.out.println("save thanh cong");
	}

	public Optional<Nhanvien> findNVById(String id) {
		return iSanPhamSizeRepo.findById(id);
	}

}
