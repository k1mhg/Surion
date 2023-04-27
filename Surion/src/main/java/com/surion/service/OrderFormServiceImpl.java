package com.surion.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;
import com.surion.repository.OrderFormRepository;

@Service
public class OrderFormServiceImpl implements OrderFormService{
	@Autowired
	OrderFormRepository orderFormRepository;
	
//	//정비사 등록폼 저장
//	@Override
//	public void save(OrderJoin orderJoin) {
//		orderFormRepository.save(orderJoin);
//	}
//	
	//게시물 등록폼 저장
	@Override
	public void save(OrderForm orderForm) {
		orderFormRepository.save(orderForm);
	}
	
	@Override
	public void orderList(Model model, OrderListPaging pa) {
		List<OrderForm> lst = orderFormRepository.findByAll();
		System.out.println(lst);
		model.addAttribute("list", lst);
		
	}
	
	@Override
	public void transaction(Model model) {
		// TODO Auto-generated method stub
		
	}
	
	
	//이미지 업로드 되는 메소드
	@Override
	public String upload(HttpServletRequest request, RedirectAttributes rttr) {
		
		MultipartRequest multi = null;
		
		String Save = request.getRealPath("/resources/images/order");
		int MaxSize = 1024 * 1024 * 5;
		

		try {
			multi = new MultipartRequest(request, Save, MaxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(Save);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		File newFile = multi.getFile("imageUp");
		String member_id = multi.getParameter("member_id");
		String experience = multi.getParameter("experience");
	    String shopName = multi.getParameter("shopName");
	    String intro = multi.getParameter("intro");
	    String startTime = multi.getParameter("startTime");
	    String endTime = multi.getParameter("endTime");
	    String category = multi.getParameter("category");
	    String address = multi.getParameter("address");
	    String imgname = null;

	    
	    if(member_id.equals("") || member_id == "" ||
	        experience.equals("") || experience == "" ||
	        shopName.equals("") || shopName == "" ||
	        intro.equals("") || intro =="" ||
	        startTime.equals("") || startTime == "" ||
	        endTime.equals("")|| endTime =="" ||
	        category.equals("")|| category ==""){
	    	 return "redirect:/order2/orderFormProc";
	    }
	    
		
		//정상적으로 업로드가 되면
		if(newFile != null) {
			String lastName = newFile.getName().substring(newFile.getName().lastIndexOf(".")+1).toUpperCase();
			//이전의 올린 게시글에  정보를 불러오는 메서드가 있어야한다.
			//OrderForm oldBoard = orderFormRepository.findByBoard(member_id);
			//File oldFile = new File(Save + "/" + 예전파일이름);
			
			rttr.addFlashAttribute("msg", "등록이 완료되었습니다.");
			if(lastName.equals("PNG") || lastName.equals("JPG")) {
				imgname = newFile.getName();
				
			}else {
				if(newFile.exists()) {
					newFile.delete();
				}
				
				rttr.addFlashAttribute("er", "er");
				System.out.println("삭제");
				rttr.addFlashAttribute("msg", "이미지파일은 PNG, JPG만 가능합니다.");
				return "redirect:/order2/orderFormProc";
			}
		}else {
			rttr.addFlashAttribute("er", "er");
			rttr.addFlashAttribute("msg", "이미지 전송이 실패하였습니다.");
			return "redirect:/order2/orderFormProc";
		}

		
		OrderForm orderForm = new OrderForm();
	    orderForm.setMember_id(member_id);
	    orderForm.setShopName(shopName);
	    orderForm.setIntro(intro);
	    orderForm.setStartTime(startTime);
	    orderForm.setEndTime(endTime);
	    orderForm.setCategory(category);
	    orderForm.setExperience(experience);
	    orderForm.setImg(imgname);
	    orderForm.setAddress(address);

		
		System.out.println(orderForm);
		orderFormRepository.save(orderForm);
		
		return "redirect:/order2/orderList";
	}
	

	@Override
	public int check(OrderJoin orderJoin) {
		int result = orderFormRepository.check(orderJoin);
		return result;
	}


	@Override
	public String join(OrderJoin oj, RedirectAttributes rttr) {
		if(oj.getMechanic_id().equals("") || oj.getMechanic_id() == "" ||
				   oj.getShopName().equals("") || oj.getShopName() == "" ||
				   oj.getName().equals("") || oj.getName() == "" ||
			       oj.getAddress().equals("") || oj.getAddress() == "") {
					rttr.addFlashAttribute("msgTitle", "Error Message!");
					rttr.addFlashAttribute("msg", "입력창에 공백이 있습니다.");
					rttr.addFlashAttribute("mechanic", oj.getMechanic_id());
					rttr.addFlashAttribute("shop", oj.getShopName());
					rttr.addFlashAttribute("na", oj.getName());
					rttr.addFlashAttribute("ad", oj.getAddress());
					return "redirect:/member/join";
				}else {
					orderFormRepository.join(oj);
					rttr.addFlashAttribute("msgTitle", "Success Message!");
					rttr.addFlashAttribute("msg", "회원가입 성공!");
					return "redirect:/";
				}
				
	}

	

//	@Override
//	public void join(OrderJoin orderJoin, RedirectAttributes rttr) {
//		
//	}

	

	


	
}