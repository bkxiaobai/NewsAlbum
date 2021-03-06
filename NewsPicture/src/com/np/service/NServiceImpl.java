package com.np.service;

import com.np.vo.AlbumWordVO;
import com.np.vo.PhotoWordVO;
import com.np.po.AlbumWord;
import com.np.po.PhotoWord;
import com.np.dao.AlbumWordDao;
import com.np.dao.PhotoWordDao;
import com.np.service.NService;
import com.np.dao.PhotoDao;
import com.np.dao.UserDao;
import com.np.dao.AlbumDao;
import com.np.dao.ChannelDao;
import com.np.po.Photo;
import com.np.po.User;
import com.np.po.Channel;
import com.np.po.Album;
import com.np.vo.PhotoVO;
import com.np.vo.UserVO;
import com.np.vo.AlbumVO;
import com.np.vo.ChannelVO;
import com.np.exception.NException;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

public class NServiceImpl implements NService {
	// 业务逻辑组件持久化访问依赖的PhotoDao组件
	private PhotoDao pd;
	// 业务逻辑组件持久化访问依赖的UserDao组件
	private UserDao ud;
	// 业务逻辑组件持久化访问依赖的AlbumDao组件
	private AlbumDao ad;
	// 业务逻辑组件持久化访问依赖的ChannelDao组件
	private ChannelDao cd;
	// 业务逻辑组件持久化访问依赖的PhotoWordDao组件
	private PhotoWordDao pwd;
	// 业务逻辑组件持久化访问依赖的AlbumWordDao组件
	private AlbumWordDao awd;

	// spring中ioc的实现

	// 依赖注入各种DAO组件所必须的setter方法
	public void setAd(AlbumDao ad) {
		this.ad = ad;
	}

	public void setPd(PhotoDao pd) {
		this.pd = pd;
	}

	public void setCd(ChannelDao cd) {
		this.cd = cd;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	public void setPwd(PhotoWordDao pwd)
	{
		this.pwd = pwd;
	}
	public void setAwd(AlbumWordDao awd)
	{
		this.awd = awd;
	}
	
	
	public void addPhotoWord(String title, String content, String addDate, Integer photoId, Integer clientId)
			throws NException
		{
			try
			{
				Photo photo = pd.get(photoId);
				User client = ud.get(clientId);
				pwd.save(new PhotoWord(title, content, addDate, photo, client));
			}
			catch (Exception e)
			{
				e.printStackTrace(); 
				throw new NException("发表评论异常");
			}
		}
		/**
		 * 新增相册评论
		 * @param title
		 * @param content
		 * @param addDate
		 * @param AlbumId
		 * @param clientId
		 * @throws MyException
		 */
		public void addAlbumWord(String title, String content, String addDate, Integer albumId, Integer clientId)throws NException
		{
			try
			{
				Album album = ad.get(albumId);
				User client = ud.get(clientId);
				awd.save(new AlbumWord(title, content, addDate, album, client));
			}
			catch (Exception e)
			{
				e.printStackTrace(); 
				throw new NException("发表评论异常");
			}
		}
	
		public List<AlbumWordVO> getAlbumWords(Integer AlbumId, int first, int pageSize)throws NException
		{
			try
			{
				List<AlbumWordVO> awvos = new ArrayList<AlbumWordVO>();
				Album album = ad.get(AlbumId);
				List<AlbumWord> aws = awd.getAlbumWordByPhoto(album, first, pageSize);
				for (Iterator<AlbumWord> it = aws.iterator() ; it.hasNext() ; )
				{
					AlbumWord aw = (AlbumWord)it.next();
					awvos.add(fillAlbumVO(aw));
				}
				return awvos;
			}
			catch (Exception e)
			{
				e.printStackTrace(); 
				throw new NException("查询相片留言异常");
			}
			
		}

		public int getAlbumWordCount(Integer AlbumId)throws NException
		{
			try
			{
				Album album = ad.get(AlbumId);
				return awd.getCount(album);
			}
			catch (Exception e)
			{
				e.printStackTrace(); 
				throw new NException("查询评论总数异常");
			}
		}
		
		public List<PhotoWordVO> getPhotoWords(Integer photoId, int first, int pageSize)throws NException
		{
			try
			{
				List<PhotoWordVO> pwvos = new ArrayList<PhotoWordVO>();
				Photo photo = pd.get(photoId);
				List<PhotoWord> pws = pwd.getPhotoWordByPhoto(photo, first, pageSize);
				for (Iterator<PhotoWord> it = pws.iterator() ; it.hasNext() ; )
				{
					PhotoWord pw = (PhotoWord)it.next();
					pwvos.add(fillPhotoVO(pw));
				}
				return pwvos;
			}
			catch (Exception e)
			{
				e.printStackTrace(); 
				throw new NException("查询相片留言异常");
			}
		}

		/**
		 * 根据相片评论ID获取相片评论总数
		 * @param photoId 指定相片ID
		 * @return 该相片对应的相片评论总数。
		 */
		public int getWordCount(Integer photoId)throws NException
		{
			try
			{
				Photo photo = pd.get(photoId);
				return pwd.getCount(photo);
			}
			catch (Exception e)
			{
				e.printStackTrace(); 
				throw new NException("查询评论总数异常");
			}
		}
		/**
	 * 新增相册
	 * 
	 * @param title
	 *            相册名字
	 * @param date
	 *            相册的创建时间。
	 * @param times
	 *            相册的访问次数。
	 * @param userId
	 *            相册的创建人ID
	 * @param channelId
	 *            相册所属的相册分类ID
	 */
	public void addAlbum(String title, String keyword, String createDate,
			long times, Integer userId, Integer channelId) throws NException {
		try {
			User user = ud.get(userId);
			Channel channel = cd.get(channelId);
			Album album = new Album(title, keyword, createDate, times, user,
					channel);
			ad.save(album);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("添加相册异常,请重试");
		}
	}

	/**
	 * 更新相册
	 * 
	 */
	public void updateAlbum(String title, String keyword, Integer channelId,
			Integer albumId) throws NException {
		try {
			Album album = ad.get(albumId);
			Channel channel = cd.get(channelId);
			album.setChannel(channel);
			album.setTitle(title);
			album.setKeyword(keyword);
			ad.update(album);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("修改相册信息异常");
		}

	}

	/**
	 * 更新点击数
	 */
	public void updateTimes(Integer albumId) throws NException {
		try {
			Album album = ad.get(albumId);
			album.setTimes(album.getTimes() + 1);
			ad.update(album);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("更新点击数出现异常");
		}
	}

	/**
	 * 判断相册内是否含有相片
	 * 
	 * @param albumId
	 * @return
	 */
	public boolean checkHavePhotos(int albumId) throws NException {
		try {
			Album album = ad.get(albumId);
			if (album.getPhotos().isEmpty())
				return false;
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("检查是否含有照片异常，请重试");
		}
	}

	/**
	 * 删除相册
	 * 
	 * @param albumId
	 *            需要删除的相册ID
	 */
	public void deleteAlbum(int albumId) throws NException {
		// 在配置文件Album.hbm.xml中将Photos 属性中加上了关闭延迟加载 不然的话会报一个异常
		try {
			ad.delete(albumId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("删除相册异常");
		}
	}

	/**
	 * 检查指定ID的相册是否存在
	 * 
	 * @param id
	 *            需要检查的相册ID
	 * @return 存在返回true，不存在返回false。
	 */
	public boolean checkAlbum(Integer id) throws NException {
		try {
			Album album = ad.get(id);
			if (album == null) {
				return false;
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("检验相册出现异常，请重试");
		}

	}

	/**
	 * 根据ID来获取相册资料。
	 * 
	 * @param id
	 *            需要获取相册资料的ID。
	 * @return 指定ID对应的相册值对象。
	 */
	public AlbumVO getAlbum(Integer id) throws NException {
		try {
			AlbumVO vo = null;
			Album album = ad.get(id);
			if (pd.getCover(album, true) == null) {
				vo = fillAlbumVO(album);
			} else {
				Photo ph = pd.get(pd.getCover(album, true));
				vo = fillAlbumVO(album, ph);
			}
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取相册资料异常");
		}
	}

	/**
	 * 设置相册封面
	 * 
	 * @param albumId
	 *            指定相册ID
	 * @param photoId
	 *            需要设置为相册封面的相片ID
	 */
	public void setCover(Integer albumId, Integer photoId) throws NException {
		try {
			Album album = ad.get(albumId);
			Photo photo = pd.get(photoId);
			Photo coverPhoto = pd.getCoverPhoto(album, true);
			if (coverPhoto == null) {
				photo.setCover(true);
				pd.update(photo);
			} else {
				coverPhoto.setCover(false);
				photo.setCover(true);
				pd.update(photo);
				pd.update(coverPhoto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("设置相册封面异常");
		}
	}

	/**
	 * 根据用户名和密码校验用户登录
	 * 
	 * @param name
	 *            需要校验的用户名
	 * @param pass
	 *            需要校验的密码
	 * @return 查询用户，如果查询不到用户返回false
	 */
	public int checkUser(String username, String password) throws NException {
		try {
			Integer id = ud.findByNameAndPass(username, password);
			if (id == null) {
				return -1;
			}
			return id.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("检查用户异常,请重试");
		}
	}

	/**
	 * 获取指定用户的相册列表
	 * 
	 * @param clientId
	 *            指定用户的ID
	 * @param first
	 *            需要显示的第一相册ID
	 * @param pageSize
	 *            每页显示的相册数量。
	 * @return 该用户对应的相册列表。
	 */
	public List<AlbumVO> getUserAlbums(int userId, int first, int pageSize)
			throws NException {
		try {
			User user = ud.get(userId);
			List<Album> result = ad.getAllByUser(user, first, pageSize);
			List<AlbumVO> vos = new ArrayList<AlbumVO>();
			for (Iterator<Album> it = result.iterator(); it.hasNext();) {
				AlbumVO vo = null;
				Album al = (Album) it.next();
				if (pd.getCover(al, true) == null) {
					vo = fillAlbumVO(al);
				} else {
					Photo ph = pd.get(pd.getCover(al, true));
					vo = fillAlbumVO(al, ph);
				}
				vos.add(vo);
			}
			return vos;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取用户相册异常");
		}
	}

	/**
	 * 获取指定用户的相册数量。
	 * 
	 * @param userId
	 *            需要获得相册数量的用户ID
	 * @return 该用户的相册数量
	 */
	public int getAlbumCount(int userId) throws NException {
		try {
			User user = ud.get(userId);
			return ad.getAmount(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取相册数量异常");
		}
	}

	/**
	 * 根据ID获取指定相册的信息
	 * 
	 * @param id
	 *            指定的相册ID
	 * @return 该相册的信息
	 */
	public AlbumVO getUserAlbum(Integer id) throws NException {
		try {
			Album album = ad.get(id);
			if (album == null) {
				return null;
			}
			return fillAlbumVO(album);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取单个相册信息异常");
		}
	}

	/*
	 * 获取指定ID的用户信息
	 * 
	 * @param userId 指定用户的用户ID。
	 * 
	 * @return 指定用户的详细信息
	 */
	public UserVO getUserInfo(int userId) throws NException {
		try {
			User user = ud.get(userId);
			if (user == null) {
				return null;
			}
			return fillUserInfoVO(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取用户资料异常,请重试");
		}
	}

	/**
	 * 判断指定用户名的用户是否存在
	 * 
	 * @param name
	 *            需要判断的用户名
	 * @return 如果该用户名对应的用户存在，则返回true，否则返回false
	 */
	public boolean checkUserName(String username) throws NException {
		try {
			if (ud.findByName(username) == null) {
				return false;
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("检验用户名时出现异常");
		}
	}

	/**
	 * 添加用户
	 * 
	 * @param name
	 *            添加用户的用户名
	 * @param pass
	 *            添加用户的密码
	 * @param sex
	 *            添加用户的密码
	 * @param mail
	 *            添加用户的电子邮件。
	 * @return 新增用户的主键值
	 */
	public int addUser(String username, String password) throws NException {
		try {
			User user = new User(username, password);
			ud.save(user);
			return user.getId();
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("注册用户时出现异常");
		}
	}

	/**
	 * 根据种类来获取相册列表
	 * 
	 * @param ChannelId
	 *            需要获取的相册种类ID
	 * @param first
	 *            需要显示的第一个相册
	 * @param pageSize
	 *            每页显示的相册数量
	 * @return 查询到的相册列表
	 */
	public List<AlbumVO> getAlbumsByChannel(Integer channelId, int first,
			int pageSize) throws NException {
		try {
			Channel channel = cd.get(channelId);
			List<AlbumVO> avos = new ArrayList<AlbumVO>();
			List<Album> albums = cd.getAllByChannel(channel, first, pageSize);
			for (Iterator<Album> it = albums.iterator(); it.hasNext();) {
				AlbumVO avo = null;
				Album album = (Album) it.next();
				if (pd.getCover(album, true) == null) {
					avo = fillAlbumVO(album);
				} else {
					Photo ph = pd.get(pd.getCover(album, true));
					avo = fillAlbumVO(album, ph);
				}
				avos.add(avo);
			}
			return avos;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("异常");
		}
	}

	/**
	 * 获取指定相册分类下的相册数量
	 * 
	 * @param channelId
	 *            需要查询的相册分类ID
	 * @return 指定相册分类下的相册数量
	 */
	public int getAlbumCount(Integer channelId) throws NException {
		try {
			Channel channel = cd.get(channelId);
			return cd.getAmount(channel);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("查询相册总数异常");
		}
	}

	/**
	 * 获取指定相册分类ID对应相册分类信息
	 * 
	 * @param channelId
	 *            需要查询的相册分类ID
	 * @return 指定相册分类ID对应的相册分类信息
	 */
	public ChannelVO getChannel(Integer channelId) throws NException {
		try {
			Channel channel = cd.get(channelId);
			return fillChannelVO(channel);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取单个栏目异常");
		}
	}

	/**
	 * 根据相册获取该相册包含的相片。
	 * 
	 * @param albumId
	 *            需要查询的相册ID
	 * @param first
	 *            需要显示的第一张相片
	 * @param pageCount
	 *            每页显示的相片数量
	 * @return 查询到该相册包含的全部相片。
	 */
	public List<PhotoVO> getPhotos(Integer albumId, int first, int pageCount)
			throws NException {
		try {
			Album album = ad.get(albumId);
			List<Photo> result = pd.getPhotos(album, first, pageCount);
			List<PhotoVO> pvos = new ArrayList<PhotoVO>();
			for (Iterator<Photo> it = result.iterator(); it.hasNext();) {
				Photo ph = (Photo) it.next();
				pvos.add(fillPhotoVO(ph));
			}
			return pvos;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("查询该相册相片异常,请重试");
		}
	}

	public List<PhotoVO> findPhotos(String title) throws NException {
		try {
			List<Photo> result = pd.findByTitle(title);
			List<PhotoVO> pvos = new ArrayList<PhotoVO>();
			for (Iterator<Photo> it = result.iterator(); it.hasNext();) {
				Photo ph = (Photo) it.next();
				pvos.add(fillPhotoVO(ph));
			}
			return pvos;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("查询图片异常,请重试");
		}
	}

	/**
	 * 获取指定相册下包含相片数量
	 * 
	 * @param albumId
	 *            指定相册的ID
	 * @return 该相册下包含的相片ID。
	 */
	public int getCount(Integer albumId) throws NException {
		try {
			Album album = ad.get(albumId);
			return pd.getCount(album);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取记录总数异常,请重试");
		}
	}

	/**
	 * 获取相册所属于的相册大类
	 * 
	 * @param AlbumId
	 *            需要查询的相册ID
	 * @return 指定相册对应的相册大类。
	 */
	public ChannelVO getChannelByAlbum(Integer AlbumId) throws NException {
		try {
			Channel channel = ad.get(AlbumId).getChannel();
			return fillChannelVO(channel);
		} catch (Exception e) {

			throw new NException("获取相片种类异常");
		}
	}

	/**
	 * 增加一张相片
	 * 
	 * @param title
	 *            相片标题
	 * @param keyword
	 *            相片描述
	 * @param times
	 *            相片访问次数。
	 * @param picUrl
	 *            相片的URL
	 * @param bigPicUrl
	 *            相片大图的URL
	 * @param smallPicUrl
	 *            相片小图的URL
	 * @param date
	 *            相片的添加日期
	 * @param cover
	 *            是否为相册封面。
	 * @param albumId
	 *            该相片需要添加到的相册ID
	 */
	public void addPhoto(String title, String keyword, long times,
			String picUrl, String bigPicUrl, String smallPicUrl, String upDate,
			boolean cover, Integer albumId) throws NException {
		try {
			Album album = ad.get(albumId);
			Photo photo = new Photo(title, keyword, times, picUrl, bigPicUrl,
					smallPicUrl, upDate, cover, album);
			pd.save(photo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("添加照片异常,请重试");
		}
	}

	/**
	 * 修改相片信息
	 */
	public void updatePhoto(String title, String keyword, Integer albumId,
			Integer photoId) throws NException {
		try {
			Photo photo = pd.get(photoId);
			photo.setTitle(title);
			photo.setKeyword(keyword);
			photo.setCover(false);
			Album album = ad.get(albumId);
			photo.setAlbum(album);
			pd.update(photo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("修改相片信息时出现异常");
		}
	}

	/**
	 * 更新点击数
	 * 
	 * @param phId
	 *            更新点击相片的点击数
	 */
	public void updatePhotoTimes(Integer photoId) throws NException {
		try {
			Photo photo = pd.get(photoId);
			photo.setTimes(photo.getTimes() + 1);
			pd.update(photo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("更新点击数出现异常");
		}
	}

	/**
	 * 判断指定ID对应的相片是否存在。
	 * 
	 * @param 需要查询的相片ID
	 * @return 如果该ID对应的相片存在，返回true，否则返回false。
	 */
	public boolean checkPhoto(Integer photoId) throws NException {
		try {
			Photo photo = pd.get(photoId);
			if (photo == null) {
				return false;
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("校验相片出现异常");
		}
	}

	/**
	 * 删除指定相片
	 * 
	 * @param 需要删除的相片ID
	 */
	public void deletePhoto(int photoId) throws NException {
		try {
			pd.delete(photoId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("删除照片异常");
		}
	}

	/**
	 * 判断指定ID获取对应的相片
	 * 
	 * @param 需要查询的相片ID
	 * @return 返回该ID对应的相片
	 */
	public PhotoVO getPhoto(Integer photoId) throws NException {
		try {
			Photo photo = pd.get(photoId);
			PhotoVO pvo = fillPhotoVO(photo);
			return pvo;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("查询照片信息异常");
		}
	}

	/**
	 * 获取相片所属于的相册分类
	 * 
	 * @param photoId
	 *            需要查询的相片ID
	 * @return 指定相片对应的相册分类。
	 */
	public ChannelVO getChannelByPhoto(Integer photoId) throws NException {
		try {
			Channel channel = pd.get(photoId).getAlbum().getChannel();
			return fillChannelVO(channel);
		} catch (Exception e) {

			throw new NException("获取相片种类异常");
		}
	}

	/**
	 * 获取系统中全部相册分类
	 * 
	 * @return 系统包含的全部相册分类
	 */
	public List<ChannelVO> getAllChannel() throws NException {
		try {
			List<ChannelVO> result = new ArrayList<ChannelVO>();
			List<Channel> channels = cd.getAll();
			for (Iterator<Channel> it = channels.iterator(); it.hasNext();) {
				Channel channel = (Channel) it.next();
				result.add(fillChannelVO(channel));
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取所有种类异常");
		}

	}

	/**
	 * 获取当前用户的相册分类
	 * 
	 * @param cId
	 *            用户的主键值。
	 */
	public List<AlbumVO> getMyAlbum(Integer userId) throws NException {
		try {
			User user = ud.get(userId);
			List<AlbumVO> result = new ArrayList<AlbumVO>();
			List<Album> albums = ad.getAllByUser(user);
			for (Iterator<Album> it = albums.iterator(); it.hasNext();) {
				Album album = (Album) it.next();
				result.add(fillAlbumVO(album));
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("获取所有种类异常");
		}

	}

	/**
	 * 修改用户的密码
	 * 
	 * @param id
	 *            需要修改的用户ID信息
	 * @param pass
	 *            需要修改的用户新密码
	 */
	public void updateUser(Integer id, String password) throws NException {
		try {
			User user = ud.get(id);
			user.setPassword(password);
			ud.update(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("修改密码异常");
		}

	}

	// --------------------------------------------------
	// 下面包含六个用于将PO转换成VO的工具方法。
	// --------------------------------------------------
	private UserVO fillUserInfoVO(User user) throws Exception {
		UserVO uvo = new UserVO(user.getId(), user.getUsername(),
				user.getPassword());
		return uvo;
	}

	private AlbumVO fillAlbumVO(Album album, Photo photo) throws Exception {
		AlbumVO avo = null;
		avo = new AlbumVO(album.getId(), album.getTitle(), album.getKeyword(),
				album.getCreateDate(), album.getTimes(), album.getUser()
						.getId(), album.getUser().getUsername(), album
						.getChannel().getId(), album.getChannel().getTitle(),
				photo.getId(), photo.getSmallPicUrl());
		return avo;
	}

	private AlbumVO fillAlbumVO(Album album) throws Exception {
		AlbumVO avo = null;
		avo = new AlbumVO(album.getId(), album.getTitle(), album.getKeyword(),
				album.getCreateDate(), album.getTimes(), album.getUser()
						.getId(), album.getUser().getUsername(), album
						.getChannel().getId(), album.getChannel().getTitle());
		return avo;
	}

	private ChannelVO fillChannelVO(Channel channel) throws Exception {
		ChannelVO cvo = new ChannelVO(channel.getId(), channel.getTitle());
		return cvo;
	}

	private PhotoVO fillPhotoVO(Photo photo) throws Exception {
		PhotoVO pvo = new PhotoVO(photo.getId(), photo.getTitle(),
				photo.getKeyword(), photo.getTimes(), photo.getPicUrl(),
				photo.getBigPicUrl(), photo.getSmallPicUrl(),
				photo.getUpDate(), photo.isCover(), photo.getAlbum().getId(),
				photo.getAlbum().getTitle());
		return pvo;
	}
	private PhotoWordVO fillPhotoVO(PhotoWord pw)throws Exception
	{
		PhotoWordVO pwvo = new PhotoWordVO(pw.getId(), pw.getTitle(), pw.getContent(), pw.getAddDate(), 
			pw.getPhoto().getId(), pw.getPhoto().getTitle(), pw.getUser().getId(), pw.getUser().getUsername());
		return pwvo;
	}
	private AlbumWordVO fillAlbumVO(AlbumWord aw)throws Exception
	{
		AlbumWordVO awvo = new AlbumWordVO(aw.getId(), aw.getTitle(), aw.getContent(), aw.getAddDate(), 
			aw.getAlbum().getId(), aw.getAlbum().getTitle(), aw.getUser().getId(), aw.getUser().getUsername());
		return awvo;
	}
}
