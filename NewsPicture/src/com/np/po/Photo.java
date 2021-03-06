package com.np.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.np.po.PhotoWord;

public class Photo implements Serializable {

	private static final long serialVersionUID = 1L;
	// 图片id
	private int id;
	// 该图片的名称
	private String title;
	// 该图片的关键词属性
	private String keyword;
	// 图片查看次数
	private long times;
	// 图片绝对地址
	private String picUrl;
	// 大图保存路径
	private String bigPicUrl;
	// 缩略图保存路径
	private String smallPicUrl;
	// 添加图片时间
	private String upDate;
	// 是否为封面
	private boolean cover;
	// 保存该图片所属的图集
	private Album album;
	private Set<PhotoWord> photoWords = new HashSet<PhotoWord>();
	
	public Set<PhotoWord> getPhotoWords() {
		return photoWords;
	}

	public void setPhotoWords(Set<PhotoWord> photoWords) {
		this.photoWords = photoWords;
	}

	// 无参数的构造器
	public Photo(String title, String keyword, long times, String picUrl,
			String bigPicUrl, String smallPicUrl, String upDate, boolean cover,
			Album album) {
		setTitle(title);
		setKeyword(keyword);
		setTimes(times);
		setPicUrl(picUrl);
		setBigPicUrl(bigPicUrl);
		setSmallPicUrl(smallPicUrl);
		setUpDate(upDate);
		setAlbum(album);
		setCover(cover);
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public long getTimes() {
		return times;
	}

	public void setTimes(long times) {
		this.times = times;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getBigPicUrl() {
		return bigPicUrl;
	}

	public void setBigPicUrl(String bigPicUrl) {
		this.bigPicUrl = bigPicUrl;
	}

	public String getSmallPicUrl() {
		return smallPicUrl;
	}

	public void setSmallPicUrl(String smallPicUrl) {
		this.smallPicUrl = smallPicUrl;
	}

	public boolean isCover() {
		return cover;
	}

	public void setCover(boolean cover) {
		this.cover = cover;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public Photo() {
	}

	public String getUpDate() {
		return upDate;
	}

	public void setUpDate(String upDate) {
		this.upDate = upDate;
	}
}
