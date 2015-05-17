package com.np.vo;

import java.io.Serializable;

public class PhotoWordVO implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String content;
	private String addDate;
	private int photoId;
	private String photoTitle;
	private int userId;
	private String userName;
	
	public PhotoWordVO()
	{
	}

	public PhotoWordVO(int id, String title, String content, String addDate, int photoId, 
		String photoTitle, int userId, String userName)
	{
		setId(id);
		setTitle(title);
		setContent(content);
		setAddDate(addDate);
		setPhotoId(photoId);
		setPhotoTitle(photoTitle);
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

	public void setId(int id)
	{
		this.id = id;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public void setAddDate(String addDate)
	{
		this.addDate = addDate;
	}

	public void setPhotoId(int photoId)
	{
		this.photoId = photoId;
	}

	public void setPhotoTitle(String photoTitle)
	{
		this.photoTitle = photoTitle;
	}

	

	public int getId()
	{
		return this.id;
	}

	public String getTitle()
	{
		return this.title;
	}

	public String getContent()
	{
		return this.content;
	}

	public String getAddDate()
	{
		return this.addDate;
	}

	public int getPhotoId()
	{
		return this.photoId;
	}

	public String getPhotoTitle()
	{
		return this.photoTitle;
	}

}
