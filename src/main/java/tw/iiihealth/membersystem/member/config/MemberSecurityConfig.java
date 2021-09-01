package tw.iiihealth.membersystem.member.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import tw.iiihealth.membersystem.member.service.MemberDetailsService;


@Configuration
@Order(2)
public class MemberSecurityConfig extends WebSecurityConfigurerAdapter {

	@Qualifier("memberDetailsService")
	@Autowired
	private MemberDetailsService memberDetailsService;
	
	@Autowired
	private CustomHandler customHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(memberDetailsService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http
		.requestMatchers()
		.antMatchers("/Member/**","/cart/**")
		.and()
		.authorizeRequests().anyRequest().authenticated()
//		.and()
//		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
		.and().formLogin().loginPage("/Member/login")
			.successHandler(customHandler)
			.failureUrl("/Member/login/AccessDenied")
		.permitAll()
		.and().logout().logoutUrl("/Member/logout").logoutSuccessUrl("/HealthProject");
	
		http.csrf().disable();
	
	}
	
	@Bean
	 public AuthenticationSuccessHandler successHandler() {
	     SimpleUrlAuthenticationSuccessHandler handler = new SimpleUrlAuthenticationSuccessHandler();
	     handler.setUseReferer(true);
	     return handler;
	 }
}
