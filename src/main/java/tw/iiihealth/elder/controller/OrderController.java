package tw.iiihealth.elder.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.elder.model.Order;
import tw.iiihealth.elder.model.OrderMailService;
import tw.iiihealth.elder.model.OrderService;

@Controller
@RequestMapping(path="/order")
@Transactional
public class OrderController {
	
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	private OrderMailService orderMailService;

	
	// 全部訂單
	@RequestMapping(path = "/findall")
	public String findAllOrder(Model model) {
		List<Order> list = orderService.findAll();
		
		model.addAttribute("list", list);
				
		return "equip/order-list";
	}
	
	
	// 訂單細項
	@PostMapping(path="/orderdetail")
	public String findOrderDetailbyId(@RequestParam("oId") int oId, Model model) {
		
		Order order = orderService.findbyId(oId);
		
		model.addAttribute("order", order);
		
		return "equip/order-detail";
	}
	
	
	//訂單刪除
	@PostMapping(path="/delete")
	@ResponseBody
	public String deleteOrderbyId(@RequestParam("oId") int oId) {
		
		orderService.deleteById(oId);
		
		return "success";
	}
	
	
	
	
	// Ajax 動態更新出貨狀態
	@PostMapping(path="/changestatus")
	@ResponseBody
	public String changeStatusbyId(@RequestParam("oId") int oId) throws Exception {
		
		Order order = orderService.findbyId(oId);
		
		// 更改出貨狀態
		order.setStatus("已經出貨");
		
		// 取得收貨人姓名
		String user = order.getName();
		
		//寄送
		orderMailService.sendTemplateMail(user);
		
		
		orderService.save(order);
		
		return "change success";
	}
}
