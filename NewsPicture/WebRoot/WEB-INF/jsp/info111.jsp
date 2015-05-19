<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>新闻图库</title>
		<link href="css.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		
		<table width="1280" align="center" border="0" cellspacing="0"
			cellpadding="0" bgcolor="#FFFFF4">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" colspan="2">
								<jsp:include page="l_sail.jsp" />
							</td>
						</tr>
						<tr>
							<td height="17"><jsp:include page="my_sail.jsp" /></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr valign="bottom">
				<td align="center">
					
						<img src="images/index/main_new.jpg">
					
				</td>
			</tr>
			<tr valign="top">
				<td><jsp:include page="l_copyright.jsp" /></td>
			</tr>
		</table>

	</body>
</html>
