package com.np.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.DynaActionForm;

import com.np.service.NService;

import java.util.List;
import com.np.vo.PhotoVO;
import com.np.vo.PhotoWordVO;
import com.np.vo.ChannelVO;
import com.np.tool.PageConst;

public class OtherPhotoWordAction extends Action
{
	private NService ns;

	public void setNs(NService ns)
	{
		this.ns = ns;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, 
		HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		DynaActionForm photoWordPageForm = (DynaActionForm)form;
		Integer photoId = Integer.valueOf((String)photoWordPageForm.get("photoId"));
		int currentPage = Integer.parseInt((String)photoWordPageForm.get("currentPage"));
		int rsCount = ns.getWordCount(photoId);
		PageConst pc = new PageConst(rsCount, currentPage);
		List<PhotoWordVO> pwvos = ns.getPhotoWords(photoId, pc.getPageFirst(), PageConst.PAGE_SIZE);
		PhotoVO pvo = ns.getPhoto(photoId);
		ChannelVO cvo = ns.getChannelByPhoto(photoId);
		request.setAttribute("pwvo", pwvos);
		request.setAttribute("page", pc);
		request.setAttribute("photo", pvo);
		request.setAttribute("channel", cvo);
		return mapping.findForward("success");
	}
}
