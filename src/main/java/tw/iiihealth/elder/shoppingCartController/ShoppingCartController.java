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
	
	
	
	// ??????????????????????????????????????????????????????
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
		
		
		// ???????????????????????????????????????
		Order order = new Order();
		
		order.setName(name);
		order.setNumber(number);
		order.setAddress(address);
		order.setEmail(email);
		order.setStatus("????????????");
		
		// mapping member???id
		order.setMemberId(member);
		
		
		// ???????????????????????????????????????
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		
		for (CartItem item: cartItems) {
			
			OrderDetail orderDetail = new OrderDetail();
			
			String photo = item.getEquip().getPhoto();
			int price = item.getEquip().getPrice();
			int quantity =  item.getQuantity();
			int total = price * quantity;
			String product = item.getEquip().getName();
			
			orderDetail.setPhoto(photo);
			orderDetail.setPrice(price);
			orderDetail.setQuantity(quantity);
			orderDetail.setProduct(product);
			orderDetail.setTotal(total);
			orderDetail.setOrder(order);
			
			list.add(orderDetail);
		}
		
		
		// ??????????????????????????????
		order.setOrderDetail(list);
		
		// ????????????
		orderService.save(order);
		
		// ?????????????????????????????????
		shoppingCartService.removeCart(member);
				
		
		//??????????????????
		int oId = order.getId();
		
		// ??????????????????
		orderService.findbyId(oId);
		
		model.addAttribute("order", order);
		
		//??????
		orderMailService.sendTemplateMail2(name);
		
		
		// ??????????????????????????????
		member.addOrder(order);
		
		return "shop/success_page";
	}
	
	
	
		// Ajax ??????????????????
		@PostMapping(path="/cart/collect/{eid}")
		@ResponseBody
		public String collect(@PathVariable("eid") int eid) {
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Member member = memberService.getCurrentlyLoggedInMember(auth);
			
			// ??????????????????????????????
			for (Equip tempEquip:  member.getEquips()) {
				if (tempEquip.getId() == eid) {
					return "duplicate";
				}
			}
			
			// ???????????? ????????????
			Equip equip= equipService.findById(eid);
			
			// ??????join table
			member.addEquip(equip);
			
			return "success";
		}
		
		
		// ????????????????????????
		@GetMapping(path="/cart/showcollect")
		public String showCollect(Model model) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Member member = memberService.getCurrentlyLoggedInMember(auth);
			
			List<Equip> list= member.getEquips();
			model.addAttribute("list", list);
			
			return "shop/member-collection";
		}
		
		
		
		// ??????????????????
		@PostMapping(path="/cart/deleteCollect")
		@ResponseBody
		public String deletCollect(@RequestParam("eId") int eId) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Member member = memberService.getCurrentlyLoggedInMember(auth);
			
		    Equip equip	= equipService.findById(eId);
			
		    member.removeEquip(equip);
			
			return "success";
		}
		
		
		// ?????????????????????
		@GetMapping(path="/cart/order")
		public String showMemberOrder(Model model) {
			Authentication auth  =SecurityContextHolder.getContext().getAuthentication();
			Member Member = memberService.getCurrentlyLoggedInMember(auth);
			
			List<Order> orders = Member.getOrders();
			
			model.addAttribute("orders", orders);
			
			return "shop/member-order";
		}
		
		
}
