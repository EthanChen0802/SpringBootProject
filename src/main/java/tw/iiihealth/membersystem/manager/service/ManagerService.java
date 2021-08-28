package tw.iiihealth.membersystem.manager.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.model.ManagerRepository;

@Service
@Transactional
public class ManagerService {

	@Autowired
	private ManagerRepository managerRepository;

	// 查詢全部資料
	public List<Manager> searchAllManager() {
		return managerRepository.findAll();
	}
	
	//確認帳號
	public List<Manager> searchManagerAccount(String manageraccount) {
		return managerRepository.searchAccount(manageraccount);
	}
	
	//查詢登入後的帳戶資料
	public Manager searchUserDetails(String manageraccount) {
		return managerRepository.searchUsername(manageraccount);
	}

	// 新增資料 or 修改資料
	public Manager saveManager(Manager manager) {
		return managerRepository.save(manager);
	}

	// 刪除單筆資料
	public void deleteManager(Integer managerid) {
		managerRepository.deleteById(managerid);
	}

	// 查詢單筆資料
	public Manager searchManagerId(Integer managerid) {
		Optional<Manager> opManager = managerRepository.findById(managerid);
		if(opManager.isPresent()) {
			return opManager.get();
		}
		return null;
	}
	
	// 信箱驗證
	public Manager searchMailCode(String verificationCode) {
		return managerRepository.searchVerificationCode(verificationCode);
	}
}
