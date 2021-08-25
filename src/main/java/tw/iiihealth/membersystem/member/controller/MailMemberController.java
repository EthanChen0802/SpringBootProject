package tw.iiihealth.membersystem.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iiihealth.membersystem.member.service.MemberMailService;

@Controller
public class MailMemberController {
	
	@Autowired
	private MemberMailService mailService;
		
	//信箱驗證
	@GetMapping("/verifyMember")
	public String verifyUser(@RequestParam(name = "code") String code) {
	    if (mailService.verify(code)) {
	        return "membersystem/Member/verifySuccess";
	    } else {
	        return "membersystem/Member/verifyFail";
	    }
	}
	
}
