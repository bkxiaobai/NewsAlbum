<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻图库子系统</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.STYLE1 {color: #000000}
</style>
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
						</div></td>
				</tr>
			</table></td>
	</tr>
	<tr>
			<td>
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">主页</a>&nbsp; <a href="myalbum.do">我的相册</a>&nbsp;
							<a
							href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
							target="targetFrame">在线编辑</a>&nbsp; <a href="index-3.html">搜索</a>&nbsp;
							<a href="index-3.html">关于我们</a></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="768" align="center" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
            <td height="30" colspan="2">
				<jsp:include page="l_sail.jsp"/>
			</td>
            </tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="19" class="td_shang12">&nbsp;</td>
						<td width="8" class="td_shang12">&nbsp;</td>
						<td width="666" valign="bottom" class="td_shang12"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="400" class="Statistic2"><p><span class="Statistic2">&nbsp;${sessionScope.channel.title} </span>${requestScope.page.rsCount}个相册</p>
									  </td>
									<td class="tuijian">&nbsp;</td>
								</tr>
							</table>
						</td>
						<td width="8" class="td_shang12">&nbsp;</td>
						<td width="19" height="35" class="td_shang12">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5">
							<div align="center">
								<logic:iterate id="album" name="albums" scope="request">
									<div class="PhotoWrapClass">
										<div class="PhotoImgClass">
											<logic:present name="album" property="coverUrl">
												<a href="viewalbumk.do?albumId=${pageScope.album.id}"> <img
													src="${pageScope.album.coverUrl}" border="0">
												</a>
											</logic:present>
											<logic:notPresent name="album" property="coverUrl">
												<a href="viewalbumk.do?albumId=${pageScope.album.id}"> <img
													src="none.gif" width="140" height="105" border="0">
												</a>
												<br>
											</logic:notPresent>
										</div>
										<div class="PhotoNameClass">
											<a href="#">${pageScope.album.title}</a>
										</div>
									</div>
								</logic:iterate>
							</div>
							<form action="otheralbums.do" name="form1">
								<input name="channelId" type="hidden"
									value="${requestScope.channel.id}"> <input
									name="currentPage" type="hidden"
									value="${requestScope.page.currentPage}"> <input
									name="pageCount" type="hidden"
									value="${requestScope.page.pageCount}">
							</form></td>
					</tr>
					<tr>
						<td height="40" colspan="5" class="td_down"><div
								align="center">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="td_xia12">
									<tr>
										<td class="page"><div align="right">
												共${requestScope.page.pageCount}页
												当前：${requestScope.page.currentPage}/${requestScope.page.pageCount}
												<a href="javascript:firstPage(form1);">首页</a> <a
													href="javascript:prePage(form1);">上一页</a> <a
													href="javascript:nextPage(form1);">下一页</a> <a
													href="javascript:lastPage(form1);">尾页</a>
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
