package com.example.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Giamgia;
import com.example.model.Loaisanpham;
import com.example.repository.IGiamGiaRepo;

@Service
public class GiamGiaService {
	@Autowired
	IGiamGiaRepo iGiamGiaRepo;
	
	public Optional<Giamgia> findById(String id){
		return  iGiamGiaRepo.findById(id);
	}

}
