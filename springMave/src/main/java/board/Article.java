package board;

import java.sql.Date;
import java.util.ArrayList;

public class Article {
	private int num;
	private String title;
	private String writer_id;
	private String w_date;
	private String content;
	private int parent_num;
	private ArrayList<Article> reps;
	
	public Article() {}
	

	public Article(int num, String title, String writer_id, String w_date, String content, int parent_num,
			ArrayList<Article> reps) {
		super();
		this.num = num;
		this.title = title;
		this.writer_id = writer_id;
		this.w_date = w_date;
		this.content = content;
		this.parent_num = parent_num;
		this.reps = reps;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getW_date() {
		return w_date;
	}

	public void setW_date(String w_date) {
		this.w_date = w_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getParent_num() {
		return parent_num;
	}

	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}

	public ArrayList<Article> getReps() {
		return reps;
	}

	public void setReps(ArrayList<Article> reps) {
		this.reps = reps;
	}


	@Override
	public String toString() {
		return "Article [num=" + num + ", title=" + title + ", writer_id=" + writer_id + ", w_date=" + w_date
				+ ", content=" + content + ", parent_num=" + parent_num + ", reps=" + reps + "]";
	}
	
	
	
	

}
