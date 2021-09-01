package tw.iiihealth.elder.cartmodel;

import java.beans.Transient;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.membersystem.member.model.Member;



@Entity
@Table(name="cart_items")
public class CartItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="equip_id")
	private Equip equip;
	
	
	@ManyToOne
	@JoinColumn(name="member_id")
	private Member member;
	
	
	private int quantity;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Equip getEquip() {
		return equip;
	}


	public void setEquip(Equip equip) {
		this.equip = equip;
	}



	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	@Transient
	public Integer getSubtotal() {
		return this.equip.getPrice() * quantity;
	}
	
}
