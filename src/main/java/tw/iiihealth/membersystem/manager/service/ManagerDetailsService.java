package tw.iiihealth.membersystem.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.iiihealth.membersystem.exception.UserNotFoundException;
import tw.iiihealth.membersystem.manager.model.Manager;

@Service
public class ManagerDetailsService implements UserDetailsService {

	@Autowired
	private ManagerService managerService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		List<Manager> managerList = managerService.searchManagerAccount(username);

		if (managerList != null && managerList.size() == 1) {
			Manager manager = managerList.get(0);
			
			return User.builder()
					.username(manager.getManageraccount())
					// change here to store encoded password in db
					.password(manager.getManagerpwd())
					.disabled(manager.isDisabled())
					.accountExpired(manager.isAccountExpired())
					.accountLocked(manager.isAccountLocked())
					.credentialsExpired(manager.isCredentialsExpired())
					.roles(manager.getRole())
					.build();
				
		} else {
			throw new UserNotFoundException("帳號或密碼不正確");
		}

	}
}
