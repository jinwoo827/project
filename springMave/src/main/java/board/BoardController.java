package board;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource(name="boardService")
	private Service service;
	
	@RequestMapping(value = "/board/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("board/list");
		ArrayList<Article> list = (ArrayList<Article>) service.selectAll();
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value = "/board/write.do")
	public String write(Article a) {
		service.insert(a);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value = "/board/writeForm.do")
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value = "/board/detail.do")
	public ModelAndView detail(@RequestParam("num") int num) {
		System.out.println(num+"[보드콘트롤러]");
		ModelAndView mav = new ModelAndView("board/detail");
		Article a = service.select(num);
		ArrayList<Article> reps = (ArrayList<Article>) service.selectByParentNum(num);
		a.setReps(reps);
		mav.addObject("a",a);
		return mav;
		
	}
	
	@RequestMapping(value = "/board/reply.do")
	public ModelAndView reply(Article a) {
		service.insert(a);
		System.out.println(a+"aaa");
		ArrayList<Article> list = (ArrayList<Article>) service.selectByParentNum(a.getParent_num());
		ModelAndView mav = new ModelAndView("board/reply");
		mav.addObject("list",list);
		System.out.println(list);
		return mav;
	}
	
	@RequestMapping(value = "/board/edit.do")
	public String edit(Article a) {
		service.update(a);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value = "/board/del.do")
	public String del(@RequestParam("num") int num) {
		service.delete(num);
		return "redirect:/board/list.do";
	}

}
