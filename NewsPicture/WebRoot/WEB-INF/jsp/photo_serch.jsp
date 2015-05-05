<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻图库</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-image:
		url(file:///E|/Workspaces/NewsPicture/WebRoot/images/index/bk.jpg);
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
				</table>
			</td>
		</tr>
		<SCRIPT language="javascript1.2" src="JavaScript/validate.js"></SCRIPT>
		<tr>
			<td width="8" class="td_shang12">&nbsp;</td>
			<td width="19" height="35" class="td_shang12">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="5">
				<div align="center">
					<logic:iterate id="photo" name="photos" scope="request">
						<div class="PhotoWrapClass">
							<div class="PhotoImgClass">
								<logic:present name="photo" property="smallPicUrl">
									<a href="viewphoto.do?photoId=${pageScope.photo.id}"> <img
										src="${pageScope.photo.smallPicUrl}" border="0"> </a>
								</logic:present>
							</div>
							<div class="PhotoNameClass">
								<a href="#">${pageScope.photo.title}</a>
							</div>
						</div>
					</logic:iterate>
				</div>
			</td>
		</tr>
	</table>
	</td>
	</tr>
</body>
</html>
