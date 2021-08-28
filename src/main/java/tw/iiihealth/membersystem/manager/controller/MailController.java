package tw.iiihealth.membersystem.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iiihealth.membersystem.manager.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	//測試
	@RequestMapping(path = "/testing", method = RequestMethod.GET)
	public String searchAllManagerAction(Model m) throws Exception {

//		mailService.sendSimpleMail();
//		mailService.sendAttachmentsMail();
		mailService.sendInlineMail();

		return "";
	}
	
	
	//信箱驗證
	@GetMapping("/verify")
	public String verifyUser(@RequestParam(name = "code") String code) {
	    if (mailService.verify(code)) {
	        return "membersystem/Manager/verifySuccess";
	    } else {
	        return "membersystem/Manager/verifyFail";
	    }
	}
	
}
