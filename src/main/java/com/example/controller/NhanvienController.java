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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.Nhanvien;

@Controller
@Transactional
@RequestMapping("/sanpham/")
public class NhanvienController {

	@Autowired
	EntityManagerFactory factory;

	private Session getCurrentSession() {
		return factory.unwrap(SessionFactory.class).openSession();
	}

	@SuppressWarnings("unused")
	private List<Nhanvien> getNhanvienById(String id) {
		Session session = getCurrentSession();
		String hql = "from Nhanvien";
		if (id.length() > 0 && id != null) {
			hql += " where manv like '%" + id + "%'";
		}
		Query<Nhanvien> query = session.createQuery(hql, Nhanvien.class);
		List<Nhanvien> list = query.list();
		session.close();
		return list;
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String getlogin() {
		return "sanpham/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, HttpServletRequest request) {
		Session session = getCurrentSession();
		String username = request.getParameter("manv");
		String password = request.getParameter("matkhau");
		String hql1 = "select n from Nhanvien n where  manv = '"+username+"'";
		Query<Nhanvien> query = session.createQuery(hql1, Nhanvien.class);
		List<Nhanvien> lstResult = query.getResultList();
		if (lstResult == null || lstResult.isEmpty()) {
			model.addAttribute("message", "Tài khoản không tồn tại !");
			return "sanpham/login";
		} else if (!password.equals(lstResult.get(0).getMatkhau())) {
			model.addAttribute("message", "Sai mật khẩu !");
			return "sanpham/login";
		}
		return "redirect:/sanpham/admin";
	}

}
