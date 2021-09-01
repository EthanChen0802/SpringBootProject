package tw.iiihealth.elder.model;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EquipRepository extends JpaRepository<Equip, Integer> {

	

	@Query("SELECT e FROM Equip e where e.type = ?1")
	Page<Equip> findSortByPage(String type, Pageable pageable);

	
	@Query("SELECT e FROM Equip e order by e.price")
	Page<Equip> findAscendByPage(Pageable pageable);

	@Query("SELECT e FROM Equip e order by e.price desc")
	Page<Equip> findDescendByPage(Pageable pageable);

	@Query("SELECT e FROM Equip e where e.hot = ?1")
	Page<Equip> findHotByPage(String hot, Pageable pageable);

}
