<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>����ͼ��</title>
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
							<li class="current"><a href="index.jsp">��ҳ</a>
							</li>
							<li><a href="myalbum.do">�ҵ����</a>
							</li>
							<li><a
								href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
								target="targetFrame">���߱༭</a>
							</li>
							<li><a href="index-3.html">����</a>
							</li>
							<li><a href="index-3.html">��������</a>
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
					cellpadding="0" align="center">
					<tr>
									<td class="Statistic">&nbsp;&nbsp;&nbsp;<span class="STYLE1">��ӭʹ��ͼ��
									  &nbsp;&nbsp;&nbsp;ע���&nbsp;&nbsp;&nbsp;����ӵ�������Լ��ĸ������&nbsp;&nbsp;Forever~~~</span></td>
			  </tr>
					<tr>
						<td colspan="5">
							<div id="RegisterDivWrap">
								<div>
									<label><span class="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp; <logic:messagesPresent>
												<html:messages id="error">
													<bean:write name="error" />
													<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					      	</html:messages>
											</logic:messagesPresent> <bean:write name="success" scope="request" ignore="true" />
											<bean:write name="have" scope="request" ignore="true" /> </span> </label>
								<img src="images/2.png" width="221" height="127" align="right">
								</div>
								<html:form action="userReg.do"
									onsubmit="return validateUserRegForm(this)">
									<div>
										<label><span class="blue STYLE1">*</span> <span class="sail STYLE1">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span><span class="STYLE1">��</span></label>
										<html:text property="username" styleClass="input"
											value="${requestScope.username}" />
										<input name="" type="button" value="���" class="input"
											style="width:70px;" onClick="checkNameFormSubmit()">
									</div>
									<div>
										<label><span class="blue STYLE1">*</span> <span class="sail STYLE1">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span><span class="STYLE1">��</span></label>
										<input type="password" name="password" class="input">
									</div>
									<div>
										<label><span class="blue STYLE1">*</span> <span class="sail STYLE1">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span><span class="STYLE1">��</span></label>
										<input type="password" name="repass" class="input">
									</div>
									<div style="margin-top:20px; ">
										<input name="" type="submit" value="ע ��" class="input"
											style="width:50px;"> &nbsp;&nbsp;<input name=""
											type="reset" value="�� ��" class="input" style="width:50px;">
									</div>
								</html:form>
							</div>
						</td>
					</tr>
					<tr>
						<td height="40" colspan="5" class="td_down"><div
								align="center">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="td_xia12">
									<tr>
										<td class="page"><html:form action="checkName.do">
												<input type="hidden" name="userName">
											</html:form></td>
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
