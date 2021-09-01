package tw.iiihealth.membersystem.manager.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.MailService;
import tw.iiihealth.membersystem.manager.service.ManagerService;

//	紀岱昀 帳:eeit12901  密:password01
//	林昱伸 帳:eeit12902  密:password02
//	林羽墨 帳:eeit12903  密:password03
//	陳厚丞 帳:eeit12904  密:password04
//	陳宥芸 帳:eeit12905  密:password05

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	@Autowired
	private MailService mailService;
	
	
	
//-------------------------------------------------------登入-----------------------------------------------------------------

	//登入
	@RequestMapping("/iiiHealth/login")
	public ModelAndView managerLogin2(Model m) {
		return new ModelAndView("membersystem/Login/ManagerLogin");
	}
	
	//登入失敗(1)
	@RequestMapping("/iiiHealth/login/AccessDenied")
	public ModelAndView managerAccessError1() {
		return new ModelAndView("membersystem/Login/ManagerAccessdenied");
	}

	//登入失敗(2)
	@RequestMapping("/iiiHealth/AccessDenied")
	public ModelAndView managerAccessError2() {	
		return new ModelAndView("membersystem/Login/ManagerAccessdenied");
	}
	

	
	
//-------------------------------------------------------首頁(管理員資料表)-----------------------------------------------------------------
	
	

	// 查詢所有
	@RequestMapping(path = "/Manager/searchAllManagerAction.controller", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchAllManagerAction(Model m) {
		
		List<Manager> list = managerService.searchAllManager();
		m.addAttribute("allManager", list);
		return "membersystem/Manager/DisplaySearchAllManager";
	}

	
	
	
//-------------------------------------------------------註冊-----------------------------------------------------------------

	
	
	// 註冊單筆(跳轉)
	@RequestMapping(path = "/Manager/insertManager", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/InsertManager";
	}

	// 註冊單筆(返回上一頁)
	@PostMapping(path = "/Manager/reInsertManager")
	public String reInsertManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/InsertManager";
	}

	// 確認註冊的單筆是否正確
	@PostMapping(path = "/Manager/displayInsertManager")
	public String displayInsertManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/DisplayInsertManager";
	}

	// 註冊單筆進SQL(1)
	@PostMapping(path = "/Manager/insertManagerAction.controller")
	public String insertManagerAction(@ModelAttribute("manager") Manager manager, HttpServletRequest request, Model m)
			throws UnsupportedEncodingException, MessagingException {

		String managerpwd = new BCryptPasswordEncoder().encode(manager.getManagerpwd());
		manager.setManagerpwd(managerpwd);

		mailService.register(manager, getSiteURL(request));

		return "membersystem/Manager/registerSuccess";
	}

	// 註冊單筆進SQL(2)
	private String getSiteURL(HttpServletRequest request) {
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(), "");
	}

	
	
	
	
//-------------------------------------------------------修改-----------------------------------------------------------------
	
	
	
	
	// 修改單筆(跳轉)
	@PostMapping(path = "/Manager/updateManager")
	public String updateManager(@ModelAttribute("manager") Manager manager,
			@RequestParam(name = "managerid") int managerid, Model m) {

		manager = managerService.searchManagerId(managerid);
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/UpdateManager";
	}

	// 修改單筆(返回上一頁)
	@PostMapping(path = "/Manager/reUpdateManager")
	public String reUpdateManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/UpdateManager";
	}

	// 確認修改的單筆是否正確
	@PostMapping(path = "/Manager/displayUpdateManager")
	public String displayUpdateManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/DisplayUpdateManager";
	}

	// 修改單筆進SQL
	@PostMapping(path = "/Manager/updateManagerAction.controller")
	public String updateManagerAction(@ModelAttribute("manager") Manager manager, Model m) {

		//會員密碼加密
		String managerpwd = new BCryptPasswordEncoder().encode(manager.getManagerpwd());
		manager.setManagerpwd(managerpwd);

		managerService.saveManager(manager);

		return "redirect:/Manager/searchAllManagerAction.controller";
	}
	
	
	
	
//-------------------------------------------------------刪除-----------------------------------------------------------------
	
	

	// 確認刪除的單筆是否正確
	@PostMapping(path = "/Manager/displayDeleteManager")
	public String displayDeleteManager(@RequestParam(name = "managerid") int managerid, Model m) {

		Manager manager = managerService.searchManagerId(managerid);
		m.addAttribute("manager", manager);

		return "membersystem/Manager/DisplayDeleteManager";
	}

	// 刪除單筆
	@PostMapping(path = "/Manager/deleteManagerAction.controller")
	public String deleteManager(@RequestParam(name = "managerid") int managerid, Model m) {

		managerService.deleteManager(managerid);

		return "redirect:/Manager/searchAllManagerAction.controller";
	}

}
