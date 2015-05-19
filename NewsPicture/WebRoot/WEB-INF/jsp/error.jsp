<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻图库子系统</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.STYLE1 {color: #000000}
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
						</div></td>
				</tr>
			</table></td>
	</tr>
	<tr>
			<td>
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">主页</a>&nbsp; <a href="myalbum.do">我的相册</a>&nbsp;
							<a
							href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
							target="targetFrame">在线编辑</a>&nbsp; <a href="index-3.html">搜索</a>&nbsp;
							<a href="index-3.html">关于我们</a></td>
					</tr>
				</table></td>
		</tr>
	</table>
<table width="768" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="17"><jsp:include page="my_sail.jsp"/></td>
          </tr>
        </table>
	</td>
  </tr>
  <tr>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="718" height="186" valign="top" class="td_shang14"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td bgcolor="#C1FFA8"><div align="center">
			</div></td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19" class="td_shang12">&nbsp;</td>
                <td width="8" class="td_shang12">&nbsp;</td>
                <td width="666" valign="bottom" class="td_shang12"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="400" class="Statistic">&nbsp;					</td>
                    <td class="sail"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="8" class="td_shang12">&nbsp;</td>
                <td width="19" height="35" class="td_shang12">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="5">
  	<logic:messagesPresent>
		<html:messages id="exception">
			<center><span class="sail"><bean:write name="exception"/>点击<a href="javascript:history.back();">这里返回</a></span>
			<center>
		</html:messages>
	</logic:messagesPresent>				</td>
              </tr>
              <tr>
                <td height="40" colspan="5" class="td_down"><div align="center">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td_xia12">
                      <tr>
                        <td class="page"><div align="right">
						</div></td>
                        <td width="32">&nbsp;</td>
                      </tr>
                          </table>
                </div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
