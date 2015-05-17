package com.np.dao;

import com.np.po.Photo;
import com.np.po.PhotoWord;
import java.util.List;

public interface PhotoWordDao
{
	/**
	 * ��������������Ƭ���ۡ�
	 * @param id ��Ҫ���ص���Ƭ����ID��
	 * @return ��������Ӧ����Ƭ����ʵ�塣
	 */
	PhotoWord get(Integer id);

	/**
	 * �����ض�����Ƭ����ʵ�塣
	 * @param photoWord ��Ҫ�������Ƭ���ۡ�
	 */
	void save(PhotoWord photoWord);

	/**
	 * �޸��ض����������ʵ��
	 * @param photoWord ��Ҫ�޸ĵ���Ƭ����
	 */
	void update(PhotoWord photoWord);

	/**
	 * ��������ɾ����Ƭ����
	 * @param id ��Ҫɾ������Ƭ����ID��
	 */
	void delete(int id);

	/**
	 * ɾ��ָ������Ƭ���ۡ�
	 * @param photoWord ��Ҫɾ������Ƭ����
	 */
	void delete(PhotoWord photoWord);

	/**
	 * ��ѯָ����Ƭ���ض�ҳ����Ƭ���ۡ�
	 * @param photo ��Ҫ��ȡ��Ƭ���۵�ָ����Ƭ
	 * @param first ��Ҫ��ȡ�ĵ�һ����Ƭ���ۡ�
	 * @praam pageSize ÿҳ��ʾ����Ƭ������
	 * @return ��������Ӧ����Ƭʵ�塣
	 */
	List<PhotoWord> getPhotoWordByPhoto(Photo photo, int first, int pageSize);

	/**
	 * ����ָ����Ƭ�ķ��ʴ���
	 * @param photo ��Ҫ��ȡ���ʴ�����ָ����Ƭ
	 * @return ָ����Ƭ��Ӧ�ķ��ʴ�����
	 */
	int getCount(Photo photo);
}
