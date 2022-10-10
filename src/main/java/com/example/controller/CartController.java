package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManagerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.cart.Cart;
import com.example.cart.CartItem;
import com.example.model.Hoadon;
import com.example.model.Hoadonchitiet;
import com.example.model.Sanpham;

@Controller
@Transactional
@RequestMapping("/sanpham/")
public class CartController {

	@Autowired
	EntityManagerFactory factory;

	@Autowired
	public JavaMailSender emailSender;

	private Session getCurrentSession() {
		return factory.unwrap(SessionFactory.class).openSession();
	}

	@SuppressWarnings("unused")
	private List<Sanpham> getSanPhamById(String id) {
		Session session = getCurrentSession();
		String hql = "from Sanpham";
		if (id.length() > 0 && id != null) {
			hql += " where masanpham like '%" + id + "%'";
		}
		Query<Sanpham> query = session.createQuery(hql, Sanpham.class);
		List<Sanpham> list = query.list();
		session.close();
		return list;
	}

	@SuppressWarnings("unused")
	private void insertHoaDonCT(int soluong, double thanhtien, int mahoadon, String masanpham, String tensize) {
		Session session = getCurrentSession();
		session.getTransaction().begin();
		Hoadon hoadon = (Hoadon) session.get(Hoadon.class, mahoadon);
		Sanpham sanpham = (Sanpham) session.get(Sanpham.class, masanpham);
		Hoadonchitiet hoadonchitiet = new Hoadonchitiet(soluong, thanhtien, hoadon, sanpham, tensize);
		hoadon.getHoadonchitiets().add(hoadonchitiet);
		sanpham.getHoadonchitiets().add(hoadonchitiet);
		session.save(hoadonchitiet);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unused")
	private void insertHoaDon(String diachi, String email, String sodienthoai, double tongTien, String tennguoimua) {
		Session session = getCurrentSession();
		session.getTransaction().begin();
		Hoadon hoaDon = new Hoadon(tongTien, diachi, email, sodienthoai, tennguoimua);
		session.save(hoaDon);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unused")
	private int getIDHD() {
		Session session = getCurrentSession();
		session.getTransaction().begin();
		String hql = "SELECT mahoadon FROM Hoadon ORDER BY mahoadon DESC";
		List<Integer> list = session.createQuery(hql).getResultList();
		int id = list.get(0);
		session.getTransaction().commit();
		session.close();
		return id;
	}

	@SuppressWarnings("unused")
	private Hoadon getOneHD(int id) {
		Session session = getCurrentSession();
		session.getTransaction().begin();
		Hoadon hd = (Hoadon) session.get(Hoadon.class, id);
		session.getTransaction().commit();
		session.close();
		return hd;
	}

	@RequestMapping(value = "addCart/{masanpham}/{tensize}/{soLuong}", method = RequestMethod.GET)
	public String addCart(HttpSession session, @PathVariable("tensize") String tensize,
			@PathVariable("soLuong") int soLuong, @PathVariable("masanpham") String masanpham) {
		Sanpham sanPham = getSanPhamById(masanpham).get(0);
		@SuppressWarnings("unchecked")
		HashMap<String, CartItem> cart = (HashMap<String, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, CartItem>();
		}
		Cart cartItem = new Cart();
		cart = cartItem.addCart(masanpham, soLuong, tensize, sanPham, cart);
		session.setAttribute("cart", cart);
		return "redirect:/sanpham/thongtinsanpham/" + masanpham;
	}

	@RequestMapping(value = "editCart/{masanpham}/{soLuong}", method = RequestMethod.GET)
	public String editCart(HttpSession session, @PathVariable("masanpham") String masanpham,
			@PathVariable("soLuong") int soLuong) {
		@SuppressWarnings("unchecked")
		HashMap<String, CartItem> cart = (HashMap<String, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, CartItem>();
		}
		Cart cartItem = new Cart();
		cart = cartItem.editCart(masanpham, soLuong, cart);
		session.setAttribute("cart", cart);
		return "sanpham/cart";
	}

	@RequestMapping(value = "deleteCart/{masanpham}", method = RequestMethod.GET)
	public String deleteCart(HttpSession session, @PathVariable("masanpham") String masanpham) {
		@SuppressWarnings("unchecked")
		HashMap<String, CartItem> cart = (HashMap<String, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<String, CartItem>();
		}
		Cart cartItem = new Cart();
		cart = cartItem.deleteCart(masanpham, cart);
		session.setAttribute("cart", cart);
		return "sanpham/cart";
	}

	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String showCart() {
		return "sanpham/cart";
	}

	@RequestMapping(value = "thanhtoan/{tongTien}", method = RequestMethod.GET)
	public String thanhToan(HttpSession session, @PathVariable("tongTien") double tongTien) {
		session.setAttribute("tien", tongTien);
		return "sanpham/thanhtoan";
	}

	@RequestMapping(value = "thanhtoan/{tien}", method = RequestMethod.POST)
	public String thanhToanHoaDon(HttpSession session, HttpServletRequest req, @PathVariable("tien") double tien) {
		String ten = req.getParameter("txtTenKH");
		String email = req.getParameter("txtEmailKH");
		String soDT = req.getParameter("txtSoDTKH");
		String diaChi = req.getParameter("txtDiaChiKH");
		insertHoaDon(diaChi, email, soDT, tien, ten);
		;
		int idHD = getIDHD();
		@SuppressWarnings("unchecked")
		HashMap<String, CartItem> cart = (HashMap<String, CartItem>) session.getAttribute("cart");
		for (Map.Entry<String, CartItem> cartItem : cart.entrySet()) {
			String maSP = cartItem.getValue().getSanPham().getMasanpham();
			String size = cartItem.getValue().getSize();
			int soLuong = cartItem.getValue().getSoLuong();

			Hoadon hoaDon = getOneHD(idHD);
			insertHoaDonCT(soLuong, hoaDon.getTongtien(), hoaDon.getMahoadon(), maSP, size);
		}

		// Create a Simple MailMessage.
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("CẢM ƠN QUÝ KHÁCH ĐÃ MUA SẢN PHẨM");
		message.setText("Shop Store Men xin trân thành cảm ơn quý khách hàng vì đã mua sản phẩm của shop.");

		// Send Message!
		this.emailSender.send(message);
		return "redirect:/sanpham/trangchu";
	}

}
