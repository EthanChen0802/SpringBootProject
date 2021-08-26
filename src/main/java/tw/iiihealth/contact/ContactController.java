package tw.iiihealth.contact;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ContactController {
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/contact")
	public String showContactForm() {
		
		return "contact/contact-form";
	}
	
	
	@PostMapping("/submit")
	public String submitContact(HttpServletRequest request) throws Exception {
		
		
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("message");
		
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		
		
		String mailSuject = "優生網， 來自"+  lastName.trim() +firstName.trim()  + "的郵件";
		String mailContent = "<p><b>寄件者:</b>  " + lastName.trim() + firstName.trim() + "</p>"
							+ "<p><b>信箱:</b> " + email.trim()  + "</p>"
							+ "<p><b>主題:</b> " + subject  + "</p>"
							+ "<p><b>內容:</b> " + content  + "</p>";
		

		helper.setFrom("iiieeit12907@gmail.com");
		helper.setTo("iiieeit12907@gmail.com");
		
		helper.setSubject(mailSuject);
		helper.setText(mailContent, true);
		
		mailSender.send(message);
		
		return "contact/message";
	}

}
