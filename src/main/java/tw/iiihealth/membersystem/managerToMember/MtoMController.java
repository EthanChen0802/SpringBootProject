package tw.iiihealth.membersystem.managerToMember;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.ManagerService;
import tw.iiihealth.membersystem.member.model.Member;


@Controller
public class MtoMController {

	@Autowired
	private ManagerService managerService;

	// 查詢所有
	@RequestMapping(path = "/Manager/searchAllMtoM", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchAllMemberAction(@ModelAttribute("member") Member member,Model m) {

//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String manageraccount = auth.getName();
//		Manager user = managerService.searchUserDetails(manageraccount);
//		m.addAttribute("user", user);
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		return "membersystem/MtoM/DisplaySearchAllMtoM";
	}
	

}