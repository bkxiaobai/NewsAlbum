package com.np.dao;

import java.util.List;

import com.np.po.Album;
import com.np.po.AlbumWord;

public interface AlbumWordDao  
{
	/**
	 * ������������������ۡ�
	 * @param id ��Ҫ���ص��������ID��
	 * @return ��������Ӧ��������ۡ�
	 */
	AlbumWord get(Integer id);

	/**
	 * �����ض����������ʵ�塣
	 * @param albumWord ��Ҫ�����������ۡ�
	 */
	void save(AlbumWord albumWord);

	/**
	 * �޸��ض����������ʵ��
	 * @param albumWord ��Ҫ�޸ĵ��������
	 */
	void update(AlbumWord albumWord);

	/**
	 * ��������ɾ���������
	 * @param id ��Ҫɾ�����������ID��
	 */
	void delete(int id);

	/**
	 * ɾ��ָ����������ۡ�
	 * @param albumWord ��Ҫɾ�����������
	 */
	void delete(AlbumWord albumWord);
	/**
	 * ��ȡָ��ID������
	 * @param album
	 * @param first
	 * @param pageSize
	 * @return
	 */
	List<AlbumWord> getAlbumWordByPhoto(final Album album, final int first, final int pageSize);
	/**
	 * ��ȡ����µ�
	 * @param album
	 * @return
	 */
	int getCount(Album album);

}
