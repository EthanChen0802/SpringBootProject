package tw.iiihealth.elder.shoppingCartController;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.iiihealth.elder.cartmodel.Customer;
import tw.iiihealth.elder.cartmodel.CustomerRepository;
import tw.iiihealth.elder.cartmodel.ShoppingCartService;

@RestController
@Transactional
public class ShoppingCartRestController {
	
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private CustomerRepository CustomerRepository;
	
	
	
	
	@PostMapping("/cart/add/{eid}/{qty}")
	public String addEquipToCart(@PathVariable("eid") Integer equipId, 
									@PathVariable("qty") Integer quantity){
										
		
		Customer customer = CustomerRepository.findById(3).get();
		
		Integer addedQuantity = shoppingCartService.addProduct(equipId, quantity, customer);

		return addedQuantity + " items of this product were added to your shopping cart";
	}
	
	
	
	@PostMapping("/cart/update/{eid}/{qty}")
	public String updateEquipToCart(@PathVariable("eid") Integer equipId, 
									@PathVariable("qty") Integer quantity){
										
		
		Customer customer = CustomerRepository.findById(3).get();
		
		Integer subtotal = shoppingCartService.updateQuantity(equipId, quantity, customer);

		return String.valueOf(subtotal);	
	}
	
	
	
	@PostMapping("/cart/remove/{eid}")
	public String updateEquipToCart(@PathVariable("eid") Integer equipId){
										
		
		Customer customer = CustomerRepository.findById(3).get();
		
		shoppingCartService.removeEquip(customer, equipId);

		return "The product has been removed from the shopping cart";	
	}
	



}



