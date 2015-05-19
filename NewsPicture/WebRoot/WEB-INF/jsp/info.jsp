<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="gbk">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/superfish.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/owl.carousel.js"></script>
<script>
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		/*carousel*/
		var owl = $("#owl");
		owl.owlCarousel({
			items : 1, //10 items above 1000px browser width
			navigation : true,
			pagination : false
		});
		var owl = $("#owl1");
		owl.owlCarousel({
			items : 1, //10 items above 1000px browser width
			navigation : true,
			pagination : false
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
</head>
<body class="page1" id="top">
	<!--==============================header=================================-->
	<header>
		<div class="container_12">
			<div class="grid_12">
				<h1>
					<a href="index.jsp"> <img src="images/logo.png" alt="Welcome">
					</a>
				</h1>
				<div class="slogan">�����ѧ������ͼ�⻶ӭ��</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="menu_block">
			<div class="container_12">
				<div class="grid_12">
					<nav class="horizontal-nav full-width horizontalNav-notprocessed">
						<ul class="sf-menu">
							<li class="current"><a href="index.jsp">��ҳ</a></li>
							<li><a href="myalbum.do">�ҵ����</a></li>
							<li><a
								href="http://localhost:8080/NewsPicture/svg-edit-2.6/svg-editor.html"
								target="targetFrame">���߱༭</a></li>
							<li><a href="index-3.html">����</a></li>
							<li><a href="http:">��������</a></li>
						</ul>
					</nav>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</header>
	<div class="extra_wrapper">
		<div class="title">��Ŀ</div>
		<jsp:include page="l_sail.jsp" />
	</div>
	<!--==============================footer=================================-->
	<footer>
		<div class="container_12">
			<div class="grid_12 ">
				<div class="copy">
					<jsp:include page="l_copyright.jsp" />
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</footer>
</body>
</html>