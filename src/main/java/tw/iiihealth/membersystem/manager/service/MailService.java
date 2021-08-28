package tw.iiihealth.membersystem.manager.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import net.bytebuddy.utility.RandomString;
import tw.iiihealth.membersystem.manager.model.Manager;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ManagerService managerService;
	
	//一封簡單郵件的傳送
	public void sendSimpleMail() throws Exception {
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom("iiieeit12907@gmail.com");
	message.setTo("iiieeit12907@gmail.com");
	message.setSubject("主題：簡單郵件");
	message.setText("測試郵件內容");
	mailSender.send(message);
	}
	
	//通過MimeMessageHelper來傳送一封帶有附件的郵件
	public void sendAttachmentsMail() throws Exception {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		helper.setFrom("iiieeit12907@gmail.com");
		helper.setTo("iiieeit12907@gmail.com");
		helper.setSubject("主題：有附件");
		helper.setText("有附件的郵件");
		Resource resource = new ClassPathResource("static/images/update.png");
		File file = resource.getFile();
		helper.addAttachment("附件-1.jpg", file);
		helper.addAttachment("附件-2.jpg", file);
		mailSender.send(mimeMessage);
		}
	
	//通過MimeMessageHelper實現在郵件正文中嵌入靜態資源
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
	
	//信箱驗證(1)
	public void register(Manager manager, String siteURL) throws UnsupportedEncodingException, MessagingException {
		
	    String randomCode = RandomString.make(64);
	    manager.setVerificationCode(randomCode);
	    
    	manager.setDisabled(true);
    	manager.setAccountExpired(true);
    	manager.setAccountLocked(true);
    	manager.setCredentialsExpired(true);
	     
    	managerService.saveManager(manager);
	     
	    sendVerificationEmail(manager, siteURL);
	}
	
	//信箱驗證(2)
	private void sendVerificationEmail(Manager manager, String siteURL)
	        throws MessagingException, UnsupportedEncodingException {
	    String toAddress = manager.getManageremail();
	    String fromAddress = "iiieeit12907@gmail.com";
	    String senderName = "健康優生網";
	    String subject = "請驗證您註冊的帳戶";
	    String content = "親愛的[[name]],<br>"
	            + "請點選下面的連結來驗證您註冊的帳戶:<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">請點此驗證</a></h3>"
	            + "謝謝,<br>"
	            + "健康優生網，關心您";
	     
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	     
	    content = content.replace("[[name]]", manager.getManagername());
	    String verifyURL = siteURL + "/verify?code=" + manager.getVerificationCode();
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	     
	}
	
	//信箱驗證(3)
	public boolean verify(String verificationCode) {
		Manager manager = managerService.searchMailCode(verificationCode);
	     
	    if (manager == null || manager.isDisabled() == false ) {
	        return false;
	    } else {
	    	manager.setVerificationCode(null);
	    	manager.setDisabled(false);
	    	manager.setAccountExpired(false);
	    	manager.setAccountLocked(false);
	    	manager.setCredentialsExpired(false);
	    	manager.setRole("MANAGER");
	    	
	    	managerService.saveManager(manager);
	         
	        return true;
	    }
	     
	}

}
