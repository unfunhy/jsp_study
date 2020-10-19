package study0926;

import java.sql.Blob;

public class Board {
	private String id;
	private String tag;
	private String title;
	private String username;
	private String c_date;
	private String contents;
	private Blob iamge;
	private String views;
	
	public Board() {
		this.id = "null";
		this.tag = "null";
		this.title = "null";
		this.username = "null";
		this.c_date = "null";
		this.contents = "null";
		this.iamge = null;
		this.views = "0";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Object getIamge() {
		return iamge;
	}

	public void setImage(Blob iamge) {
		this.iamge = iamge;
	}
	
	public String getViews() {
		return views;
	}
	
	public void setViews(String views) {
		this.views = views;
	}
}
