package tw.iiihealth.elder.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.elder.model.EquipService;



@Controller
@RequestMapping(path="/equip")
public class EquipController {
	
	@Autowired
	EquipService equipService;
	
	

	
	
	// 管理者商品頁
	@RequestMapping(path="/findall")
	public String findAllEquip(Model model) {
		
		List<Equip> list = equipService.findAll();
		
		model.addAttribute("list", list);
		
		return "equip/equip-list";
	}
	
	
	
	
	// 管理者更新頁面
	@PostMapping(path="/showUpdate")
	public String QueryById(@RequestParam("eId") int eid, Model model) {
		Equip equip = equipService.findById(eid);
		model.addAttribute("equip", equip);
		return "equip/equip-form";
	}
	
	
	
	// 管理者新增頁面
	@RequestMapping(path = "/showFormForAdd")
	public String addEquip(Model model) {
		
		Equip equip = new Equip();
		
		model.addAttribute("equip", equip);
		
		return "equip/equip-form";
	}

	
	// 管理者刪除
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestParam("eId") int eId) {
		
		equipService.delete(eId);
		
		return "success";
	}
	
	
	
	
	// 管理者儲存
	@PostMapping(path="save")
	public String saveById(@ModelAttribute("equip") Equip equip, 
						   @RequestParam("pic") MultipartFile multipartFile,
						   HttpServletRequest request) throws Exception{
		
		
		
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
			String saveDir  = request.getSession().getServletContext().getRealPath("/") + "EquipImg\\";
			
			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();
			
			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator+ saveName;
			File saveFile = new File(saveFilePath);
			
			
			// 儲存圖片
			multipartFile.transferTo(saveFile);
		
			// 將檔名存入equip
			equip.setPhoto(saveName);

		}
		
		equipService.save(equip);
		
		
		return "redirect:/equip/findall";
	}

}
