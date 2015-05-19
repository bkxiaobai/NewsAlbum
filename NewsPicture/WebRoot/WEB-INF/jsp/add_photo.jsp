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
.STYLE1 {color: #097DC1}
.STYLE2 {color: #FFFFFF}
.STYLE3 {color: #FFFF66}
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
		<table align="center" >
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="19" class="td_shang12">&nbsp;</td>
						<td width="8" class="td_shang12">&nbsp;</td>
						<td width="666" valign="bottom" class="td_shang12"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="400" class="Statistic STYLE2">&nbsp;&nbsp;&nbsp;<span
										class="sail">${sessionScope.albumInfo.title}</span>&nbsp;&nbsp;
										<a href="viewphotos.do?albumId=${sessionScope.albumInfo.id}">
											查看相片列表 </a>
									</td>
									<td width="313" class="Statistic"><jsp:include
											page="album_sail.jsp" /></td>
								</tr>
							</table>
						</td>
						<td width="8" class="td_shang12">&nbsp;</td>
						<td width="19" height="35" class="td_shang12">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5"><div align="center">
								<html:form action="addphoto.do" enctype="multipart/form-data"
									onsubmit="return validateAddPhotoForm(this);">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="19">&nbsp;</td>
											<td width="147">&nbsp;</td>
											<td width="200"><label><span class="sail">&nbsp;&nbsp;&nbsp;&nbsp;
														<logic:messagesPresent>
															<html:messages id="error">
																<bean:write name="error" />
																<br>&nbsp;&nbsp;&nbsp;&nbsp;					      	
				  		    </html:messages>
														</logic:messagesPresent> <bean:write name="wrongType" scope="request"
															ignore="true" /> <bean:write name="success"
															scope="request" ignore="true" /> <bean:write
															name="nofind" scope="request" ignore="true" /> <bean:write
															name="tooBig" scope="request" ignore="true" /> </span>
											</label></td>
											<td width="233">&nbsp;</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td height="25" class="Statistic2 STYLE2">图片名称：</td>
											<td><div align="left"><html:text property="title" styleClass="input" />
											</div></td>
										</tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td class="Statistic">支持bmp,jpeg,png,gif格式图片,请注意格式</td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr index="0" class="">
                                        <td>&nbsp;</td>
                                        <td height="25" class="Statistic2 STYLE2">上传图片：</td>
                                        <td class="file">
                                            <input type="file" name="image[0].file"/> 
                                            <input type="button" onclick="insertImage(event)" value="+"/>
                                            <input type="button" onclick="removeImage(event)" value="-" style="display:none"/>
                                        <td>&nbsp;</td>
                                      </tr>
										<tr>
											<td>&nbsp;</td>
											<td height="25" class="Statistic2 STYLE2">文件简介：</td>
											<td colspan="2"><div align="left"><input type="hidden" name="albumId"
												value="${requestScope.albumInfo.id}"> <html:textarea
													property="keyword" cols="40" rows="5" styleClass="input3" />
											</div></td>
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
												value="提交"> <input type="button" class="input"
												onClick="javascript:history.back();" value="返回" />
											</td>
											<td>&nbsp;</td>
										</tr>
									</table>
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
										<td class="page"><div align="right"></div>
										</td>
										<td width="32">&nbsp;</td>
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
