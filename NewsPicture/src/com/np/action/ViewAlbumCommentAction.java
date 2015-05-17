package com.np.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import java.util.List;

import com.np.vo.AlbumVO;
import com.np.vo.AlbumWordVO;
import com.np.vo.ChannelVO;
import com.np.service.NService;
import com.np.tool.PageConst;

public class ViewAlbumCommentAction extends Action
{
	private NService ns;

	public void setNs(NService ns)
	{
		this.ns = ns;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, 
		HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		Integer albumId = Integer.valueOf(request.getParameter("albumId"));
		if (ns.checkAlbum(albumId) == false)
		{
			request.setAttribute("noexist", "你要查看相册不存在");
			return mapping.findForward("noexist");
		}
		request.getSession().setAttribute("albumId",albumId);
		List<AlbumWordVO> awvos = ns.getAlbumWords(albumId, PageConst.FIRST, PageConst.PAGE_SIZE);
		int rsCount = ns.getAlbumWordCount(albumId);
		PageConst pc = new PageConst(rsCount, 1);
		if (awvos.size() == 0)
		{
			request.setAttribute("nohave", "暂无评论");
		}
		else
		{
			request.setAttribute("awvo", awvos);
		}
		AlbumVO avo = ns.getAlbum(albumId);
		ChannelVO cvo = ns.getChannelByAlbum(albumId);
		request.setAttribute("page", pc);
		request.setAttribute("album", avo);
		request.setAttribute("channel", cvo);
		return mapping.findForward("success");
	}
}
