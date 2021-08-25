package tw.iiihealth.membersystem.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



//林家瑋 帳:2z5fhjaxmase  		密:a8jbuxt8
//吳哲瑋 帳:xchbfp5132uswuzc  密:fb4swqiw
//蔡明杰 帳:wsas23a12s  		密:58is87dx
//林睿梅 帳:kpxcepbjgu3h  		密:df3isjbj
//張仲淑 帳:cj4y24mabc7  		密:bp969hg8

@Controller
public class LoginMemberController {
	
	//首頁(無會員)
	@RequestMapping("/HealthProject")
	public ModelAndView index1() {
		return new ModelAndView("membersystem/Index");
	}

	// 登入(1)
	@RequestMapping("/Member/")
	public ModelAndView memberLogin1() {
		return new ModelAndView("membersystem/Login/MemberLogin");
	}

	// 登入(2)
	@RequestMapping("/Member/login")
	public ModelAndView managerLogin2() {
		return new ModelAndView("membersystem/Login/MemberLogin");
	}

	// 登入成功
	@RequestMapping("/Member/login/success")
	public ModelAndView managerSuccess() {
		return new ModelAndView("membersystem/Login/LoginMemberSuccess");
	}

	// 登入失敗
	@RequestMapping("/Member/login/AccessDenied")
	public ModelAndView adminAccessError() {
		return new ModelAndView("membersystem/Login/MemberAccessdenied");
	}
}
