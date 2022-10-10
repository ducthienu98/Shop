package com.example.controller;

import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Hoadon;
import com.example.model.Hoadonchitiet;
import com.example.model.Nhanvien;
import com.example.model.SanPhamVO;
import com.example.model.Sanpham;
import com.example.service.GiamGiaService;
import com.example.service.HoaDonChiTietService;
import com.example.service.HoaDonService;
import com.example.service.LoaiSanPhamService;
import com.example.service.NhanVienService;
import com.example.service.ProductService;

@Controller
@Transactional
@RequestMapping("/sanpham/")
public class QuanLyController {
	@Autowired
	EntityManagerFactory factory;
	@Autowired
	ProductService productService;
	@Autowired
	NhanVienService nhanVienService;
	@Autowired
	HoaDonService hoaDonService;
	@Autowired
	HoaDonChiTietService hoaDonChiTietService;
	@Autowired
	GiamGiaService giamGiaService;
	@Autowired
	LoaiSanPhamService loaiSanPhamService;

	private Session getCurrentSession() {
		return factory.unwrap(SessionFactory.class).openSession();
	}

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String homeAdmin(ModelMap model, @RequestParam(defaultValue = "10") int size,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "JohnToan") String loaiSP) {
		Session session = getCurrentSession();
		String hql1 = "select count(soluong) from Sanphamsize";
		String hql2 = "select count(mahoadon) from Hoadon";
		String hql3 = "select sum(tongtien) from Hoadon";
		String hql4 = "from Sanpham where masanpham like '%" + loaiSP + "%'";
		String hql5 = "select count(manv) from Nhanvien";

		Query query1 = session.createQuery(hql1);
		Long tong1 = (Long) query1.uniqueResult();

		Query query2 = session.createQuery(hql2);
		Long tong2 = (Long) query2.uniqueResult();

		Query query3 = session.createQuery(hql3);
		Double tong3 = (Double) query3.uniqueResult();

		Query query5 = session.createQuery(hql5);
		Long tong5 = (Long) query5.uniqueResult();

		Query<Sanpham> query4 = session.createQuery(hql4, Sanpham.class);
		List<Sanpham> list4 = query4.list();
		System.out.println(list4.size() + "liiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

		List<Sanpham> list;
		if (list4.size() == 0) {
			list = productService.getAllByPage(size, page);
		} else {
			list = list4;
		}

		List<Nhanvien> listNhanVien = nhanVienService.getAll();
		List<Hoadon> listHD = hoaDonService.getAll();
		List<Hoadonchitiet> listHoaDonChiTiet = hoaDonChiTietService.getAll();

		model.addAttribute("tong1", tong1);
		model.addAttribute("tong2", tong2);
		model.addAttribute("tong3", tong3);
		model.addAttribute("tong5", tong5);
		model.addAttribute("list", list);
		model.addAttribute("listNhanVien", listNhanVien);
		model.addAttribute("listHoaDon", listHD);
		model.addAttribute("listHoaDonChiTiet", listHoaDonChiTiet);
//		model.addAttribute("coutAo01", loaiSanPhamService.coutLoaiSP("Ao01"));

		System.out.println(list.size() + "lllllllllllllllllllllll");
		return "sanpham/indexAdmin";
	}

	@RequestMapping(value = "admin/create", method = RequestMethod.POST)
	public String CreateSP(@ModelAttribute SanPhamVO sanphamvo) {
		Sanpham sanpham = new Sanpham();

		System.out.println(sanphamvo.getMasanpham());

		sanpham.setMasanpham(sanphamvo.getMasanpham());
		sanpham.setTensanpham(sanphamvo.getTensanpham());
		sanpham.setHinhanh(sanphamvo.getHinhanh());
		sanpham.setMau(sanphamvo.getMau());
		sanpham.setMotasanpham(sanphamvo.getMotasanpham());
		sanpham.setGiaban(sanphamvo.getGiaban());
		sanpham.setGianhap(sanphamvo.getGianhap());
		sanpham.setNgaynhapkho(sanphamvo.getNgaynhapkho());
		sanpham.setTrangthai(sanphamvo.getTrangthai());
		sanpham.setGiamgia(giamGiaService.findById(sanphamvo.getMagiamgia()).get());
		sanpham.setLoaisanpham(loaiSanPhamService.findById(sanphamvo.getMaloai()).get());

		productService.saveSP(sanpham);
		System.out.println("ok");
		return "redirect:/sanpham/admin";

	}

	@RequestMapping(value = "admin/create", method = RequestMethod.GET)
	public String getCreateSP() {
		return "sanpham/createAdmin";
	}

	@RequestMapping(value = "admin/edit", method = RequestMethod.GET)
	public String getEditSP(ModelMap model, @RequestParam String id) {
		Sanpham sp = null;
		if (productService.findSPById(id) == null) {
			System.out.println("nillllllllllllllllllllllllllllllllllllll");
		} else {
			sp = productService.findSPById(id).get();
		}

		model.addAttribute("product", sp);
		return "sanpham/editAdmin";
	}

	@RequestMapping(value = "admin/edit", method = RequestMethod.POST)
	public String EditSP(@ModelAttribute SanPhamVO sanphamvo) {
		Sanpham sanpham = new Sanpham();

		System.out.println(sanphamvo.getMasanpham());

		sanpham.setMasanpham(sanphamvo.getMasanpham());
		sanpham.setTensanpham(sanphamvo.getTensanpham());
		sanpham.setHinhanh(sanphamvo.getHinhanh());
		sanpham.setMau(sanphamvo.getMau());
		sanpham.setMotasanpham(sanphamvo.getMotasanpham());
		sanpham.setGiaban(sanphamvo.getGiaban());
		sanpham.setGianhap(sanphamvo.getGianhap());
		sanpham.setNgaynhapkho(sanphamvo.getNgaynhapkho());
		sanpham.setTrangthai(sanphamvo.getTrangthai());
		sanpham.setGiamgia(giamGiaService.findById(sanphamvo.getMagiamgia()).get());
		sanpham.setLoaisanpham(loaiSanPhamService.findById(sanphamvo.getMaloai()).get());

		productService.saveSP(sanpham);
		System.out.println("ok");
		return "redirect:/sanpham/admin";

	}
	// Nhân Viên

	@RequestMapping(value = "admin/createNV", method = RequestMethod.GET)
	public String getCreateNV() {
		return "sanpham/createNhanVien";
	}

	@RequestMapping(value = "admin/createNV", method = RequestMethod.POST)
	public String CreateNV(@ModelAttribute Nhanvien nhanVien) {
		nhanVienService.saveNV(nhanVien);
		System.out.println("ok");
		return "redirect:/sanpham/admin";

	}

	@RequestMapping(value = "admin/editNV", method = RequestMethod.GET)
	public String getEditNV(ModelMap model, @RequestParam String id) {
		Nhanvien nv = null;
		if (nhanVienService.findNVById(id) == null) {
			System.out.println("nillllllllllllllllllllllllllllllllllllll");
		} else {
			nv = nhanVienService.findNVById(id).get();
		}

		model.addAttribute("nhanvien", nv);
		return "sanpham/editNhanVien";
	}

	@RequestMapping(value = "admin/editNV", method = RequestMethod.POST)
	public String EditNV(@ModelAttribute Nhanvien nhanVien) {
		nhanVienService.saveNV(nhanVien);
		System.out.println("ok");
		return "redirect:/sanpham/admin";

	}

}
