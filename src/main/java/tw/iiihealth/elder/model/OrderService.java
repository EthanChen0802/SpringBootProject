package tw.iiihealth.elder.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class OrderService {
	
	@Autowired
	OrderRepository orderRepository;

	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	
	
	
	public Order findbyId(int oId) {
	
		Optional<Order> order= orderRepository.findById(oId);	
		
		return order.get();
	}




	public void save(Order order) {
		orderRepository.save(order);
	}




	public void deleteById(int oId) {
		orderRepository.deleteById(oId);
	}

}
