package tw.iiihealth.membersystem.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberMailService;
import tw.iiihealth.membersystem.member.service.MemberService;

//林家瑋 帳:2z5fhjaxmase  		密:a8jbuxt8
//吳哲瑋 帳:xchbfp5132uswuzc  密:fb4swqiw
//蔡明杰 帳:wsas23a12s  		密:58is87dx
//林睿梅 帳:kpxcepbjgu3h  		密:df3isjbj
//張仲淑 帳:cj4y24mabc7  		密:bp969hg8


@SessionAttributes(names={"user_Member"})
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberMailService mailService;
	
	
	
	
	
//-------------------------------------------------------登入-----------------------------------------------------------------
	
	// 登入
	@RequestMapping("/Member/login")
	public ModelAndView managerLogin2(Model m) {
		return new ModelAndView("membersystem/Login/MemberLogin");
	}
	
	// 登入失敗
	@RequestMapping("/Member/login/AccessDenied")
	public ModelAndView adminAccessError() {
		return new ModelAndView("membersystem/Login/MemberAccessdenied");
	}
	
	
	
	
//-------------------------------------------------------首頁-----------------------------------------------------------------
	
	
	
	//首頁
	@RequestMapping("/HealthProject")
	public ModelAndView index1() {
		return new ModelAndView("index");
	}
	
	
	
	


//	// 查詢所有
//	@RequestMapping(path = "/Member/searchAllMemberAction.controller", method = {RequestMethod.GET, RequestMethod.POST})
//	public String searchAllMemberAction(Model m) {
//
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String memberaccount = auth.getName();
//		Member user_Member = memberService.searchUserDetails(memberaccount);
//		m.addAttribute("user_Member", user_Member);
//		
//		List<Member> list = memberService.searchAllMember();
//		m.addAttribute("allMember", list);
//		return "membersystem/Member/DisplaySearchAllMember";
//	}
	
	

	
	
//-------------------------------------------------------會員個人資料-----------------------------------------------------------------

	
	// 查詢單筆
	@RequestMapping(path = "/Member/searchOneMemberAction.controller", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchOneMemberAction(Model m) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member user_Member = memberService.searchUserDetails(memberaccount);
		
		Member member = memberService.searchMemberId(user_Member.getMemberid());
		m.addAttribute("member", member);
		return "membersystem/Member/MemberFront";
	}
	
	
	
	
//-------------------------------------------------------註冊-----------------------------------------------------------------
	
	
	

	// 註冊單筆(跳轉)
	@RequestMapping(path = "/HealthProject/insertMember", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertMember(@ModelAttribute("member") Member member, Model m) {
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		m.addAttribute("member", member);

		return "membersystem/Member/InsertMember";
	}

	// 註冊單筆(返回上一頁)
	@PostMapping(path = "/HealthProject/reInsertMember")
	public String reInsertMember(@ModelAttribute("member") Member member, HttpServletRequest request, Model m) {
		
		//刪除本機舊圖
		String saveDir = request.getSession().getServletContext().getRealPath("/") + "MemberPhoto\\";
		File saveFilePath = new File(saveDir,member.getMemberphoto());
		saveFilePath.delete();
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		m.addAttribute("member", member);
		
		return "membersystem/Member/InsertMember";
	}

	// 確認註冊的單筆是否正確
	@PostMapping(path = "/HealthProject/displayInsertMember")
	public String displayInsertMember(@ModelAttribute("member") @Validated Member member, BindingResult result,
			Model m, @RequestParam("memberphoto") MultipartFile multipartFile, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		if (multipartFile!= null && !multipartFile.isEmpty()) {
			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			
			//生成檔名稱通用方法(加入現在的時間以及亂數100)
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        Random r = new Random();
	        StringBuilder tempName = new StringBuilder();
	        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
			
			String saveName = tempName.toString();
			// 設定檔案路徑
			String saveDir = request.getSession().getServletContext().getRealPath("/") + "MemberPhoto\\";
			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();
			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator + saveName;
			File saveFile = new File(saveFilePath);
			// 儲存圖片
			multipartFile.transferTo(saveFile);
			// 將檔名存入member
			member.setMemberphoto(saveName);
		}
		m.addAttribute("member", member);
		
		return "membersystem/Member/DisplayInsertMember";
	}

	// 註冊單筆進SQL(1)
	@PostMapping(path = "/HealthProject/insertMemberAction.controller")
	public String insertMemberAction(@ModelAttribute("member") Member member, HttpServletRequest request, Model m)
			throws UnsupportedEncodingException, MessagingException {

		//會員編號
		Random r = new Random();
		StringBuilder tempName = new StringBuilder();
		tempName.append(r.nextInt(100000000));
		String saveName = tempName.toString();
		int memberid = Integer.parseInt(saveName);
		member.setMemberid(memberid);
		
//		//會員密碼加密
		String memberpwd = new BCryptPasswordEncoder().encode(member.getMemberpwd());
		member.setMemberpwd(memberpwd);
		
		mailService.memberMailSave(member, getSiteURL(request));
		
		
		return "membersystem/Member/RegisterSuccess";
	}

	// 註冊單筆進SQL(2)
	private String getSiteURL(HttpServletRequest request) {
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(), "");
	}
	
	
	
	
	
//-------------------------------------------------------修改(基本資料)-----------------------------------------------------------------
	
	
	
	// 修改單筆(跳轉)(基本資料)
	@RequestMapping(path = "/Member/updateMember", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMember(@ModelAttribute("member") Member member, Model m) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member user_Member = memberService.searchUserDetails(memberaccount);
		
		member = memberService.searchMemberId(user_Member.getMemberid());
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		m.addAttribute("member", member);

		return "membersystem/Member/UpdateMember";
	}

	// 修改單筆(返回上一頁)(基本資料)
	@PostMapping(path = "/Member/reUpdateMember")
	public String reUpdateMember(@ModelAttribute("member") Member member, HttpServletRequest request, Model m) {
		
		//刪除本機舊圖
		String saveDir = request.getSession().getServletContext().getRealPath("/") + "MemberPhoto\\";
		File saveFilePath = new File(saveDir,member.getMemberphoto());
		saveFilePath.delete();
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		m.addAttribute("member", member);
		
		return "membersystem/Member/UpdateMember";
	}

	// 確認修改的單筆是否正確(基本資料)
	@PostMapping(path = "/Member/displayUpdateMember")
	public String displayUpdateMember(@ModelAttribute("member") @Validated Member member, BindingResult result,
			Model m, @RequestParam("memberphoto") MultipartFile multipartFile, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		if (multipartFile!= null && !multipartFile.isEmpty()) {
			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			
			//生成檔名稱通用方法(加入現在的時間以及亂數100)
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        Random r = new Random();
	        StringBuilder tempName = new StringBuilder();
	        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
			
			String saveName = tempName.toString();
			// 設定檔案路徑
			String saveDir = request.getSession().getServletContext().getRealPath("/") + "MemberPhoto\\";
			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();
			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator + saveName;
			File saveFile = new File(saveFilePath);
			// 儲存圖片
			multipartFile.transferTo(saveFile);
			// 將檔名存入member
			member.setMemberphoto(saveName);
		}
		m.addAttribute("member", member);
		
		return "membersystem/Member/DisplayUpdateMember";
	}

	// 修改單筆進SQL(基本資料)
	@PostMapping(path = "/Member/updateMemberAction.controller")
	public String updateMemberAction(@ModelAttribute("member") Member member, Model m) {
		
		//會員密碼加密
		String memberpwd = new BCryptPasswordEncoder().encode(member.getMemberpwd());
		member.setMemberpwd(memberpwd);
		
		memberService.saveMember(member);
		
		
		return "redirect:/Member/searchOneMemberAction.controller";
	}
	
	
	
	
	
//-------------------------------------------------------修改(帳密)-----------------------------------------------------------------
	
	
	
	
	// 修改單筆(跳轉)(帳密)
	@RequestMapping(path = "/Member/updateMemberAP", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMemberAP(@ModelAttribute("member") Member member, Model m) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member user_Member = memberService.searchUserDetails(memberaccount);
		
		member = memberService.searchMemberId(user_Member.getMemberid());
		
		m.addAttribute("member", member);

		return "membersystem/Member/UpdateMemberAP";
	}

	// 修改單筆(返回上一頁)(帳密)
	@PostMapping(path = "/Member/reUpdateMemberAP")
	public String reUpdateMemberAP(@ModelAttribute("member") Member member, Model m) {
		
		m.addAttribute("member", member);
		
		return "membersystem/Member/UpdateMemberAP";
	}

	// 確認修改的單筆是否正確(帳密)
	@PostMapping(path = "/Member/displayUpdateMemberAP")
	public String displayUpdateMemberAP(@ModelAttribute("member") Member member, Model m) {
		
		m.addAttribute("member", member);
		
		return "membersystem/Member/DisplayUpdateMemberAP";
	}

	// 修改單筆進SQL(帳密)
	@PostMapping(path = "/Member/updateMemberAPAction.controller")
	public String updateMemberAPAction(@ModelAttribute("member") Member member, Model m) {
		
		//會員密碼加密
		String memberpwd = new BCryptPasswordEncoder().encode(member.getMemberpwd());
		member.setMemberpwd(memberpwd);
		
		memberService.saveMember(member);
		
		
		return "redirect:/Member/logout";
	}
	
	
	
	

//	// 確認刪除的單筆是否正確
//	@PostMapping(path = "/Member/displayDeleteMember")
//	public String displayDeleteMember(@RequestParam(name = "memberid") int memberid, Model m) {
//
//		Member member = memberService.searchMemberId(memberid);
//		m.addAttribute("member", member);
//
//		return "membersystem/Member/DisplayDeleteMember";
//	}
//	
//	// 刪除單筆
//	@PostMapping(path = "/Member/deleteMemberAction.controller")
//	public String processDeleteAction(@RequestParam(name="memberid") int memberid,Model m) {
//		
//		memberService.deleteMember(memberid);
//		
//		return "redirect:/HealthProject/MemberHealth/searchAllMemberAction.controller";
//	}
}