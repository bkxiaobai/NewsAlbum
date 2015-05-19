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
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="19" class="td_shang12">&nbsp;</td>
						<td width="8" class="td_shang12">&nbsp;</td>
						<td width="666" valign="bottom" class="td_shang12"><table
								width="100%" border="0" cellspacing="0" cellpadding="0"
								align="right">
								<tr>
								  <td width="246" class="comment_info">&nbsp;&nbsp;<span class="comment_info"> 
						          <bean:write
											name="userInfo" scope="session" property="username"  />
						          欢迎进入&nbsp;&nbsp;&nbsp;&nbsp;你共有
                                  <bean:write name="page"
											scope="request" property="rsCount" />
								  个相册</span></td>
									<td width="313" class="Statistic" align="right"><jsp:include
											page="album_sail.jsp" /></td>
								</tr>
							</table></td>
						<td width="8" class="td_shang12">&nbsp;</td>
						<td width="19" height="35" class="td_shang12">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5">
							<div class="sail">
								<bean:write name="success" scope="request" ignore="true" />
								<bean:write name="noexist" scope="request" ignore="true" />
								&nbsp;&nbsp;&nbsp;&nbsp;
							</div> <logic:empty name="albums" scope="request">
								<div align="center">
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div class="sail">&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div>
										<span class="PhotoNameClass">暂无相册</span>
									</div>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</div>
							</logic:empty> <logic:iterate id="album" name="albums" scope="request">
								<div class="PhotoWrapClass">
									<div class="PhotoImgClass">
										<logic:present name="album" property="coverUrl">
											<a href="viewphotos.do?albumId=${pageScope.album.id}"> <img
												src="${pageScope.album.coverUrl}" border="0"> </a>
										</logic:present>
										<logic:notPresent name="album" property="coverUrl">
											<a href="viewphotos.do?albumId=${pageScope.album.id}"> <img
												src="none.gif" width="140" height="105" border="0"> </a>
										</logic:notPresent>
									</div>
									<div class="PhotoNameClass">
										<a href="viewphotos.do?albumId=${pageScope.album.id}">
											${pageScope.album.title}</a>&nbsp;&nbsp;<br>
										&nbsp;&nbsp;所属种类:${pageScope.album.channelTitle}<br>
										&nbsp;&nbsp;点击数:${pageScope.album.times}&nbsp;&nbsp;<br>
										<a href="viewalbuminfo.do?albumId=${pageScope.album.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="delalbum.do?albumId=${pageScope.album.id}">删除</a>
									</div>
								</div>
							</logic:iterate>
						</td>
					</tr>
					<tr>
						<td height="40" colspan="5" class="td_down"><div
								align="center">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="td_xia12">
									<tr>
										<td class="page"><div align="right">
												共
												<bean:write name="page" scope="request" property="pageCount" />
												页
												当前：${requestScope.page.currentPage}/${requestScope.page.pageCount}
												<form action="albumpage.do" name="form1">
													<input type="hidden" name="currentPage"
														value="${requestScope.page.currentPage}" /> <input
														type="hidden" name="pageCount"
														value="${requestScope.page.pageCount}" /> <a
														href="javascript:firstPage(form1);">首页</a> <a
														href="javascript:prePage(form1);">上一页</a> <a
														href="javascript:nextPage(form1);">下一页</a> <a
														href="javascript:lastPage(form1);">尾页</a>
												</form>
											</div></td>
										<td width="32">&nbsp;</td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
