package tw.iiihealth.elder.model;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EquipRepository extends JpaRepository<Equip, Integer> {

	

	@Query("SELECT e FROM Equip e where e.type = ?1")
	Page<Equip> findSortByPage(String type, Pageable pageable);

}
