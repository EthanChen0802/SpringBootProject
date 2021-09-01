package tw.iiihealth.membersystem.manager.config;

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

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.ManagerService;

@Component
public class ManagerHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	@Autowired
	private ManagerService managerService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("hi im success handler");
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Manager user = managerService.searchUserDetails(name);
		request.getSession().setAttribute("user",user);
		
		DefaultSavedRequest defaultSavedRequest = (DefaultSavedRequest) request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if(defaultSavedRequest != null){
            getRedirectStrategy().sendRedirect(request, response, defaultSavedRequest.getRedirectUrl());
        }else{
        	
        	this.setDefaultTargetUrl("/Manager/searchAllManagerAction.controller");
            super.onAuthenticationSuccess(request, response, authentication);
        }
        
        this.setDefaultTargetUrl("/Manager/searchAllManagerAction.controller");
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
	
	
	
	

}
