package tw.iiihealth.elder.shoppingCartController;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.elder.cartmodel.CartItem;
import tw.iiihealth.elder.cartmodel.ShoppingCartService;
import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.elder.model.EquipService;
import tw.iiihealth.elder.model.Order;
import tw.iiihealth.elder.model.OrderDetail;
import tw.iiihealth.elder.model.OrderMailService;
import tw.iiihealth.elder.model.OrderService;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

@Controller
@Transactional
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderMailService orderMailService;
	
	@Autowired
	EquipService equipService;
	
	
	@GetMapping("/cart")
	public String showShoppingCart(Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		Member member = memberService.getCurrentlyLoggedInMember(auth);
		
		List<CartItem> cartItems = shoppingCartService.listCartItems(member);
		
		model.addAttribute("cartItems", cartItems);
		
		return "shop/shopping-cart";
	}
	
	
	
	
	@GetMapping("/cart/checkout")
	public String checkOutPage(Model model){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		Member member = memberService.getCurrentlyLoggedInMember(auth);
		
		List<CartItem> cartItems = shoppingCartService.listCartItems(member);
		
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("member", member);
		
		
		
		return "shop/checkout-page";
	}
	
	
	
	
	@GetMapping("/cart/saveOrder")
	public String  saveOrder(Model model 
							, @RequestParam(name="name") String name
							, @RequestParam(name="number") String number
							, @RequestParam(name="address") String address
							, @RequestParam(name="email") String email
							, @RequestParam(name="memberid") int memberId) throws Exception {
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		Member member = memberService.getCurrentlyLoggedInMember(auth);
		
		List<CartItem> cartItems = shoppingCartService.listCartItems(member);
		
		
		// 將訂購的收件人資料存入訂單
		Order order = new Order();
		
		order.setName(name);
		order.setNumber(number);
		order.setAddress(address);
		order.setEmail(email);
		order.setStatus("尚未出貨");
		order.setMemberId(memberId);
		
		
		// 將會員的購物車存入訂單細項
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		
		for (CartItem item: cartItems) {
			
			OrderDetail orderDetail = new OrderDetail();
			
			int price = item.getEquip().getPrice();
			int quantity =  item.getQuantity();
			int total = price * quantity;
			String product = item.getEquip().getName();
			
			orderDetail.setPrice(price);
			orderDetail.setQuantity(quantity);
			orderDetail.setProduct(product);
			orderDetail.setTotal(total);
			orderDetail.setOrder(order);
			
			list.add(orderDetail);
		}
		
		
		// 將訂單細項和訂單合併
		order.setOrderDetail(list);
		
		// 儲存訂單
		orderService.save(order);
		
		// 清除資料庫的購物車資料
		shoppingCartService.removeCart(member);
				
		
		//取得訂單編號
		int oId = order.getId();
		
		// 取得訂單資料
		orderService.findbyId(oId);
		
		model.addAttribute("order", order);
		
		//寄送
		orderMailService.sendTemplateMail2(name);
		
		return "shop/success_page";
	}
	
		// Ajax 會員收藏產品
		@PostMapping(path="/cart/collect/{eid}")
		@ResponseBody
		public String collect(@PathVariable("eid") int eid) {
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Member member = memberService.getCurrentlyLoggedInMember(auth);
			
			// 不能重複加一樣的產品
			for (Equip tempEquip:  member.getEquips()) {
				if (tempEquip.getId() == eid) {
					return "duplicate";
				}
			}
			
			// 沒有重複 查詢產品
			Equip equip= equipService.findById(eid);
			
			// 加到join table
			member.addEquip(equip);
			
			return "success";
		}
		
		
		// 顯示會員的收藏品
		@GetMapping(path="/cart/showcollect")
		public String showCollect(Model model) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Member member = memberService.getCurrentlyLoggedInMember(auth);
			
			List<Equip> list= member.getEquips();
			model.addAttribute("list", list);
			
			return "shop/member-collection";
		}
		
		
		
		// 會員收藏刪除
		@PostMapping(path="/cart/deleteCollect")
		@ResponseBody
		public String deletCollect(@RequestParam("eId") int eId) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Member member = memberService.getCurrentlyLoggedInMember(auth);
			
		    Equip equip	= equipService.findById(eId);
			
		    member.removeEquip(equip);
			
			return "success";
		}
		
}
