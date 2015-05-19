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
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
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
<body>
	<table width="768" align="center" border="0" cellspacing="0"
		cellpadding="0">
	<tr>
		<td><table width="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td width="19" class="td_shang12">&nbsp;</td>
					<td width="8" class="td_shang12">&nbsp;</td>
					<td width="666" valign="bottom" class="td_shang12"><table
							width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="huanying">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.userInfo.username}</td>
								<td width="400" class="Statistic"><jsp:include
										page="album_sail.jsp" /></td>
							</tr>
						</table></td>
					<td width="8" class="td_shang12">&nbsp;</td>
					<td width="19" height="35" class="td_shang12">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5"><div align="center">
							<html:form action="updatealbumInfo.do"
								onsubmit="return validateUpdateAlbumForm(this);">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>&nbsp;</td>
										<td width="100">&nbsp;</td>
										<td width="150" class="sail"><br> <logic:messagesPresent>
												<html:messages id="error">
													<bean:write name="error" />
													<br>
												</html:messages>
											</logic:messagesPresent> <bean:write name="success" scope="request" ignore="true" />
											<bean:write name="noexist" scope="request" ignore="true" />
										</td>
										<td width="280">&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td height="25" class="dbule STYLE1">相册名称：</td>
										<td><html:text property="title" styleClass="input"
												value="${requestScope.album.title}" /></td>
										<td><input type="hidden" name="albumId"
											value="${requestScope.album.id}"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td height="25" class="dbule STYLE1">选择栏目：</td>
										<td><div align="left"><html:select property="channel" styleClass="input">
												<logic:iterate id="channel" name="channels" scope="session">
													<html:option value="${pageScope.channel.id}">${pageScope.channel.title}</html:option>
												</logic:iterate>
											</html:select></div></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td height="25" class="dbule STYLE1">描述：</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td class="Statistic2">&nbsp;</td>
										<td colspan="2"><div align="left"><html:textarea property="keyword"
												cols="40" rows="5" styleClass="input3"
												value="${requestScope.album.keyword}" /></div></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td class="Statistic2">&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><input name="Submit" type="submit" class="input"
											value="确认"> <input type="button" class="input"
											onclick="javascript:history.back();" value="重置" /></td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</html:form>
						</div></td>
				</tr>
				<tr>
					<td height="40" colspan="5" class="td_down"><div
							align="center">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="td_xia12">
								<tr>
									<td class="page"><div align="right"></div></td>
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
