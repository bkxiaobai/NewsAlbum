<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<title>上传任意多个文件（总大小不能超过2M)</title>
<script language="javascript">
			  // 在DOM中插入一个上传文件列表项（div元素)和一个<input type="file"/>元素
			  function insertNextFile(obj) 
			  { 
			// 获取上传控制个数
			      var childnum = document.getElementById("files").getElementsByTagName("input").length;       
			      var id = childnum - 1;
			      var fullName = obj.value;
			      // 插入<div>元素及其子元素
			      var fileHtml = '';
			      fileHtml += '<div  id = "file_preview' + id + '" style ="border-bottom: 1px solid #CCC;">';
			      fileHtml += '<img  width =30 height = 30 src ="images/file.gif" title="' + fullName + '"/>';
			      fileHtml += '<a href="javascript:;" onclick="removeFile(' + id + ');">删除</a> &nbsp;&nbsp;';
			      fileHtml += fullName.substr(fullName.lastIndexOf('\\')+1) +'  </div>';
			  
			      var fileElement = document.getElementById("files_preview");
			      fileElement.innerHTML = fileElement.innerHTML + fileHtml;    
			      obj.style.display = 'none';   // 隐藏当前的<input type=”file”/>元素
			      addUploadFile(childnum);  // 插入新的<input type=”file”/>元素
			  }
			  //  插入新的<input type=”file”/>元素，适合于不同的浏览器（包括IE、FireFox等）
			  function addUploadFile(index)
			  {
			      try  // 用于IE浏览器
			      {   
			          var uploadHTML = document.createElement( "<input type='file' id='file_" + index + 
			                                  "' name='file[" + index + "]' onchange='insertNextFile(this)'/>");
			          document.getElementById("files").appendChild(uploadHTML);
			      }
			      catch(e)  // 用于其他浏览器
			      { 
			          var uploadObj = document.createElement("input");
			          uploadObj.setAttribute("name", "file[" + index + "]");
			          uploadObj.setAttribute("onchange", "insertNextFile(this)");
			          uploadObj.setAttribute("type", "file");
			          uploadObj.setAttribute("id", "file_" + index);
			          document.getElementById("files").appendChild(uploadObj);
			      }
			  }
			  function removeFile(index)  // 删除当前文件的<div>和<input type=”file”/>元素
			  {
			      document.getElementById("files_preview").removeChild(document.getElementById("file_preview" + index)); 
			      document.getElementById("files").removeChild(document.getElementById("file_" + index));    
			  }
			  function showStatus(obj)  // 显示“正在上传文件”提示信息
			  {
			    document.getElementById("status").style.visibility="visible";
			  }
		</script>
</head>
<body>
	<div>
		<html:form enctype="multipart/form-data" action="multiUpload">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>&nbsp;</td>
					<td height="25" class="Statistic2">图片名称：</td>
					<td><html:text property="title" styleClass="input" />
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td height="25" class="Statistic2">文件简介：</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="Statistic2">&nbsp;</td>
					<td colspan="2"><input type="hidden" name="albumId"
						value="${requestScope.albumInfo.id}"> <html:textarea
							property="keyword" cols="40" rows="5" styleClass="input3" />
					</td>
				</tr>
			</table>
		<span id="files"> <%--  在此处插入用于上传文件的input元素 --%> <input
			type="file" id="file_0" name="file[0]"
			onchange="insertNextFile(this)" /> </span>&nbsp;&nbsp;
               <html:submit value=" 上传 " onclick="showStatus(this);" />
	</html:form>
	</div>
	<p>
	<div id="status" style="visibility: hidden; color: Red">正在上传文件</div>
	<p>
		<%--  在此处用DOM技术插入上传文件列表项  --%>
	<div id="files_preview"
		style="width: 500px; height: 500px; overflow: auto"></div>
</body>
</html>