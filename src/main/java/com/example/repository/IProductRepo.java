package com.example.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.model.Sanpham;

public interface IProductRepo extends PagingAndSortingRepository<Sanpham, String>{
	
}
