<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>新闻图库</title>
<meta charset="gbk">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/TMForm.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/validate.js"></script>
<script>
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	})
</script>
<!--[if lt IE 8]>
		<div style=' clear: both; text-align:center; position: relative;'>
			<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
				<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
			</a>
		</div>
		<![endif]-->
<!--[if lt IE 9]>
			<script src="js/html5shiv.js"></script>
			<link rel="stylesheet" media="screen" href="css/ie.css">
		<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body id="top">
	<!--==============================header=================================-->
	<header>
		<div class="container_12">
			<div class="grid_12">
				<h1>
					<a href="index.jsp"> <img src="images/logo.png"
						alt="Welcome"> </a>
				</h1>
			</div>
		</div>
		<div class="clear"></div>
		<div class="menu_block">
			<div class="container_12">
				<div class="grid_12">
					<nav class="horizontal-nav full-width horizontalNav-notprocessed">
						<ul class="sf-menu">
							<li class="current"><a href="index.jsp">主页</a>
							</li>
							<li><a href="myalbum.do">我的相册</a>
							</li>
							<li><a
								href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
								target="targetFrame">在线编辑</a>
							</li>
							<li><a href="index-3.html">搜索</a>
							</li>
							<li><a href="index-3.html">关于我们</a>
							</li>
						</ul>
					</nav>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</header>
	<table width="768" align="center" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="657" height="186" valign="top" bgcolor="#FFFFFF"
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
																		<td class="td_shang8_xia8"><logic:notEmpty
																				name="album" property="coverUrl">
																				<img src="${requestScope.album.coverUrl}" border="0">
																			</logic:notEmpty> <logic:empty name="album" property="coverUrl">
																				<img src="none.gif" width="140" height="105"
																					border="0">
																			</logic:empty></td>
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
															<td class="Statistic2">相册名称：</td>
															<td class="Statistic">${requestScope.album.title}</td>
															<td class="Statistic"><span class="style1">点击次数：</span>${requestScope.album.times}</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">所属分类：</td>
															<td class="Statistic">${requestScope.channel.title}</td>
															<td class="Statistic"><span class="style1">共有评论：</span>
																${requestScope.page.rsCount}</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">添加时间：</td>
															<td colspan="3" class="Statistic"><span
																class="style1"></span>${requestScope.album.createDate}</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td class="Statistic2">相册简介：</td>
															<td colspan="3"><span class="Statistic">${requestScope.album.keyword}</span>
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
														<logic:present name="awvo" scope="request">
															<logic:iterate id="awvo" name="awvo" scope="request">
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
																	<td class="comment_name">${pageScope.awvo.userName}</td>
																	<td width="380" class="time2">[
																		${pageScope.awvo.addDate} ]</td>
																	<td width="20" class="comment_name">&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																	<td colspan="2" class="comment_info">标题：${pageScope.awvo.title}<br>
																		内容：${pageScope.awvo.content}</td>
																	<td colspan="2">&nbsp;</td>
																</tr>
															</logic:iterate>
														</logic:present>
														<logic:notPresent name="awvo" scope="request">
															<td align="center" colspan="2" class="comment_info">暂无评论</td>
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
													href="javascript:showCommentForm();">我有话说</a>
												</td>
											</tr>
											<tr>
												<td height="50" colspan="4" class="page"><div
														align="right">
														共${requestScope.page.pageCount}页 当前：
														${requestScope.page.currentPage}/${requestScope.page.pageCount}页
														<a
															href="javascript:firstPageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															首页</a> <a
															href="javascript:prePageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															上一页</a> <a
															href="javascript:nextPageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															下一页</a> <a
															href="javascript:lastPageNew(photoWordPageForm, photoWordPageForm.currentPage.value, photoWordPageForm.pageCount.value)">
															尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
													</logic:messagesPresent> <jsp:include page="a_add_comment.jsp" /></td>
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
