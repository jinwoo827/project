package board;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
@Component("boardService")
public class ServiceImpl implements Service{
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private ArticleMapper articleMapper;

	@Override
	public void insert(Article a) {
		// TODO Auto-generated method stub
		articleMapper = sqlSession.getMapper(ArticleMapper.class);
		articleMapper.insert(a);
		
	}

	@Override
	public Article select(int num) {
		// TODO Auto-generated method stub
		articleMapper = sqlSession.getMapper(ArticleMapper.class);		
		return articleMapper.select(num);
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		articleMapper = sqlSession.getMapper(ArticleMapper.class);
		List list = new ArrayList<Article>();
		list = articleMapper.selectAll();
		return list;
	}

	@Override
	public List selectByParentNum(int parent_num) {
		// TODO Auto-generated method stub
		articleMapper = sqlSession.getMapper(ArticleMapper.class);
		List list = new ArrayList<Article>();
		list = articleMapper.selectByParentNum(parent_num);
		return list;
	}

	@Override
	public void update(Article a) {
		// TODO Auto-generated method stub
		articleMapper = sqlSession.getMapper(ArticleMapper.class);
		articleMapper.update(a);
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		articleMapper = sqlSession.getMapper(ArticleMapper.class);
		articleMapper.delete(num);
	}

}
