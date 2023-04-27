package com.surion.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.surion.entity.Member;
import com.surion.entity.OrderForm;
import com.surion.entity.OrderJoin;
import com.surion.entity.OrderListPaging;
import com.surion.service.OrderFormService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/order2/*")
public class OrderTwoController {

	
	@Autowired
	OrderFormService orderFormService;
	
	//정비사 등록폼
	@RequestMapping("/orderJoin")
	public String orderJoin() {
		return "/order2/orderJoin";
	}
	
	//정비사리스트
    @GetMapping("/orderList")
    public String orderList(Model model, OrderListPaging pa) {
    	orderFormService.orderList(model, pa);
        return "/order2/orderList";
    }
    
    
    //게시물등록폼
    @RequestMapping("/orderForm")
    public String orderForm() {
        return "/order2/orderForm";
    }
    
    //사진업로드
    @PostMapping("/upload")
    public String upload(HttpServletRequest request, RedirectAttributes rttr) {
    	return orderFormService.upload(request, rttr);
    }
    
    //게시물등록 오류
    @GetMapping("/orderFormProc")
    public String orderFormProc() {
    	return "/order2/orderFormProc";
    }
    
    @RequestMapping("/orderList")
    public String orderList() {
        return "/order2/orderList";
    }
    
    @RequestMapping("/transaction")
    public String transaction() {
        return "/order2/transaction";
    }
    

    //중복체크
  	@GetMapping("/check")
  	public @ResponseBody int check(OrderJoin orderJoin) {
  		System.out.println(orderJoin.getMechanic_id());
  		int result = orderFormService.check(orderJoin);
  		return result;
  	}
  	
  	//정비사 등록
  	@PostMapping("/join")
  	public String join(OrderJoin orderJoin, RedirectAttributes rttr) {
  		return orderFormService.join(orderJoin, rttr);
  	}



}
