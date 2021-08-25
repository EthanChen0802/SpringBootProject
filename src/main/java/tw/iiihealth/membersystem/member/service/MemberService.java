package tw.iiihealth.membersystem.member.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.model.MemberRepository;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;

	// 查詢全部資料
	public List<Member> searchAllMember() {
		return memberRepository.findAll();
	}
	
	//確認帳號
	public List<Member> searchMemberAccount(String memberaccount) {
		return memberRepository.searchAccount(memberaccount);
	}
	
	//查詢登入後的帳戶資料
	public Member searchUserDetails(String memberaccount) {
		return memberRepository.searchUsername(memberaccount);
	}

	// 新增資料 or 修改資料
	public Member saveMember(Member member) {
		return memberRepository.save(member);
	}

	// 刪除單筆資料
	public void deleteMember(Integer memberid) {
		memberRepository.deleteById(memberid);
	}

	// 查詢單筆資料
	public Member searchMemberId(Integer memberid) {
		Optional<Member> opMember = memberRepository.findById(memberid);
		if(opMember.isPresent()) {
			return opMember.get();
		}
		return null;
	}
	
	// 信箱驗證
	public Member searchMailCode(String verificationCode) {
		return memberRepository.searchVerificationCode(verificationCode);
	}
	
	
	
	// 當前登入的會員
	public Member getCurrentlyLoggedInMember(Authentication auth) {
		
		String account = auth.getName();
		
		Member member = memberRepository.searchUsername(account);
		
		return member;
	}
	
}
