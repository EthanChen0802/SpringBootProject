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
import org.springframework.web.bind.annotation.RequestParam;

import tw.iiihealth.elder.cartmodel.CartItem;
import tw.iiihealth.elder.cartmodel.ShoppingCartService;
import tw.iiihealth.elder.model.Order;
import tw.iiihealth.elder.model.OrderDetail;
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
							, @RequestParam(name="memberid") int memberid) {
		
		
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
		order.setMember_id(memberid);
		
		
		// 將會員的購物車存入訂單細項
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		
		for (CartItem item: cartItems) {
			
			OrderDetail orderDetail = new OrderDetail();
			
			int price = Integer.parseInt(item.getEquip().getPrice());
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
		
		System.out.println(oId);
		
		// 取得訂單資料
		orderService.findbyId(oId);
		
		model.addAttribute("order", order);
		
		return "shop/success_page";
	}
}
