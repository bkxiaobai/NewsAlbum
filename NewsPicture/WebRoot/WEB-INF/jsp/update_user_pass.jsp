<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>����ͼ��</title>
		<link href="css.css" rel="stylesheet" type="text/css">
	<style type="text/css">
<!--
body {
	background-image: url(file:///E|/Workspaces/NewsPicture/WebRoot/images/index/bk3.jpg);
}
-->
</style></head>

	<body>
		<table width="768" align="center" border="0" cellspacing="0"
			cellpadding="0">
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
			<script language="javascript1.2" src="JavaScript/validate.js"></script>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="19" class="td_shang12">&nbsp;
								
							</td>
							<td width="8" class="td_shang12"></td>
							<td width="666" valign="bottom" class="td_shang12">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="huanying">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.userInfo.username}
										</td>
										<td width="400" class="Statistic"><jsp:include
												page="album_sail.jsp" /></td>
									</tr>
								</table>
							</td>
							<td width="8" class="td_shang12">&nbsp;
								
							</td>
							<td width="19" height="35" class="td_shang12">&nbsp;
								
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<div id="RegisterDivWrap" align="center">
									<div>
										<label>
											<span class="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp; <logic:messagesPresent>
													<html:messages id="error">
														<bean:write name="error" />
														<br>&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					      	</html:messages>
												</logic:messagesPresent> <bean:write name="success" scope="request" ignore="true" />
												<bean:write name="noSame" scope="request" ignore="true" /> </span>
										</label>
									</div>
									<html:form action="updatepass.do"
										onsubmit="return validateUpdatePassForm(this);">
										<div>
											<label></label>
										</div>
										<div>
											<label><span class="blue">*</span> <span class="sail">ԭ&nbsp;��&nbsp;�� </span>��											</label>
											<input type="text" name="old" class="input" />
										</div>
										<div>
											<label><span class="blue">*</span> <span class="sail">��&nbsp;��&nbsp;��</span> ��											</label>
											<input type="text" name="newPass" class="input" />
										</div>
										<div>
											<label>
												<span class="blue">*</span> <span class="sail">����ȷ��</span>��											</label>
											<input type="text" name="rePass" class="input">
										</div>

										<div style="margin-top: 20px;">
											<input name="" type="submit" value="�� ��" class="input"
												style="width: 50px;">
											&nbsp;&nbsp;
											<input name="" type="reset" value="�� ��" class="input"
												style="width: 50px;">
										</div>
									</html:form>
								</div>
							</td>
						</tr>
						<tr>
							<td height="40" colspan="5" class="td_down">
								<div align="center">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="td_xia12">
										<tr>
											<td class="page"></td>
											<td width="32">&nbsp;
												
											</td>
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
