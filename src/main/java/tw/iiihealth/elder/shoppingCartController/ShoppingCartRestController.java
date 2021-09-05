package tw.iiihealth.elder.shoppingCartController;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.iiihealth.elder.cartmodel.ShoppingCartService;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

@RestController
@Transactional
public class ShoppingCartRestController {
	
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	
	@PostMapping("cart/add/{eid}/{qty}")
	public String addEquipToCart(@PathVariable("eid") Integer equipId, 
									@PathVariable("qty") Integer quantity) {
										
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		Member member = memberService.getCurrentlyLoggedInMember(auth);
		
		if (member != null) {
			shoppingCartService.addProduct(equipId, quantity, member);
			return "success";
		}
		
		return "reject";
	}
	
	
	
	@PostMapping("/cart/update/{eid}/{qty}")
	public String updateEquipToCart(@PathVariable("eid") Integer equipId, 
									@PathVariable("qty") Integer quantity){
									
										
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				
		Member member = memberService.getCurrentlyLoggedInMember(auth);		
		
		Integer subtotal = shoppingCartService.updateQuantity(equipId, quantity, member);

		return String.valueOf(subtotal);	
	}
	
	
	
	@PostMapping("/cart/remove/{eid}")
	public String updateEquipToCart(@PathVariable("eid") Integer equipId) {
										
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
		Member member = memberService.getCurrentlyLoggedInMember(auth);	
		
		shoppingCartService.removeEquip(member, equipId);

		return "The product has been removed from the shopping cart";	
	}
	



}



