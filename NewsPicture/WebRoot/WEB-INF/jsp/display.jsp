<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ͼ����ϵͳ</title>
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
						<td width="718" height="186" valign="top" bgcolor="#FFFFFF"
							class="td_top"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td height="303" class="td_shang14-2"><table width="100"
											border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td width="100" align="center" bgcolor="#FFFFFF"
													class="td_shang-xia"><table width="100" border="0"
														align="center" cellpadding="0" cellspacing="0">
														<tr>
															<td align="center" class="td_shang8_xia8"><a
																href="${requestScope.photo.picUrl}" target="_blank"><img
																	src="${requestScope.photo.bigPicUrl}" border="0">
															</a></td>
														</tr>
													</table></td>
											</tr>
										</table>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="40">&nbsp;</td>
												<td width="60">&nbsp;</td>
												<td width="60">&nbsp;</td>
												<td width="60">&nbsp;</td>
												<td width="30">&nbsp;</td>
												<td width="60">&nbsp;</td>
												<td width="123">&nbsp;</td>
												<td width="124">&nbsp;</td>
											</tr>
											<tr>
												<td height="20">&nbsp;</td>
												<td width="60" class="Statistic2"><div align="left">��Ƭ����:</div>
												<td class="Statistic2"><div align="left">${requestScope.photo.title}</div></td>
												<td class="Statistic"><div align="left">
														<bean:write name="photo" property="title" scope="request" />
													</div>
												</td>
												<td colspan="2" class="Statistic"><div align="left">
														<span class="Statistic2">���������${requestScope.photo.times}</span>
													</div>
												</td>
												<td colspan="2" class="Statistic">&nbsp;</td>
												<td class="Statistic">&nbsp;</td>
											    <td colspan="3" class="Statistic"><div align="left" class="Statistic2">���ʱ�䣺${requestScope.photo.upDate}</div>
												</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td width="60" class="Statistic2">��Ƭ��飺</td>
												<td colspan="6" class="Statistic2"><div align="left">${requestScope.photo.keyword}</div></td>
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
