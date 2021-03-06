package com.np.po;

import java.util.HashSet;
import java.util.Set;

import com.np.po.AlbumWord;
import com.np.po.Channel;
import com.np.po.User;
import java.io.Serializable;

public class Album implements Serializable {

	private static final long serialVersionUID = 1L;
	// 相册id
	private int id;
	// 相册名
	private String title;
	// 相册关键词
	private String keyword;
	// 添加相册时间
	 private String createDate;
	// 图片查看次数
	private long times;
	// 保存该图集所属的用户
	private User user;
	// 保存该图集所属的栏目
	private Channel channel;
	// 相册下的图片列表
	private Set<Photo> photos = new HashSet<Photo>();
	private Set<AlbumWord> albumWords = new HashSet<AlbumWord>();
	
	public Album() {
	}

	public Set<AlbumWord> getAlbumWords() {
		return albumWords;
	}

	public void setAlbumWords(Set<AlbumWord> albumWords) {
		this.albumWords = albumWords;
	}

	public Album(String title, String keyword,String createDate, long times, User user,
			Channel channel) {
		setTitle(title);
		setKeyword(keyword);
		setCreateDate(createDate);
		setTimes(times);
		setUser(user);
		setChannel(channel);
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

	public long getTimes() {
		return times;
	}

	public void setTimes(long times) {
		this.times = times;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public Set<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}