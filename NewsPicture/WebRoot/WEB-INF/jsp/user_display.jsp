<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻图库子系统</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.STYLE1 {
	color: #000000
}
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
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">主页</a>&nbsp;
							<a href="myalbum.do">我的相册</a>&nbsp; <a
							href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
							target="targetFrame">在线编辑</a>&nbsp; <a href="index-3.html">搜索</a>&nbsp;
							<a href="index-3.html">关于我们</a>
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
						<td width="718" height="186" valign="top" bgcolor="#FFFFFF"
							class="td_top"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td height="675" class="td_shang14-2"><table width="100"
											border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td width="100" align="center" bgcolor="#FFFFFF"
													class="td_shang-xia"><table width="100" border="0"
														align="center" cellpadding="0" cellspacing="0">
														<tr>
															<td align="center" class="td_shang8_xia8"><a
																href="${requestScope.photo.picUrl}" target="_blank"><img
																	src="${requestScope.photo.picUrl}" border="0"> </a></td>
														</tr>
													</table></td>
											</tr>
										</table>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="20">&nbsp;</td>
												<td width="60" class="Statistic2">图片名称：</td>
												<td class="Statistic2"><div align="left">
														<bean:write name="photo" property="title" scope="request" />
													</div>
												</td>
												<td colspan="2" class="Statistic2"><div align="left">
														<span class="style1">点击次数：</span>${requestScope.photo.times}
													</div>
												</td>
												<td colspan="2" class="Statistic2">&nbsp;</td>
												<td class="Statistic2">&nbsp;</td>
											</tr>
											<tr>
												<td height="17">&nbsp;</td>
												<td width="60" class="Statistic2">所属栏目：</td>
												<td class="Statistic2"><div align="left">${requestScope.channel.title}</div>
												</td>
												<td colspan="3" class="Statistic2"><div align="left">添加时间：${requestScope.photo.upDate}</div>
												</td>
											</tr>

											<tr>
												<td>&nbsp;</td>
												<td width="60" class="Statistic2">图片描述：</td>
												<td colspan="6" class="Statistic2"><div align="left">${requestScope.photo.keyword}</div>
												</td>
											</tr>

										</table></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>
