package com.np.po;

import java.io.Serializable;

public class AlbumWord implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String content;
	private String addDate;
	private Album album;
	private User user;


	public AlbumWord()
	{
	}

	public AlbumWord(String title, String content, String addDate, Album album, User user)
	{
		setTitle(title);
		setContent(content);
		setAddDate(addDate);
		setAlbum(album);
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

	public void setAlbum(Album album) {
		this.album = album; 
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

	public Album getAlbum() {
		return (this.album); 
	}
}
