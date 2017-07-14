package com.kitri.member2;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemController {
	@Resource(name = "memService")
	private Dao service;
	

	public void setService(Dao service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/main.do")
	public void main() {}
	
	@RequestMapping( value = "/form.do")
	public void form(HttpServletRequest req) {
		System.out.println("ÆûÀÌ´Ù");
		HttpSession session = req.getSession();
		session.setAttribute("idCheck", false);
	}
	
	@RequestMapping(value = "/idCheck.do")
	public ModelAndView idCheck(HttpServletRequest req, @RequestParam(value = "id") String id) {
		System.out.println(id);
		HttpSession session = req.getSession(false);
		ModelAndView mav = new ModelAndView("idCheck");
		String result = "";
		Member m = service.select(id);
		if(m == null) {
			result = "true";
			session.setAttribute("idCheck", true);
		} else {
			result = "false";
			session.setAttribute("idCheck", false);
		}
		System.out.println(session.getAttribute("idCheck"));
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value = "/join.do")
	public String join(Member m) {
		service.insert(m);
		return "login";
	}
	
	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest req, Member m) {
		Member m2 = service.select(m.getId());
		if(m2 == null || !m2.getPwd().equals(m.getPwd())) {
			return "login";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("id", m.getId());
			return "main";
		}
	}
	
	@RequestMapping(value = "/editForm.do")
	public ModelAndView editForm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("editForm");
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		Member m = service.select(id);
		mav.addObject("m", m);
		return mav;
	}
	
	@RequestMapping(value = "/edit.do")
	public String edit(Member m) {
		service.update(m);
		return "main";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/out.do")
	public String out(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		service.delete(id);
		session.removeAttribute("id");
		session.invalidate();
		return "login";
	}
	
	
	

}
