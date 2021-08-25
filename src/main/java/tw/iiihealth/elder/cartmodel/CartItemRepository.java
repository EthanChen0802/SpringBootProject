package tw.iiihealth.elder.cartmodel;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.membersystem.member.model.Member;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	
	
	 public List<CartItem> findByMember(Member member); 
	 
	 
	 public CartItem findByMemberAndEquip(Member member, Equip equip);
	 
	 
	 @Query("UPDATE CartItem c SET c.quantity = ?1 WHERE c.equip.id = ?2  AND c.member.id = ?3")
	 @Modifying
	 public void updateQuantity(Integer quantity, Integer equipId, Integer memberId);
	 
	 
	 @Query("DELETE FROM CartItem c where c.member.id = ?1 AND c.equip.id = ?2")
	 @Modifying
	 public void deleteByMemberAndEquip(Integer memberId, Integer equipId);

	 
	 
	 @Query("DELETE FROM CartItem c where c.member.id = ?1")
	 @Modifying
	 public void deleteByMember(Integer memberId);
}
