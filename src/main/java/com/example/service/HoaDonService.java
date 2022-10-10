package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Hoadon;
import com.example.repository.IHoaDonRepo;

@Service
public class HoaDonService {
	@Autowired IHoaDonRepo iHoaDonRepo;
	
	public List<Hoadon> getAll(){
		return (List<Hoadon>) iHoaDonRepo.findAll();
	}
	
	public Optional<Hoadon> findSPById(Long id){
		return  iHoaDonRepo.findById(id);
	}
	
	public void deleteHoaDon(Long id){
		iHoaDonRepo.deleteById(id);		
	}
	
	public Hoadon saveHoaDon(Hoadon hoaDon){
		return  iHoaDonRepo.save(hoaDon);
	}
	
}
