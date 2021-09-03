package tw.iiihealth.membersystem.managerToMember;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.iiihealth.membersystem.member.model.Member;


@Controller
public class MtoMController {

	// 查詢所有
	@RequestMapping(path = "/Manager/searchAllMtoM", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchAllMemberAction(@ModelAttribute("member") Member member,Model m) {
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		return "membersystem/MtoM/DisplaySearchAllMtoM";
	}
	

}