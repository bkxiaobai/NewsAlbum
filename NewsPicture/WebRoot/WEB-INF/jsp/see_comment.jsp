<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����������ϵͳ</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #333333
}
-->
</style>

</head>
<body>
	<table width="768" align="center" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="30" colspan="2"><jsp:include page="l_sail.jsp" />
						</td>
					</tr>
					<tr>
						<td height="17"><jsp:include page="my_sail.jsp" /></td>
					</tr>
				</table></td>
		</tr>
		<script language="JavaScript" src="JavaScript/validate.js"></script>
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="657" height="186" valign="top" bgcolor="#F1F9FF"
							class="td_top"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td height="416" class="td_shang14-2">

										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="150"><table width="120" border="0"
														cellspacing="0" cellpadding="0">
														<tr>
															<td bgcolor="#FFFFFF" class="td_shang-xia"><table
																	width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td class="td_shang8_xia8"><a
																			href="${requestScope.photo.picUrl}" target="_blank"><img
																				src="${requestScope.photo.smallPicUrl}" border="0">
																		</a>
																		</td>
																	</tr>
																</table>
															</td>
															<td width="9" bgcolor="#FFFFFF">&nbsp;</td>
														</tr>
													</table>
												</td>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="25">&nbsp;</td>
															<td width="60">&nbsp;</td>
															<td width="100">&nbsp;</td>
															<td width="160">&nbsp;</td>
															<td width="70">&nbsp;</td>
															<td width="30">&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">��Ƭ���ƣ�</td>
															<td class="Statistic">${requestScope.photo.title}</td>
															<td class="Statistic"><span class="style1">���������</span>${requestScope.photo.times}</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">�������ࣺ</td>
															<td class="Statistic">${requestScope.channel.title}</td>
															<td class="Statistic"><span class="style1">�������ۣ�</span>
																${requestScope.page.rsCount}</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">���ʱ�䣺</td>
															<td colspan="3" class="Statistic"><span
																class="style1"></span>${requestScope.photo.upDate}</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">��Ƭ��飺</td>
															<td colspan="3"><span class="Statistic">${requestScope.photo.keyword}</span>
															</td>
															<td>&nbsp;</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td colspan="4"><table width="100%" border="0"
														cellspacing="0" cellpadding="0">
														<logic:present name="pwvo" scope="request">
															<logic:iterate id="pwvo" name="pwvo" scope="request">
																<tr>
																	<td width="40" height="30">&nbsp;</td>
																	<td width="100">&nbsp;</td>
																	<td colspan="3">&nbsp;</td>
																</tr>
																<tr>
																	<td class="time2"><div align="center">
																			<img src="images/comment/man.gif" width="18"
																				height="19">
																		</div>
																	</td>
																	<td class="comment_name">${pageScope.pwvo.UserName}</td>
																	<td width="380" class="time2">[
																		${pageScope.pwvo.addDate} ]</td>
																	<td width="20" class="comment_name">&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																	<td colspan="2" class="comment_info">���⣺${pageScope.pwvo.title}<br>
																		���ݣ�${pageScope.pwvo.content}</td>
																	<td colspan="2">&nbsp;</td>
																</tr>
															</logic:iterate>
														</logic:present>
														<logic:notPresent name="pwvo" scope="request">
															<td align="center" colspan="2" class="comment_info">��������</td>
														</logic:notPresent>
													</table></td>
											</tr>
											<tr>
												<td width="3%" height="50" class="page"><div
														align="left"></div>
												</td>
												<td width="30%" class="page"><form
														name="photoWordPageForm" action="othercomment.do">
														<input type="hidden" name="currentPage"
															value="${requestScope.page.currentPage}"> <input
															type="hidden" name="pageCount"
															value="${requestScope.page.pageCount}"> <input
															type="hidden" name="photoId"
															value="${requestScope.photo.id}">
													</form>
												</td>
												<td width="45%" class="page">&nbsp;</td>
												<td width="22%" class="page"><a
													href="javascript:showCommentForm();">���л�˵</a>
												</td>
											</tr>
											<tr>
												<td height="50" colspan="4" class="page"><div
														align="right">
														��${requestScope.page.pageCount}ҳ ��ǰ��
														${requestScope.page.currentPage}/${requestScope.page.pageCount}ҳ
														<a
															href="javascript:firstPageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															��ҳ</a> <a
															href="javascript:prePageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															��һҳ</a> <a
															href="javascript:nextPageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															��һҳ</a> <a
															href="javascript:lastPageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															βҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</div>
												</td>
											</tr>
											<tr id="commentForm" style="display:none">
												<td width="3%" height="50" class="page"><div
														align="left"></div>
												</td>
												<td width="30%" class="page">&nbsp;</td>
												<td width="45%" class="page"><logic:messagesPresent>
														<html:messages id="error">
															<bean:write name="error" />
															<br>&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					      	</html:messages>
													</logic:messagesPresent> <jsp:include page="l_add_comment.jsp" /></td>
												<td width="22%" class="page"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>
