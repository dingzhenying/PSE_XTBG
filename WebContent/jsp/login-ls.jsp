<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>PSE 协同办公系统</title>

<!-- 需要引用的CSS -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/site.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/form.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/ui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/login.css" />
<!-- 需要引用的JS -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/form.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/login.js"></script>
<script type="text/javascript">
	var context = "<%=request.getContextPath()%>";
	$(document).ready(function() {
		$('.ue-unslider').unslider({
			// 支持响应式设计
			fluid : true,
			// 显示点导航
			dots : true,
			// 动画的速度,没有过度效果时为 false (整型或布尔型)
			speed : 500,
			delay : 1500
		});
		var unslider = $('.ue-unslider').unslider();
		$('.ue-unslider-arrow').click(function() {
			var fn = this.className.split(' ')[1];
			//  Either do unslider.data('unslider').next() or .prev() depending on the className
			unslider.data('unslider')[fn]();
		});
	});
</script>
</head>
<body>
	<!-- 页面结构 -->
	<div class="login">
		<div class="login-top">
			<div class="container">
				<font class="navbar-brand font_1 "> PSE 协同办公系统 </font>
			</div>
		</div>
		<div class="login-body">
			<!-- 			<div class="logo navbar-brand"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>   PSE 协同办公系统 </div> -->
			<div class="login-content clearfix">
				<div class="ue-relative-layout pull-left">
					<div class="ue-unslider">
						<ul class="unslider-inner">
							<li><img
								src="<%=request.getContextPath()%>/skin/images/item1.png" /></li>
							<li><img
								src="<%=request.getContextPath()%>/skin/images/item2.png" /></li>
						</ul>
					</div>
				</div>
				<div class="login-form">
					<form role="form"
						action="<%=request.getContextPath()%>/service/demo1/user/login"
						method="post" class="form">
						<div class="form-group">
							<label class="form-title">登录</label>
							<div class="input-group">
								<div class="input-group-addon user"></div>
								<input type="text" class="form-control ue-form" id="userid"
									name="userid" placeholder="请输入用户名:root"> <font color="red"><h5>
										${data.msname}</h5></font>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon password"></div>
								<input type="password" class="form-control ue-form"
									id="password" name="password" placeholder="请输入密码:1234"> <font
									color="red"><h5>${data.mspassword}</h5></font>
							</div>
						</div>
						<div class="checkbox">
							<label class="form-checkbox"> <input type="checkbox">
								记住我
							</label>
						</div>
						<div class="login-btn">
							<button class="btn btn-login" id="loginbtn" type="submit">登录</button>
							<button class="btn btn-info" id="addbtn" type="button">注册</button>
							<button class="btn btn-reset" type="reset">重置</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="login-bottom">
			<div class="bottom-content">
				<font id="font_bottem"><span class="font_bottem"
					style="color: white;">©2017&nbsp;LongJe&nbsp;</span></font>
				<!-- 				<a>常用下载</a> -->
				<!-- 				<a>版权信息</a> -->
				<!-- 				<a class="no-border">使用帮助</a> -->
			</div>
		</div>
	</div>
</body>
</html>