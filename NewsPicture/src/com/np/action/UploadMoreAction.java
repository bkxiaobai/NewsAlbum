package com.np.action;

import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.upload.FormFile;

import com.np.service.NService;
import com.np.tool.DateUtil;
import com.np.tool.PlUploadForm;
import com.np.tool.Upload;
import com.np.tool.WebUrl;
import com.np.vo.AlbumVO;
import com.np.vo.UserVO;

public class UploadMoreAction extends Action {

	
	private NService ns;

	public void setNs(NService ns)
	{
		this.ns = ns;
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PlUploadForm umForm = (PlUploadForm) form;
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("userInfo");
		AlbumVO avo = (AlbumVO)session.getAttribute("albumInfo");
		Integer albumId = Integer.valueOf(avo.getId());
		int userId = uvo.getId();
		String userPath = WebUrl.DATA_URL + String.valueOf(userId);
		String path = WebUrl.NEW_DATA_URL + String.valueOf(userId);
		System.out.println(userPath);
		String title = (String)umForm.getTitle();
		String keyword = (String)umForm.getKeyword();
		System.out.println("title=" + title);  
		System.out.println("keyword=" + keyword);
		int count = 0;
		try {
			count = umForm.getFileCount(); // 获得上传文件的总数
			for (int i = 0; i < count; i++) {
				DynaActionForm addPhotoForm = (DynaActionForm)form;
				FormFile file = (FormFile)addPhotoForm.get("image");
				try
				{
					String fileName = file.getFileName();
					String suffix = fileName.substring(fileName.indexOf("."));
					System.out.println(suffix);
					if (checkImage(suffix) == false)
					{
						request.setAttribute("wrongType", "上传类型错误,请重新上传");
						return mapping.findForward("wrongType");
					}
					if (checkImageSize(file, 2097152) == false)
					{
						request.setAttribute("tooBig", "上传的文件过大,请不要上传2M以上的图片");
						return mapping.findForward("tooBig");
					}
					Upload upload = new Upload();
					upload.upload(file, userPath, suffix);
					upload.makeImage(upload.getUrl(), 140, -20, upload.makeNewUrl(userPath, suffix, "_small"), suffix.substring(1));
					upload.makeImage(upload.getUrl(), 600, -20, upload.makeNewUrl(userPath, suffix, "_big"), suffix.substring(1));
					ns.addPhoto(title, keyword, 0, upload.makeNewUrl(path, suffix, ""), upload.makeNewUrl(path, suffix, "_big"), 
						upload.makeNewUrl(path, suffix, "_small"), DateUtil.getFormalTime(), false, albumId);
					System.out.println(path);
					request.setAttribute("success", "上传图片成功");
					return mapping.findForward("success");
				}
				catch (Exception e)
				{
					request.setAttribute("nofind", "找不到该文件,请重新上传");
					return mapping.findForward("nofind");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	private boolean checkImage(String suffix)
	{
		//本类只可以上传JEPG和BMP的图片
		if (suffix.equalsIgnoreCase(".jpg"))
		{
			return true;
		}
		else if (suffix.equalsIgnoreCase(".bmp"))
		{
			return true;
		}
		if (suffix.equalsIgnoreCase(".png"))
		{
			return true;
		}
		if (suffix.equalsIgnoreCase(".gif"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	private boolean checkImageSize(FormFile file, int size)
	{
		//如果文件大小比限定的值大,则返回false
		if (file.getFileSize() > size)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}