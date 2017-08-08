//세연
package com.hanbit.controller;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanbit.dao.DetailPackageDao;
import com.hanbit.dao.QnaDao;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.ReviewVo;
import com.hanbit.vo.ScheduleVo;

import net.sf.json.JSONObject;
@Controller
public class MemberDetailPackageController2 {
	@Autowired
	private DetailPackageDao dao;
	
	
	
	public void setDao(DetailPackageDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/member/insertOrder.do")
	public ModelAndView insertOrder(int item_key,String item_key_sub,int adult_su,int child_su,int baby_su,int totPrice,String mem_id){
		System.out.println("mem_id     "+mem_id);
		ModelAndView mav= new ModelAndView();
		int orders_su= adult_su+child_su+baby_su;
		String ageGroup=adult_su+"/"+child_su+"/"+baby_su;
		int re=dao.insertOrder(item_key,item_key_sub,orders_su,ageGroup,mem_id,totPrice);
		mav.addObject("item_key_sub", item_key_sub);
		mav.setViewName("redirect:/member/memberDetail.do");
		return mav;
	}
	
	@RequestMapping("/member/listSubPackage.do")
	public ModelAndView listSubPackage(int item_key){
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("sp", dao.listSubPackage(item_key));
		String item_name=dao.detailPackage(item_key).getItem_name();
		String time=item_name.substring(1, item_name.indexOf("]"));

		mav.addObject("p", dao.detailPackage(item_key));
		mav.addObject("item_name",item_name);
		mav.addObject("time",time);
		mav.addObject("viewPage","memberListSubPackage.jsp");
		mav.setViewName("/member/memberTemplate03");
		return mav;
	}
	
	
	@RequestMapping("/member/detail.do")
	public ModelAndView detail(String item_key_sub,HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		int item_key=Integer.parseInt(item_key_sub.substring(0, item_key_sub.indexOf("_")));
		mav.addObject("s", dao.listSchedule(item_key));
		mav.addObject("i", dao.listImage(item_key));
		mav.addObject("p", dao.detailPackage(item_key));
		mav.addObject("sp", dao.detailSubPackage(item_key_sub));
		int re=dao.addHit(item_key);
		mav.addObject("id", session.getAttribute("id"));
		mav.addObject("name", session.getAttribute("name"));
		if(re==1){
			System.out.println("hit수가 올라갔습니다.");
		}
		
		mav.addObject("seats", 20-dao.detailSubPackage(item_key_sub).getReser_sub());
		mav.addObject("child_p",(int)(dao.detailSubPackage(item_key_sub).getPrice_sub()*0.8));
		mav.addObject("baby_p", (int)(dao.detailSubPackage(item_key_sub).getPrice_sub()*0.4));
		mav.addObject("item_key", item_key);
		ArrayList<Integer> list = new ArrayList<Integer>(); 
		int btnSu=dao.btnsu(item_key);
		for(int i=1;i<=btnSu;i++){
			list.add(i);
		}
		mav.addObject("btnSu_list",list);
		
		mav.addObject("viewPage", "memberDetail.jsp");
		mav.setViewName("/member/memberTemplate02");
		return mav;	
		
	}
	
	
	

	
}
