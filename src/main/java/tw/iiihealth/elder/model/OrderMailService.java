package tw.iiihealth.elder.model;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

@Service
public class OrderMailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired 
	freemarker.template.Configuration freemarkerConfig;

	// 簡單的mail
	public void sendSimpleMail() throws Exception {
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("iiieeit12907@gmail.com");
		message.setTo("iiieeit12907@gmail.com");
		message.setSubject("主題：簡單郵件");
		message.setText("測試郵件內容");
		
		mailSender.send(message);
	}

	
	// HTML mail
	public void sendInlineMail() throws Exception {

		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		
		helper.setFrom("iiieeit12907@gmail.com");
		helper.setTo("iiieeit12907@gmail.com");
		helper.setSubject("主題：嵌入靜態資源");
		helper.setText("<html><body><img src=\"cid:weixin\" ></body></html>", true);
		
		Resource resource = new ClassPathResource("static/images/update.png");
		File file = resource.getFile();
		helper.addInline("weixin", file);
		mailSender.send(mimeMessage);
	}
	
	
	
	// 模板mail(出貨通知)
	 public void sendTemplateMail(String user) throws Exception {
		 
	        MimeMessage mimeMessage = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	    	helper.setFrom("iiieeit12907@gmail.com");
			helper.setTo("iiieeit12907@gmail.com");
	        helper.setSubject("主旨：[健康悠生網] 商品出貨通知");
	        
	        
	        // 塞入變數
	        Map<String, Object> model = new HashMap<String, Object>();
	        model.put("userName", user);
	        
	        // mail內容
	        String templateString = 
	        		FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerConfig.getTemplate("template.html"), model);
	        
	        helper.setText(templateString,true);
	        
	        // 寄送
	        mailSender.send(mimeMessage);
	    }
	 
	 
	 
	 
		// 模板mail(訂購通知)
	 	public void sendTemplateMail2(String name) throws Exception {
		 
	        MimeMessage mimeMessage = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	    	helper.setFrom("iiieeit12907@gmail.com");
			helper.setTo("iiieeit12907@gmail.com");
	        helper.setSubject("主旨：[健康悠生網] 商品訂購通知");
	        
	        
	        // 塞入變數
	        Map<String, Object> model = new HashMap<String, Object>();
	        model.put("userName", name);
	        
	        // mail內容
	        String templateString = 
	        		FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerConfig.getTemplate("template2.html"), model);
	        
	        helper.setText(templateString,true);
	        
	        // 寄送
	        mailSender.send(mimeMessage);
	    }


}
