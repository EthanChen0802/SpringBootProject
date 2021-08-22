package tw.iiihealth.elder.cartmodel;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.elder.model.EquipRepository;


@Service
@Transactional
public class ShoppingCartService {

		@Autowired
		private CartItemRepository cartItemRepository;
		
		@Autowired
		private EquipRepository equipRepository;
		
		
		public List<CartItem> listCartItems(Customer customer){
			return cartItemRepository.findByCustomer(customer);
		}
		
		
		
		// 新增產品(數量)
		public Integer addProduct(Integer equipId, Integer quantity, Customer customer) {
			
			Integer addedQuantity = quantity;
			
			Equip equip = equipRepository.findById(equipId).get();
			
			CartItem cartItem =  cartItemRepository.findByCustomerAndEquip(customer, equip);
			
			if(cartItem != null) {
				addedQuantity = cartItem.getQuantity() + quantity;
				cartItem.setQuantity(addedQuantity);
			}
			else {
				cartItem = new CartItem();
				cartItem.setQuantity(addedQuantity);
				cartItem.setCustomer(customer);
				cartItem.setEquip(equip);
			}
			
			cartItemRepository.save(cartItem);
			
			return addedQuantity;
		 }
		

		
		// 更新數量
		public int updateQuantity(Integer equipId, Integer quantity, Customer customer) {
			cartItemRepository.updateQuantity(quantity, equipId, customer.getId());
			Equip equip = equipRepository.findById(equipId).get();
			int subtotal = Integer.parseInt(equip.getPrice())* quantity ;
			
			return subtotal;
		}
		
		
		// 從shoppingCart刪除產品
		public void removeEquip(Customer customer, Integer equipId) {
			cartItemRepository.deleteByCustomerAndEquip(customer.getId() , equipId );	
		}
		
		
		// 儲存訂單時，清除這個會員的購物車
		public void removeCart(Customer customer) {
			cartItemRepository.deleteByCustomer(customer.getId());
		}
		

		
}
