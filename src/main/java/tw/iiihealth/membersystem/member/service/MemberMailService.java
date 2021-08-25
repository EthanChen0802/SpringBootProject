package tw.iiihealth.membersystem.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import net.bytebuddy.utility.RandomString;
import tw.iiihealth.membersystem.member.model.Member;

@Service
public class MemberMailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	//信箱驗證(1)
	public void memberMailSave(Member member, String siteURL) throws UnsupportedEncodingException, MessagingException {
		
	    String randomCode = RandomString.make(64);
	    member.setVerificationCode(randomCode);
	    
    	member.setDisabled(true);
    	member.setAccountExpired(true);
    	member.setAccountLocked(true);
    	member.setCredentialsExpired(true);

    	memberService.saveMember(member);
	     
	    sendVerificationEmail(member, siteURL);
	}
	
	//信箱驗證(2)
	private void sendVerificationEmail(Member member, String siteURL)
	        throws MessagingException, UnsupportedEncodingException {
	    String toAddress = member.getMemberemail();
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
	     
	    content = content.replace("[[name]]", member.getMembername());
	    String verifyURL = siteURL + "/verifyMember?code=" + member.getVerificationCode();
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	     
	}
	
	//信箱驗證(3)
	public boolean verify(String verificationCode) {
		Member member = memberService.searchMailCode(verificationCode);
	     
	    if (member == null || member.isDisabled() == false ) {
	        return false;
	    } else {
	    	member.setVerificationCode(null);
	    	member.setDisabled(false);
	    	member.setAccountExpired(false);
	    	member.setAccountLocked(false);
	    	member.setCredentialsExpired(false);
	    	member.setRole("MEMBER");
	    	
	    	memberService.saveMember(member);
	         
	        return true;
	    }
	     
	}

}
