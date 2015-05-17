package com.np.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.DynaActionForm;

import com.np.service.NService;
import com.np.vo.UserVO;
import com.np.tool.DateUtil;

public class AddCommentAction extends Action
{
	private NService ns;

	public void setNs(NService ns)
	{
		this.ns = ns;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, 
		HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		UserVO uvo = (UserVO)request.getSession().getAttribute("userInfo");
		DynaActionForm commentForm = (DynaActionForm)form;
		String title = (String)commentForm.get("title");
		String content = (String)commentForm.get("content");
		String addTime = DateUtil.getFormalTime();
		Integer photoId = Integer.valueOf((String)commentForm.get("photoId"));
		Integer userId = Integer.valueOf(uvo.getId());
		ns.addPhotoWord(title, content, addTime, photoId, userId);
		ActionForward af = new ActionForward("/seecomment.do?photoId=" + String.valueOf(photoId));
		return af;
	}
}
