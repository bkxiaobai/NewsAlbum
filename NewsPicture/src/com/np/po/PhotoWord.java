package com.np.po;

import java.io.Serializable;

public class PhotoWord implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String content;
	private String addDate;
	private Photo photo;
	private User user;

	public PhotoWord()
	{
	}

	public PhotoWord(String title, String content, String addDate, Photo photo,User user)
	{
		setTitle(title);
		setContent(content);
		setAddDate(addDate);
		setPhoto(photo);
		setUser(user);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId(int id) {
		this.id = id; 
	}

	public void setTitle(String title) {
		this.title = title; 
	}

	public void setContent(String content) {
		this.content = content; 
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate; 
	}

	public void setPhoto(Photo photo) {
		this.photo = photo; 
	}

	public int getId() {
		return (this.id); 
	}

	public String getTitle() {
		return (this.title); 
	}

	public String getContent() {
		return (this.content); 
	}

	public String getAddDate() {
		return (this.addDate); 
	}

	public Photo getPhoto() {
		return (this.photo); 
	}
}
