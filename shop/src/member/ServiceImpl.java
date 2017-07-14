package member;

public class ServiceImpl implements Service{
	private Dao dao;
	public ServiceImpl(Dao dao) {
		this.dao = dao;
	}

	@Override
	public void join(Member m) {
		// TODO Auto-generated method stub
		dao.insert(m);
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		return dao.select(id);
	}

	@Override
	public void editMember(Member m) {
		// TODO Auto-generated method stub
		dao.update(m);
	}

	@Override
	public void remMember(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Member m = getMember(id);
		if(m != null && pwd.equals(m.getPwd())) {
			flag = true;
		}
		
		return flag;
	}

}
