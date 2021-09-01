package tw.iiihealth.membersystem.member.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.stereotype.Component;

import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

@Component
public class CustomHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	@Autowired
	private MemberService memberService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("hi im success handler");
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Member user_Member = memberService.searchUserDetails(name);
		request.getSession().setAttribute("user_Member",user_Member);
		
		DefaultSavedRequest defaultSavedRequest = (DefaultSavedRequest) request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if(defaultSavedRequest != null){
            getRedirectStrategy().sendRedirect(request, response, defaultSavedRequest.getRedirectUrl());
        }else{
        	
        	this.setDefaultTargetUrl("/HealthProject");
            super.onAuthenticationSuccess(request, response, authentication);
        }
        
        this.setDefaultTargetUrl("/HealthProject");
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
