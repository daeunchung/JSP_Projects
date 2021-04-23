package ch07;
/* DAO Ŭ���� , ArrayList �� �̿��Ͽ� AddrBean(DO)������ �����͸� ���� */

import java.util.ArrayList;
import java.util.List;

// �ڵ� import Ctrl+Shift+O

public class AddrManager {
	// �ּҷ� ����� �����ϱ� ���� ArrayList
	List<AddrBean> addrlist = new ArrayList<AddrBean>();
	
	// �ּҷ� �߰� �޼���
	public void add(AddrBean ab) {
		addrlist.add(ab);
	}
	
	// �ּҷ� ��� ���� �޼���
	public List<AddrBean> getAddrList(){
		return addrlist;
	}
	
	// Ư�� ����ڸ� �ּҷ� ��Ͽ��� �˻��ϴ� �޼���
	public AddrBean getAddr(String username) {
		for(AddrBean ab : addrlist) {
			if(ab.getUsername().equals(username))
				return ab;
		}
		return null;
	}
}
