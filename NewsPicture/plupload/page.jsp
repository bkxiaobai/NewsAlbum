<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
		%>   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
<title></title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv='Content-Type' content='text/html; charset=GBK'>
<!-- ���ҳ�滺�� -->
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<!--  ���ҳ�滺��end -->

<script type="text/javascript">
 var uploadFileNum = 1; 
 function addRow(TableName)
 {
       var rowId=document.all("VenScanPapersRow");//������к���
       var row,cell,str;
       row = eval("document.all["+'"'+TableName+'"'+"]").insertRow(rowId.rowIndex+1);
       if(row != null )      {
            cell1 = row.insertCell();
        	cell1.style.width='10%';
        	cell1.style.backgroundColor="#E2F0FC";
        	cell1.style.paddingRight="8px";
        	cell1.align="center";
       		cell2 = row.insertCell();
        	cell2.style.width='80%';
        	cell2.align="left";
        	cell2.colSpan="4";
        	cell2.style.paddingLeft="8px";
        	cell2.style.backgroundColor="#ffffff";
        	cell2.innerHTML = "<input type='file' style='background-color: #FFFFFF' size='40' onchange='return getFileSize(this)' name=uploadFileVenScanPapers["+uploadFileNum +"].file>";
            cell3=row.insertCell();
            cell3.style.backgroundColor="#ffffff";
		    //str="<span class='btn'><input type='button' value='ȡ�����' align='middle' onclick='removeRow(this)'/></span>";
            str="<img src='images/btnfile2.jpg' align='middle' alt='�ļ�����' style='cursor: hand;' onclick='removeRow(this);'>";
            cell3.innerHTML=str;
            }
           uploadFileNum++;
}
 
function getFileSize(filePath)
{
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   if(filePath.value!=""){
	   if((fso.GetFile(filePath.value).size)/1024>1024){
	     alert("�ļ���С���ܳ���1m");
	     return false;
	   }
   }
   return true;
}
function removeRow(obj){
      obj.parentNode.parentNode.removeNode(true);
}
    
    function doSub()
    {
    	    if(!checkForm()) return false;
		    return document.forms[0].submit();
    }
    
function PreviewImg(imgFile) 
{ 
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
	var  newPreview = document.getElementById("venImgDiv"); 
	try{
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	}catch(e){
		alert('���ϴ�ͼƬ�ļ�!');
		imgFile.outerHTML="<input type='file' size='12' onchange='javascript:PreviewImg(this);'  name='venImg' /> "; 
		newPreview.outerHTML="<div id='venImgDiv'></div>";
	}
	newPreview.style.width = "198px"; 
	newPreview.style.height = "193px";  
} 
function back(){
	window.history.back();
}
</script>
<style type="text/css"> 
#venImgDiv
{ 
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale); 
} 
</style> 
	</head>
	<body>

<html:form action="xxx.do?act=new"  enctype="multipart/form-data" method="post">
<div id="all" style="display:none;">
	<div id="base">
		<table width="100%" border="0" cellpadding="0" cellspacing="1"
			class="table" id="base_table">
			<tr>
				<td height="26" colspan="6" align="left"
					class="TableHeadblueTitle">
					<input type="hidden" name="act" value="new" id="act">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="20">
								<img class="outline" onclick="myclick1();"
									style="CURSOR: hand"
									src="<%=path%>/images/collapsed_yes.gif" id="MEMU_1" />
							</td>
							<td class="txt_3">
								������Ϣ
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tbody id="id1" style="display: block;">
				<tr id="VenScanPapersRow">
					<td align="center" width="16%" class="tableleft" id="row1">
						֤�ռ����ĵ�ɨ���:
						<br />
					</td>
					<td align="left" class="tableright" colspan="5">
						<html:file property="uploadFileVenScanPapers[0].file" onchange="return getFileSize(this)" size="40"
							style="background-color: #FFFFFF"></html:file>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="btn"> <input name="button22" type="button"
								value="�������" align="right"
								onclick="addRowVenScanPapers('base_table')" /> </span>
					</td>
				</tr>
			</tbody>
		</table>
</div>
</html:form>
	</body>
</html>
