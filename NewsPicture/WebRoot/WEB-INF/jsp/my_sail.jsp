<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ͼ����ϵͳ</title>
<link href="css.css" rel="stylesheet" type="text/css">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="40%" class="sail"><html:form action="photoserch.do"
				onsubmit="return validatePhotoPageForm(this)">
				<div align="center" cellpadding="0">
					<SCRIPT language="JavaScript" src="JavaScript/validate.js"></SCRIPT>
					<label><span class="sail">&nbsp;&nbsp;&nbsp;&nbsp;����ͼƬ</span>��</label>
					<html:text property="title" styleClass="input"
						value="${requestScope.photo.title}" />
					<input name="" type="submit" value="����" class="input3"
						style="width:50px;">
				</div>
			</html:form>
		</td>
		<td width="30%" class="sail">
			<div align="right" cellpadding="0">
				<a href="myalbum.do" class="sail">�ҵ����</a>
			</div>
		</td>
		<td width="14%" class="sail">
			<div align="center" cellpadding="0">
					<a href="http://xiuxiu.web.meitu.com" target="targetFrame">���߱༭ͼƬ</a>
			</div></td>
	</tr>
</table>
</head>
</html>