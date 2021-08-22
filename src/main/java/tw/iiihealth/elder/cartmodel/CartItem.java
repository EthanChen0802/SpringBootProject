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
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	
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


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	@Transient
	public Integer getSubtotal() {
		return Integer.parseInt(this.equip.getPrice())* quantity;
	}
	
}
