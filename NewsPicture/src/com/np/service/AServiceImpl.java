package com.np.service;

import com.np.exception.NException;
import com.np.vo.AdminVO;
import com.np.service.AService;
import com.np.dao.AdminDao;
import com.np.dao.ChannelDao;
import com.np.po.Admin;
import com.np.po.Channel;

public class AServiceImpl implements AService {
	private AdminDao ad;

	public void setAd(AdminDao ad) {
		this.ad = ad;
	}

	private ChannelDao cd;

	public void setCd(ChannelDao cd) {
		this.cd = cd;
	}

	public AdminVO checkAdmin(String name, String pass) throws NException {
		try {
			Integer adminId = ad.findByNameAndPass(name, pass);
			Admin admin = ad.get(adminId);
			if (admin == null) {
				return null;
			}
			return fillAdminVO(admin);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("登录异常");
		}
	}

	public void addChannel(String title) throws NException {
		try {
			Channel channel = new Channel(title);
			cd.save(channel);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("添加栏目异常");
		}
	}

	public void updateChannel(Integer channelId, String title)
			throws NException {
		try {
			Channel channel = cd.get(channelId);
			channel.setTitle(title);
			cd.save(channel);
		} catch (Exception e) {
			e.printStackTrace();
			throw new NException("修改栏目信息异常");
		}
	}

	private AdminVO fillAdminVO(Admin admin) throws Exception {
		AdminVO avo = new AdminVO(admin.getId(), admin.getName(),
				admin.getPass());
		return avo;
	}

}
