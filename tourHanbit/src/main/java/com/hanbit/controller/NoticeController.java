package com.hanbit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.NoticeDao;

@Controller // �ش� ���� ��Ʈ�� ���ϸ���
public class NoticeController {
	
	
	@Autowired //�ڵ����� ���ν����ִ°�. ��Ʈ�ѿ��� ã���� ���.
	private NoticeDao dao;
	
	
	
	
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}




	@RequestMapping("/listNotice.do") //���� �׼��� �ǹ�.
	public ModelAndView list(
						@RequestParam(value="pageNUM",defaultValue="1")int pageNUM, @RequestParam(value="cutSession", defaultValue="1") int cutSession, String searchField,String keyword,HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		String searchField2 = (String)session.getAttribute("searchField");
		String keyword2 = (String)session.getAttribute("keyword");
		
		System.out.println("�˻��ʵ�:"+searchField2);
		System.out.println("�˻���:"+keyword2);
		
		
		if(keyword != null && !keyword.trim().equals(""))
		{
			searchField2 = searchField;
			keyword2 = keyword;
			session.setAttribute("searchField", searchField2);
			session.setAttribute("keyword", keyword2);
		}
		if(cutSession==0)
		{
			session.setAttribute("searchField", null);
			session.setAttribute("keyword", null);
			keyword2=null;
			
		}
		
		
		
		
		int start,end;
		
		start = (pageNUM-1) * NoticeDao.pageSIZE + 1;
		end = start + NoticeDao.pageSIZE -1;
		
		
		System.out.println("cont");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dao.listNotice(start,end,searchField2,keyword2));
		mav.addObject("pageStr",dao.getPageStr(pageNUM,searchField2,keyword2));
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping("/detailNotice.do")
	public ModelAndView detailNotice(int notice_number)
	{			
		ModelAndView mav = new ModelAndView();
		dao.updateHit(notice_number);
		mav.addObject("n", dao.detailNotice(notice_number));
		return mav;
	}
	
	
	
	

	@RequestMapping("/deleteNotice.do")
	public ModelAndView deleteNotice(int notice_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/listNotice.do");
		mav.addObject("n",dao.deleteNotice(notice_number));
		
		return mav;
	}
	
	
	@RequestMapping("/updateNotice.do")
	public ModelAndView updateNotice(int notice_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("n",dao.deleteNotice(notice_number));
		
		return mav;
	}
	
	
	
	
	
	

}