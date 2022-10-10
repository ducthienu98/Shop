package com.example.controller;

import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.Sanpham;
import com.example.model.Sanphamsize;
import com.example.service.NhanVienService;
import com.example.service.ProductService;

@Controller
@Transactional
@RequestMapping("/sanpham/")
public class SanPhamController {
	@Autowired
	EntityManagerFactory factory;
	@Autowired
	ProductService productService;
	@Autowired
	NhanVienService nhanVienService;
	
	private Session getCurrentSession() {
		return factory.unwrap(SessionFactory.class).openSession();
	}
	
	private List<Sanpham> getSanPhamById(String id) {
		Session session = getCurrentSession();
		String hql = "from Sanpham";
		if(id.length() > 0 && id != null) {
			hql += " where masanpham like '%" + id+ "%' and trangthai =1";
		}
		Query<Sanpham> query = session.createQuery(hql, Sanpham.class);
		List<Sanpham> list = query.list();
		session.close();
		return list;
	}
	
	private List<Sanpham> getSearch(String id) {
		Session session = getCurrentSession();
		String hql = "from Sanpham";
		if(id.length() > 0 && id != null) {
			hql += " where tensanpham like '%" + id+ "%' and trangthai =1";
		}
		Query<Sanpham> query = session.createQuery(hql, Sanpham.class);
		List<Sanpham> list = query.list();
		session.close();
		return list;
	}
	
	
	
	@RequestMapping(value = "detail/quandai", method = RequestMethod.GET)
	public String showQuanDai(ModelMap model) {
		List<Sanpham> list = getSanPhamById("quan-dai");
		model.addAttribute("list", list);
		model.addAttribute("message", "Tất cả quần dài nam của chúng tôi");
		return "sanpham/detail";
	}

	@RequestMapping(value = "detail/quanngan", method = RequestMethod.GET)
	public String showQuanNgan(ModelMap model) {
		List<Sanpham> list = getSanPhamById("quan-ngan");
		model.addAttribute("list", list);
		model.addAttribute("message", "Tất cả quần short nam của chúng tôi");
		return "sanpham/detail";
	}

	@RequestMapping(value = "detail/aosomi", method = RequestMethod.GET)
	public String showAoSoMi(ModelMap model) {
		List<Sanpham> list = getSanPhamById("ao-dai");
		model.addAttribute("list", list);
		model.addAttribute("message", "Tất cả áo sơ mi nam của chúng tôi");
		return "sanpham/detail";
	}

	@RequestMapping(value = "detail/aophong", method = RequestMethod.GET)
	public String showAoPhong(ModelMap model) {
		List<Sanpham> list = getSanPhamById("ao-ngan");
		model.addAttribute("list", list);
		model.addAttribute("message", "Tất cả áo phông nam của chúng tôi");
		return "sanpham/detail";
	}

	@RequestMapping(value = "detail/giay", method = RequestMethod.GET)
	public String show(ModelMap model) {
		List<Sanpham> list = getSanPhamById("giay");
		model.addAttribute("list", list);
		model.addAttribute("message", "Tất cả giày nam của chúng tôi");
		return "sanpham/detail";
	}

	@RequestMapping(value = "detail/hanggiamgia", method = RequestMethod.GET)
	public String showSaleProduct(ModelMap model) {
		Session session = getCurrentSession();
		String hql1 = "from Sanpham where  magiamgia != 'GG01'";
		Query<Sanpham> query = session.createQuery(hql1, Sanpham.class);
		List<Sanpham> list = query.list();
		model.addAttribute("list", list);
		model.addAttribute("message", "Tất cả sản phẩm BIG SALE của chúng tôi");
		return "sanpham/detail";
	}
	
	@RequestMapping(value = "trangchu", method = RequestMethod.GET)
	public String homePage(ModelMap model) {	
		Session session = getCurrentSession();
		String hql1 = "from Sanpham where  magiamgia != 'GG01'";
		Query<Sanpham> query = session.createQuery(hql1, Sanpham.class);
		List<Sanpham> list1 = query.list();

		List<Sanpham> list2 = getSanPhamById("giay");
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "sanpham/trangchu";
	}

	@RequestMapping(value = "thongtinsanpham/{masanpham}", method = RequestMethod.GET)
	public String thongTinSanPham(ModelMap model, @PathVariable(name = "masanpham") String masanpham) {
		List<Sanpham> list = getSanPhamById(masanpham);
		model.addAttribute("list", list);

		if (masanpham.contains("giay")) {
			model.addAttribute("message", "Giày nam");
			List<Sanpham> listNew = getSanPhamById("giay");
			model.addAttribute("listNew", listNew);
		} else if (masanpham.contains("quan-ngan")) {
			List<Sanpham> listNew = getSanPhamById("quan-ngan");
			model.addAttribute("listNew", listNew);
			model.addAttribute("message", "Quần short nam");
		} else if (masanpham.contains("quan-dai")) {
			List<Sanpham> listNew = getSanPhamById("quan-dai");
			model.addAttribute("listNew", listNew);
			model.addAttribute("message", "Quần jeans nam");
		} else if (masanpham.contains("ao-ngan")) {
			List<Sanpham> listNew = getSanPhamById("ao-ngan");
			model.addAttribute("listNew", listNew);
			model.addAttribute("message", "Áo phôngnam");
		} else if (masanpham.contains("ao-dai")) {
			List<Sanpham> listNew = getSanPhamById("ao-dai");
			model.addAttribute("listNew", listNew);
			model.addAttribute("message", "Áo sơ mi nam");
		}
		return "sanpham/thongtinsanpham";
	}

	@RequestMapping(value = "detail/search", method = RequestMethod.POST)
	public String search(ModelMap model, HttpServletRequest request) {
		String ten = request.getParameter("search");
		List<Sanpham> list = getSearch(ten);
		model.addAttribute("list", list);
		model.addAttribute("message", "Sản phẩm bạn muốn tìm");
		return "sanpham/detail";
	}

	@RequestMapping(value = "thongtinsanpham/{masanpham}/{masanphamsize}", method = RequestMethod.GET)
	public String size(ModelMap model, @PathVariable("masanphamsize") String masanphamsize,
			@PathVariable("masanpham") String masanpham) {
		Session session = getCurrentSession();
		String hql = "from Sanphamsize where masanphamsize like '%" + masanphamsize+ "%' and trangthai = 1";
		Query<Sanphamsize> query = session.createQuery(hql, Sanphamsize.class);
		List<Sanphamsize> size = query.list();
		model.addAttribute("size", size);
		return "redirect:/sanpham/thongtinsanpham/" + masanpham;
	}
	
		
}
