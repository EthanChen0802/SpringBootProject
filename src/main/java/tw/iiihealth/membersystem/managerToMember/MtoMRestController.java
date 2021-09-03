package tw.iiihealth.membersystem.managerToMember;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.iiihealth.membersystem.member.model.Member;
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

	
	
	
	
	
	// 修改
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