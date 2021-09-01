package tw.iiihealth.membersystem.manager.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.iiihealth.membersystem.manager.service.ManagerDetailsService;

@Configuration
@Order(1)
public class ManagerSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private ManagerDetailsService managerDetailsService;

	@Autowired
	private ManagerHandler managerHandler;
	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(managerDetailsService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http
		.requestMatchers()
		.antMatchers("/Manager/**","/iiiHealth/**","/taxi/**","/Drug/**","/DrugProduct/**","/equip/**","/order/**","/meals/**","/diet/**")
		.and()
		.authorizeRequests().anyRequest().authenticated()
//		.and()
//		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
		.and().formLogin().loginPage("/iiiHealth/login")
			.successHandler(managerHandler)
			.failureUrl("/iiiHealth/login/AccessDenied")
		.permitAll()
		.and().logout().logoutUrl("/iiiHealth/logout").logoutSuccessUrl("/iiiHealth/login")
		.and().exceptionHandling().accessDeniedPage("/iiiHealth/AccessDenied");
		
		http.csrf().disable();
		
	}
}
