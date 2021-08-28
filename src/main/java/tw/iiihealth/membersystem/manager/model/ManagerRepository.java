package tw.iiihealth.membersystem.manager.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ManagerRepository extends JpaRepository<Manager, Integer> {

	@Query("from Manager where manageraccount = ?1 and role='MANAGER'")
	public List<Manager> searchAccount(String manageraccount);
	
    @Query("from Manager where verificationCode = ?1")
    public Manager searchVerificationCode(String code);
    
    @Query("from Manager where manageraccount = ?1")
    public Manager searchUsername(String manageraccount);
}
