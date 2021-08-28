package tw.iiihealth.membersystem.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.iiihealth.membersystem.exception.UserNotFoundException;
import tw.iiihealth.membersystem.member.model.Member;

@Service
public class MemberDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<Member> memberList = memberService.searchMemberAccount(username);
		
		if (memberList != null && memberList.size() == 1) {
			Member member = memberList.get(0);

			return User.builder()
					.username(member.getMemberaccount())
					// change here to store encoded password in db
					.password(member.getMemberpwd())
					.disabled(member.isDisabled())
					.accountExpired(member.isAccountExpired())
					.accountLocked(member.isAccountLocked())
					.credentialsExpired(member.isCredentialsExpired())
					.roles(member.getRole())
					.build();
			
		} else {
			throw new UserNotFoundException("帳號或密碼不正確");
		}

	}
}
