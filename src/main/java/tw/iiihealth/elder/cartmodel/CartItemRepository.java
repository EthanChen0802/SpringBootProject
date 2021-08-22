package tw.iiihealth.elder.cartmodel;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tw.iiihealth.elder.model.Equip;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	
	
	 public List<CartItem> findByCustomer(Customer customer); 
	 
	 
	 public CartItem findByCustomerAndEquip(Customer customer, Equip equip);
	 
	 
	 @Query("UPDATE CartItem c SET c.quantity = ?1 WHERE c.equip.id = ?2  AND c.customer.id = ?3")
	 @Modifying
	 public void updateQuantity(Integer quantity, Integer equipId, Integer customerId);
	 
	 
	 @Query("DELETE FROM CartItem c where c.customer.id = ?1 AND c.equip.id = ?2")
	 @Modifying
	 public void deleteByCustomerAndEquip(Integer CustomerId, Integer equipId);

	 
	 
	 @Query("DELETE FROM CartItem c where c.customer.id = ?1")
	 @Modifying
	 public void deleteByCustomer(Integer CustomerId);
}
