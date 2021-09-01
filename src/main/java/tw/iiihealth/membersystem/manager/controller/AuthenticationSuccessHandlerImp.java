package tw.iiihealth.membersystem.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

public class AuthenticationSuccessHandlerImp implements AuthenticationSuccessHandler {
	@Autowired
	private MemberService memberService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		  
		Member member = memberService.getCurrentlyLoggedInMember(authentication);
		String name = member.getMembername();
		request.getSession().setAttribute("user", name);      
	}

}
