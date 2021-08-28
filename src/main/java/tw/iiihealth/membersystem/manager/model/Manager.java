package tw.iiihealth.membersystem.manager.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity // 指自己就是java bean //給Hibernate看的
@Table(name = "manager") // 指bean對應到名為manager的table //給Hibernate看的
@Component("Manager") // 指自己就是java bean，並且名稱為Manager //給Spring看的，重點是HQL要對到這
public class Manager {

	@Id
	@Column(name = "managerid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int managerid;

	@Column(name = "managername")
	private String managername;

	@Column(name = "managergender")
	private String managergender;

	@Column(name = "manageraccount")
	private String manageraccount;

	@Column(name = "managerpwd")
	private String managerpwd;

	@Column(name = "manageryear")
	private String manageryear;

	@Column(name = "managermonth")
	private String managermonth;

	@Column(name = "managerday")
	private String managerday;

	@Column(name = "manageremail")
	private String manageremail;

	@Column(name = "verification_code", length = 64)
	private String verificationCode;

	@Column(name = "role")
	private String role;

	private boolean disabled;
	
	private boolean accountExpired;
	
	private boolean accountLocked;
	
	private boolean credentialsExpired;

	public int getManagerid() {
		return managerid;
	}

	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}

	public String getManagername() {
		return managername;
	}

	public void setManagername(String managername) {
		this.managername = managername;
	}

	public String getManagergender() {
		return managergender;
	}

	public void setManagergender(String managergender) {
		this.managergender = managergender;
	}

	public String getManageraccount() {
		return manageraccount;
	}

	public void setManageraccount(String manageraccount) {
		this.manageraccount = manageraccount;
	}

	public String getManagerpwd() {
		return managerpwd;
	}

	public void setManagerpwd(String managerpwd) {
		this.managerpwd = managerpwd;
	}

	public String getManageryear() {
		return manageryear;
	}

	public void setManageryear(String manageryear) {
		this.manageryear = manageryear;
	}

	public String getManagermonth() {
		return managermonth;
	}

	public void setManagermonth(String managermonth) {
		this.managermonth = managermonth;
	}

	public String getManagerday() {
		return managerday;
	}

	public void setManagerday(String managerday) {
		this.managerday = managerday;
	}

	public String getManageremail() {
		return manageremail;
	}

	public void setManageremail(String manageremail) {
		this.manageremail = manageremail;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public boolean isDisabled() {
		return disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public boolean isAccountExpired() {
		return accountExpired;
	}

	public void setAccountExpired(boolean accountExpired) {
		this.accountExpired = accountExpired;
	}

	public boolean isAccountLocked() {
		return accountLocked;
	}

	public void setAccountLocked(boolean accountLocked) {
		this.accountLocked = accountLocked;
	}

	public boolean isCredentialsExpired() {
		return credentialsExpired;
	}

	public void setCredentialsExpired(boolean credentialsExpired) {
		this.credentialsExpired = credentialsExpired;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
