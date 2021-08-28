package tw.iiihealth.membersystem.managerToMember;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.ManagerService;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberMailService;
import tw.iiihealth.membersystem.member.service.MemberService;

//林家瑋 帳:2z5fhjaxmase  		密:a8jbuxt8
//吳哲瑋 帳:xchbfp5132uswuzc  密:fb4swqiw
//蔡明杰 帳:wsas23a12s  		密:58is87dx
//林睿梅 帳:kpxcepbjgu3h  		密:df3isjbj
//張仲淑 帳:cj4y24mabc7  		密:bp969hg8


//紀岱昀 帳:eeit12901  密:password01
//林昱伸 帳:eeit12902  密:password02
//林羽墨 帳:eeit12903  密:password03
//陳厚丞 帳:eeit12904  密:password04
//陳宥芸 帳:eeit12905  密:password05

@RestController
public class MtoMRestController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberMailService mailService;

	// 查詢所有
	@GetMapping(path = "/Manager/searchAllMtoMAction.controller")
	public List<Member> searchAllMtoMAction(Model m) {
		return memberService.searchAllMember();
	}
	
	// 查詢單筆
	@GetMapping(path = "/Manager/searchOneMtoMAction.controller/{memberid}")
	public Member searchOneMtoMAction(@PathVariable Integer memberid) throws Exception {
		return memberService.searchMemberId(memberid);
	}

	// 註冊單筆(跳轉)
	@PostMapping(path = "/Manager/insertMtoM")
	public String insertMtoM(Member member, Model m) throws IOException {
		
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
	@PostMapping(path = "/Manager/reInsertMtoM")
	public String reInsertMtoM(@ModelAttribute("member") Member member, HttpServletRequest request, Model m) {
		
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
	@PostMapping(path = "/Manager/displayInsertMtoM")
	public String displayInsertMtoM(@ModelAttribute("member") @Validated Member member, BindingResult result,
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
	@PostMapping(path = "/Manager/insertMtoMAction.controller")
	public String insertMtoMAction(@ModelAttribute("member") Member member, HttpServletRequest request, Model m)
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
	
	// 修改單筆(跳轉)
	@RequestMapping(path = "/Manager/updateMtoM", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMtoM(@ModelAttribute("member") Member member, Model m) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member user = memberService.searchUserDetails(memberaccount);
		m.addAttribute("user", user);
		
		member = memberService.searchMemberId(user.getMemberid());
		
		List<String> handbookOption = new ArrayList<String>();
		handbookOption.add("有");
		handbookOption.add("無");
		handbookOption.add("申請中");
		handbookOption.add("其他");
		m.addAttribute("handbookOption", handbookOption);
		
		m.addAttribute("member", member);

		return "membersystem/Member/UpdateMember";
	}

	// 修改單筆(返回上一頁)
	@PostMapping(path = "/Manager/reUpdateMtoM")
	public String reUpdateMtoM(@ModelAttribute("member") Member member, HttpServletRequest request, Model m) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member user = memberService.searchUserDetails(memberaccount);
		m.addAttribute("user", user);
		
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

	// 確認修改的單筆是否正確
	@PostMapping(path = "/Manager/displayUpdateMtoM")
	public String displayUpdateMtoM(@ModelAttribute("member") @Validated Member member, BindingResult result,
			Model m, @RequestParam("memberphoto") MultipartFile multipartFile, HttpServletRequest request)
			throws IllegalStateException, IOException {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member user = memberService.searchUserDetails(memberaccount);
		m.addAttribute("user", user);
		
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

	// 修改單筆進SQL
	@PostMapping(path = "/Manager/updateMemberAction.controller", produces = "text/plain;charset=UTF-8")
	public String updateMtoMAction(@ModelAttribute("member") @Validated Member member,  BindingResult result,
			Model m, @RequestParam("memberphoto") MultipartFile multipartFile, HttpServletRequest request) throws Exception {
		
		//會員密碼加密
		String memberpwd = new BCryptPasswordEncoder().encode(member.getMemberpwd());
		member.setMemberpwd(memberpwd);
//		member.setMemberpwd(member.getMemberpwd());
		
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
		
		memberService.saveMember(member);
		
		return "success";
	}
	
//	// 確認刪除的單筆是否正確
//	@GetMapping(path = "/Manager/displayDeleteMtoM/{memberid}")
//	public Member displayDeleteMtoM(@PathVariable Integer memberid) throws Exception {
//		return memberService.searchMemberId(memberid);
//	}
	
	// 刪除單筆
	@PostMapping(path = "/Manager/deleteMtoMAction.controller/{memberid}")
	public Map<String,String> deleteMtoMAction(@PathVariable Integer memberid) throws Exception {
		
		Map<String,String> map = new HashMap<String,String>();
		memberService.deleteMember(memberid);
		Member torf =memberService.searchMemberId(memberid);
		
		if(torf != null) {
			System.err.println("刪除失敗");
		} else {
			map.put("msg","成功刪除id:"+memberid);
		}
		return map;
	}
}