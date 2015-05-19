<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻图库子系统</title>
<link href="css.css" rel="stylesheet" type="text/css">
<script language="javascript">
	// 删除一个上传图片的控件
    function removeImage(event) {
        var btn = event.target;
        var row = btn.parentElement.parentElement;
        var tbody = row.parentElement;
        tbody.removeChild(row);
        updateIndex(tbody);
    }

	// 添加一个上传图片的控件，直接从点击那一行的控件复制
    function insertImage(event) {
        console.log(event);
        var btn = event.target;
        var row = btn.parentElement.parentElement;
        var tbody = row.parentElement;
        var newRow = document.createElement("TR");
        newRow.setAttribute('index', 0);
        newRow.innerHTML = row.innerHTML.replace(/style=".*"/, '');
        tbody.insertBefore(newRow, row.nextSibling);
        updateIndex(tbody);
    }

	// 更新所有控件的序号，保证连续
    function updateIndex(tbody) {
        var children = tbody.childNodes;
        for (var i = 0, nextIndex = 0; i < children.length; i++) {
            var child = children[i];
            var index = child.attributes && child.attributes.index && child.attributes.index.value;
            if (index == null) {
                continue;
            }
            for (var j = 0; j < child.childNodes.length; j++) {
                var cell = child.childNodes[j];
                if (cell.className != 'file') {
                    continue;
                }
                var input = cell.childNodes[1];
                input.name = 'image[' + nextIndex + '].file';
            }
            child.setAttribute('index', nextIndex);
            nextIndex += 1;
        }
    }

</script>

<style type="text/css">
<!--
body {
	background-image: url(file:///E|/Workspaces/NewsPicture/WebRoot/images/index/bk.jpg);
}
-->
</style></head>

<body>
<table width="768" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" colspan="2">
				<jsp:include page="l_sail.jsp"/>
			</td>
            </tr>
          <tr>
            <td height="17"><jsp:include page="my_sail.jsp"/></td>
          </tr>
        </table>
	</td>
  </tr>
	  
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19" class="td_shang12">&nbsp;</td>
                <td width="8" class="td_shang12">&nbsp;</td>
                <td width="666" valign="bottom" class="td_shang12"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="400" class="Statistic">&nbsp;&nbsp;&nbsp;<span class="sail">${sessionScope.albumInfo.title}</span>&nbsp;&nbsp;
					<a href="viewphotos.do?albumId=${sessionScope.albumInfo.id}"> 查看相片列表 </a></td>
                    <td width="313" class="Statistic"><jsp:include page="album_sail.jsp"/></td>
                  </tr>
                </table></td>
                <td width="8" class="td_shang12">&nbsp;</td>
                <td width="19" height="35" class="td_shang12">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="5"><div align="center">
                  <html:form action="addphoto.do" enctype="multipart/form-data">
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="19">&nbsp;</td>
                        <td width="147">&nbsp;</td>
                        <td width="200">
						<label><span class="sail">&nbsp;&nbsp;&nbsp;&nbsp;
						<logic:messagesPresent>
				  	    	<html:messages id="error">
				  		    	<bean:write name="error"/><br>&nbsp;&nbsp;&nbsp;&nbsp;					      	
				  		    </html:messages>
				        </logic:messagesPresent>
					<bean:write name="wrongType" scope="request" ignore="true"/>
					<bean:write name="success" scope="request" ignore="true"/>
					<bean:write name="nofind" scope="request" ignore="true"/>
					<bean:write name="tooBig" scope="request" ignore="true"/>
						</span></label>						</td>
                        <td width="233">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td height="25" class="Statistic2">图片名称：</td>
                        <td><html:text property="title" styleClass="input"/></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="Statistic">支持bmp,jpeg,png,gif格式图片,请注意格式</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr index="0" class="">
                        <td>&nbsp;</td>
                        <td height="25" class="Statistic2">图片：</td>
                        <td class="file">
                            <input type="file" name="image[0].file"/> 
                            <input type="button" onclick="insertImage(event)" value="+"/>
                            <input type="button" onclick="removeImage(event)" value="-" style="display:none"/>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td height="25" class="Statistic2">文件简介：</td>
                        <td colspan="2"><input type="hidden" name="albumId" value="${requestScope.albumInfo.id}">
                          <html:textarea property="keyword" cols="40" rows="5" styleClass="input3"/></td>
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
                        <td><input name="Submit" type="submit" class="input" value="提交">
                        <input type="button"  class="input" onClick="javascript:history.back();" value="返回"/></td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                  </html:form>
                  </div></td>
              </tr>
              <tr>
                <td height="40" colspan="5" class="td_down"><div align="center">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="td_xia12">
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
<script language="JavaScript" src="JavaScript/validate.js">
</script>	
</body>
</html>
