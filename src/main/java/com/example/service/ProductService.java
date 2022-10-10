package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Sanpham;
import com.example.repository.IProductRepo;

@Service
public class ProductService {
	@Autowired
	IProductRepo iProductRepo;

	public List<Sanpham> getAll() {
		return (List<Sanpham>) iProductRepo.findAll();
	}

	public List<Sanpham> getAllByPage(int size, int page) {
		Pageable pageable = PageRequest.of(page, size);
		return iProductRepo.findAll(pageable).getContent();

	}

	public Sanpham saveSP(Sanpham sanpham) {
		return iProductRepo.save(sanpham);
	}

	public Optional<Sanpham> findSPById(String id) {
		return iProductRepo.findById(id);
	}

	public void deleteSP(String id) {
		iProductRepo.deleteById(id);
	}

}
