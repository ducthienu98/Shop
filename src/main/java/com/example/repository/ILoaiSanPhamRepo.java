package com.example.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.model.Loaisanpham;

public interface ILoaiSanPhamRepo extends CrudRepository<Loaisanpham, String>{ 

}
