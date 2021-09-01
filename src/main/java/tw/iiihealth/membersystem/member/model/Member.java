package tw.iiihealth.membersystem.member.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.iiihealth.elder.model.Equip;

@Entity // 指自己就是java bean //給Hibernate看的
@Table(name = "member") // 指bean對應到名為member的table //給Hibernate看的
@Component("Member") // 指自己就是java bean，並且名稱為Member //給Spring看的，重點是HQL要對到這
public class Member {

	@Id
	@Column(name = "memberid")
	private int memberid;

	@Column(name = "membername")
	private String membername;

	@Column(name = "membergender")
	private String membergender;

	@Column(name = "memberyear")
	private String memberyear;

	@Column(name = "membermonth")
	private String membermonth;

	@Column(name = "memberday")
	private String memberday;

	@Column(name = "memberaccount")
	private String memberaccount;

	@Column(name = "memberpwd")
	private String memberpwd;

	@Column(name = "memberemail")
	private String memberemail;

	@Column(name = "memberphone")
	private String memberphone;

	@Column(name = "membercity")
	private String membercity;

	@Column(name = "membertown")
	private String membertown;

	@Column(name = "memberaddress")
	private String memberaddress;

	@Column(name = "handbook")
	private String handbook;

	@Column(name = "dementia")
	private String dementia;

	@Column(name = "memberphoto")
	private String memberphoto;

	@Column(name = "verification_code", length = 64)
	private String verificationCode;

	@Column(name = "role")
	private String role;
	
	/* 輔具收藏 */
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinTable(name="collect", joinColumns = @JoinColumn(name="memberid"), inverseJoinColumns = @JoinColumn(name="equipid"))
	private  List<Equip> equips;

	
	private boolean disabled;

	private boolean accountExpired;

	private boolean accountLocked;

	private boolean credentialsExpired;

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getMembergender() {
		return membergender;
	}

	public void setMembergender(String membergender) {
		this.membergender = membergender;
	}

	public String getMemberyear() {
		return memberyear;
	}

	public void setMemberyear(String memberyear) {
		this.memberyear = memberyear;
	}

	public String getMembermonth() {
		return membermonth;
	}

	public void setMembermonth(String membermonth) {
		this.membermonth = membermonth;
	}

	public String getMemberday() {
		return memberday;
	}

	public void setMemberday(String memberday) {
		this.memberday = memberday;
	}

	public String getMemberaccount() {
		return memberaccount;
	}

	public void setMemberaccount(String memberaccount) {
		this.memberaccount = memberaccount;
	}

	public String getMemberpwd() {
		return memberpwd;
	}

	public void setMemberpwd(String memberpwd) {
		this.memberpwd = memberpwd;
	}

	public String getMemberemail() {
		return memberemail;
	}

	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public String getMemberphone() {
		return memberphone;
	}

	public void setMemberphone(String memberphone) {
		this.memberphone = memberphone;
	}

	public String getMembercity() {
		return membercity;
	}

	public void setMembercity(String membercity) {
		this.membercity = membercity;
	}

	public String getMembertown() {
		return membertown;
	}

	public void setMembertown(String membertown) {
		this.membertown = membertown;
	}

	public String getMemberaddress() {
		return memberaddress;
	}

	public void setMemberaddress(String memberaddress) {
		this.memberaddress = memberaddress;
	}

	public String getHandbook() {
		return handbook;
	}

	public void setHandbook(String handbook) {
		this.handbook = handbook;
	}

	public String getDementia() {
		return dementia;
	}

	public void setDementia(String dementia) {
		this.dementia = dementia;
	}

	public String getMemberphoto() {
		return memberphoto;
	}

	public void setMemberphoto(String memberphoto) {
		this.memberphoto = memberphoto;
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

	
	/* 輔具收藏 */
	public List<Equip> getEquips() {
		return equips;
	}

	public void setEquips(List<Equip> equips) {
		this.equips = equips;
	}
	
	public void addEquip(Equip equip) {
		if (equips == null) {
			equips = new ArrayList<Equip>();
		}
		equips.add(equip);
	}
	
	public void removeEquip(Equip equip) {
		if (equips != null) {
			equips.remove(equip);
		}
	}
	
	
	
}
