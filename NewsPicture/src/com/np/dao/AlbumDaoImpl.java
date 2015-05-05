package com.np.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.np.dao.AlbumDao;
import com.np.po.User;
import com.np.po.Album;

public class AlbumDaoImpl extends HibernateDaoSupport implements AlbumDao {
	public Album get(Integer id) {
		return (Album) getHibernateTemplate().get(Album.class, id);
	}

	public void save(Album album) {
		getHibernateTemplate().save(album);
	}

	public void update(Album album) {
		getHibernateTemplate().update(album);
	}

	public void delete(int id) {
		getHibernateTemplate().delete(
				getHibernateTemplate().get(Album.class, new Integer(id)));
	}

	public void delete(Album album) {
		getHibernateTemplate().delete(album);
	}

	public List<Album> getAllByUser(final User user, final int first,
			final int pageSize) {
		@SuppressWarnings("unchecked")
		List<Album> result = (List<Album>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						List<?> tmp = session
								.createQuery(
										"from Album as al where al.user = :user")
								.setEntity("user", user).setFirstResult(first)
								.setMaxResults(pageSize).list();
						return tmp;
					}
				});
		return result;
	}

	public List<Album> getAllByUser(final User user) {
		@SuppressWarnings("unchecked")
		List<Album> result = (List<Album>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						List<?> tmp = session
								.createQuery(
										"from Album as al where al.user = :user")
								.setEntity("user", user).list();
						return tmp;
					}
				});
		return result;
	}

	// 获取该用户相册数量
	public int getAmount(User user) {
		Object[] args = { user };
		List<?> result = getHibernateTemplate().find(
				"from Album as al where al.user = ?", args);
		return result.size();
	}

}
