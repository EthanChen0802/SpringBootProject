package tw.iiihealth.membersystem.member.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<Member, Integer> {
	
	@Query("from Member where memberaccount = ?1 and role='MEMBER'")
	public List<Member> searchAccount(String memberaccount);
	
    @Query("from Member where verificationCode = ?1")
    public Member searchVerificationCode(String code);
    
    @Query("from Member where memberaccount = ?1")
    public Member searchUsername(String memberaccount);
}
