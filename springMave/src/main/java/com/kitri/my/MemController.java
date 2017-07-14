package com.kitri.my;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemController {
	@Resource(name="memService")
	private Service service;
	
	@RequestMapping(value = "/member/loginForm.do")
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/member/form.do")
	public void form(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("idCheck", false);
	}
	
	@RequestMapping(value = "/member/idCheck.do")
	public ModelAndView idCheck(HttpServletRequest req, @RequestParam("id") String id) {
		System.out.println(id);
		HttpSession session = req.getSession(false);
		ModelAndView mav = new ModelAndView("member/idCheck");
		String result = "";
		Member m = service.getMember(id);
		if(m == null) {
			result = "사용가능";
			session.setAttribute("idCheck", true);
		} else {
			result = "사용 불가능";
			session.setAttribute("idCheck", false);
		}
		System.out.println(session.getAttribute("idCheck"));
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value = "/member/join.do")
	public String join(Member m) {
		service.join(m);
		return "member/login";
	}
	
	@RequestMapping(value = "/member/login.do")
	public String login(HttpServletRequest req, Member m) {
		System.out.println(m);
		Member m2 = service.getMember(m.getId());
		if(m2 == null || !m2.getPwd().equals(m.getPwd())) {
			System.out.println("로그인실패");
			return "member/login";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("id", m.getId());
			return "member/main";
		}
	}
	
	@RequestMapping(value = "/member/editForm.do")
	public ModelAndView editForm(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		Member m = service.getMember(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("m", m);
		mav.setViewName("member/editForm");
		return mav;
	}
	
	@RequestMapping(value = "/member/edit.do")
	public String edit(Member m) {
		service.editInfo(m);
		return "member/main";
	}
	
	@RequestMapping(value = "member/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.invalidate();
		return "member/login";
	}
	
	@RequestMapping(value = "member/out.do")
	public String out(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String)session.getAttribute("id");
		service.delMember(id);
		session.removeAttribute("id");
		session.invalidate();
		return "member/login";
	}

}
