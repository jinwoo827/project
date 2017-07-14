package board;

import java.util.List;

public interface ArticleMapper {
	void insert(Article a);
	Article select(int num);
	//��Ʈ�۸� ��ü�˻�
	List selectAll();
	List selectByParentNum(int parent_num);
	void update(Article a);
	void delete(int num);

}
