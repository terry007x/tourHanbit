package com.hanbit.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanbit.data.MemberManager;
import com.hanbit.data.ReviewManager;
import com.hanbit.vo.MemberVo;
import com.hanbit.vo.OrdersVo;
import com.hanbit.vo.PackageVo;
import com.hanbit.vo.QnaVo;
import com.hanbit.vo.ReviewVo;

@Repository
public class MemberDao {

	
	public static List<MemberVo> list()
	{
		return MemberManager.memberlist();
	}

	public int join(MemberVo m) 
	{
		return MemberManager.memberjoin(m);
	}
	
	public int memberupdate(MemberVo m)
	{
		return MemberManager.memberupdate(m);	
	}
	
	public String memberlogin(String mem_id, String mem_pwd) 
	{
		return MemberManager.memberlogin(mem_id,mem_pwd);
	}
	
	public MemberVo membermypage(String mem_id)
	{
		return MemberManager.membermypage(mem_id);
	}
	
	public String memberfindpassword(String mem_id, String mem_pwd)
	{
		return MemberManager.memberfindpassword(mem_id,mem_pwd);
	}
	
	public List<OrdersVo> paymentdetails(String mem_id)
	{
		return MemberManager.memberpaymentdetails(mem_id);
	}
	
	public List<QnaVo> myqna(String mem_id)
	{
		return MemberManager.memberqna(mem_id);
	}
	
	public int memberpaymentdetailsdelete(String orderid)
	{
		return MemberManager.paymentdetailsdelete(orderid);
	}

	public int idoverLap(String mem_id_ok)
	{
		return MemberManager.memberidoverlap(mem_id_ok);
	}
	
	public List<PackageVo> airplaneorders(String oceania)
	{
		return MemberManager.airplaneorders(oceania);
	}

	public String memberloginname(String mem_id, String mem_pwd) {
		
		return MemberManager.memberloginname(mem_id,mem_pwd);
	}
	
	public List<OrdersVo> recommendation(String mem_id,ArrayList<Integer> login_item_key)
	{
		return MemberManager.recommendation(mem_id,login_item_key);
	}
	
	public List<OrdersVo> memiditemkey(String mem_id)
	{
		return MemberManager.memiditemkey(mem_id);
	}
	
	public int memberleave(String mem_id,String mem_pwd)
	{
		return MemberManager.memberleave(mem_id,mem_pwd);
	}

	/*public MemberVo reviewonlyone(String mem_id) {
		
		return MemberManager.reivewonlyone(mem_id);
		
	}*/
	
}
