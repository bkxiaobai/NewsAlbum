<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ͼ����ϵͳ</title>
<link href="css.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="js/validate.js"></script>
<body>
	<table>
		<tr>
			<td>
				<table align="center">
					<tr>
						<td>
							<div>
								<img src="images/3.png">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">��ҳ</a>&nbsp;
							<a href="myalbum.do">�ҵ����</a>&nbsp; <a
							href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
							target="targetFrame">���߱༭</a>&nbsp; <a href="index-3.html">����</a>&nbsp;
							<a href="index-3.html">��������</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="768" align="center" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="33" class="td_shang12">&nbsp;</td>
						<td width="13" class="td_shang12">&nbsp;</td>
						<td width="1156" valign="bottom" class="td_shang12"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="400" class="Statistic">
										&nbsp;<span class="comment_info">${sessionScope.userInfo.username}&nbsp;&nbsp;��ӭ����&nbsp;${sessionScope.albumInfo.title}&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;${requestScope.page.rsCount}&nbsp;��ͼƬ</span></td>
									<td class="sail"><div align="center">
											<a href="albumlist.do">���</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="addphotolink.do?albumId=${sessionScope.albumInfo.id}">�ϴ���Ƭ</a>
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td width="13" class="td_shang12">&nbsp;</td>
						<td width="45" height="35" class="td_shang12">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5">
							<div class="Statistic2">
								<bean:write name="success" scope="request" ignore="true" />
								<bean:write name="noexist" scope="request" ignore="true" />
								&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div align="center">
								<logic:empty name="photos" scope="request">
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<span class="sail">�ϴ���Ƭ�ɣ�</span>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</logic:empty>
								<logic:iterate id="photo" name="photos" scope="request">
									<div class="PhotoWrapClass">
										<div class="PhotoImgClass">
											<a href="viewphoto.do?photoId=${pageScope.photo.id}"><img
												src="${pageScope.photo.smallPicUrl}" border="0"> </a>
										</div>
										<div class="PhotoNameClass">
											<a href="#">${pageScope.photo.title}</a> |
											�����${pageScope.photo.times}<br> <br> �ϴ�ʱ��:<span
												class="PhotoNameClass">${pageScope.photo.upDate}</span><br>
											<br> <a
												href="changeCover.do?photoId=${pageScope.photo.id}">��Ϊ����</a><br>
											<a
												href="viewphotoinfo.do?photoId=${pageScope.photo.id}&userId=${sessionScope.userInfo.id}">�޸�</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="delphoto.do?photoId=${pageScope.photo.id}">ɾ��</a>
										</div>
									</div>
								</logic:iterate>
								<form name="pageForm" action="managephotopage.do">
									<input type="hidden" name="albumId"
										value="${requestScope.album.id}"> <input type="hidden"
										name="currentPage" value="${requestScope.page.currentPage}">
									<input type="hidden" name="pageCount"
										value="${requestScope.page.pageCount}">
								</form>
							</div></td>
					</tr>
					<tr>
						<td colspan="5" class="Statistic2"><a
							href="seealbumcomment.do?albumId=${sessionScope.albumInfo.id}">����鿴����</a>
						</td>
					</tr>
					<tr>
						<td height="40" colspan="5" class="td_down"><div
								align="center">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="td_xia12">
									<tr>
										<td class="page"><div align="right">
												��${requestScope.page.pageCount} ҳ ��ǰ��
												${requestScope.page.currentPage}/${requestScope.page.pageCount}
												<a href="javascript:firstPage(pageForm);">��ҳ</a> <a
													href="javascript:prePage(pageForm);">��һҳ</a> <a
													href="javascript:nextPage(pageForm);">��һҳ</a> <a
													href="javascript:lastPage(pageForm);">βҳ</a>
											</div>
										</td>
										<td width="32">&nbsp;</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
