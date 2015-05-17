package com.np.vo;

public class AlbumWordVO {
	
	private int id;
	private String title;
	private String content;
	private String addDate;
	private int albumId;
	private String albumTitle;
	private int userId;
	private String userName;
	
	public AlbumWordVO()
	{
	}

	public AlbumWordVO(int id, String title, String content, String addDate, int albumId, 
		String albumTitle, int userId, String userName)
	{
		setId(id);
		setTitle(title);
		setContent(content);
		setAddDate(addDate);
		setAlbumId(albumId);
		setAlbumTitle(albumTitle);
		setUserId(userId);
		setUserName(userName);
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public String getAlbumTitle() {
		return albumTitle;
	}

	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
