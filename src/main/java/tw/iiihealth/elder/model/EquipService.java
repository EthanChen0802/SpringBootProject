package tw.iiihealth.elder.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class EquipService {

	@Autowired
	private EquipRepository equipRepository;
	
	
	
	public List<Equip> findAll() {
		return equipRepository.findAll();
	}

	
	
	public Equip findById(int eid) {
		Optional<Equip> eRep = equipRepository.findById(eid);
		return eRep.get();
	}



	public void save(Equip equip) {
		equipRepository.save(equip);
	}



	public void delete(int eId) {
		equipRepository.deleteById(eId);
	}


	
	// 使用者商品瀏覽頁分頁總查詢
	public Page<Equip> findAllByPage(Pageable pageable) {
		return equipRepository.findAll(pageable);
	}


	
	// 商品瀏覽分頁查詢(依照商品種類)
	public Page<Equip> findSortByPage(String type, Pageable pageable) {
		return equipRepository.findSortByPage(type, pageable);
	}

}
