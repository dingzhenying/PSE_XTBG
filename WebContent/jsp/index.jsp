<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>PSE 协同办公系统</title>

    <!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/skin/site.ico" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/ui.css" /> 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/form.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/portal.css" />	
    <!-- 需要引用的JS -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/form.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/ui.js"></script>
    <script type="text/javascript">
	var context = "<%=request.getContextPath()%>";
	var userid1="<%=session.getAttribute("userid")%>"
    $(function() {
    	
    	//调用左右拖动鼠标调整页面布局功能
//     	$(".ue-menu-left").dragResize({
// 			target: ".ue-menu-right",//被动变化元素，可为空
// 			handles: "e"//支持e、s、n、w四个方向
// 		});
		// initialize menu
		$('.ue-vmenu').vmenu();
		
		//美化滚动条
		$('.ue-vmenu').slimScroll({
			height: $('.ue-vmenu').height(),
		});
    });
    function toggleSide() {
    	var width = $('.ue-menu-left').width();
    	if (!$('.ue-menu-left').data('isClose')) {
        	$('.ue-menu-right').css({'border-left':'1px solid #ddd'}).animate({left:'0px'}, "slow");
        	$('.ue-menu-left').animate({left: '-' + width + 'px'}, "slow");
        	$('.ue-menu-left').data('isClose', true);
    	} else {
        	$('.ue-menu-right').css({'border-left':'none'}).animate({left:width + 1 +'px'}, "slow");
        	$('.ue-menu-left').animate({left: '0px'}, "slow");
        	$('.ue-menu-left').data('isClose', false);
    	}
    }
    function loadUrl(name, url) {
    	$('.ue-right-top').text(name);
    	$('#mainFrame').attr('src', url);
    }
    function backlogin() {
    	window.location.href="<%=request.getContextPath()%>/jsp/login-ls.jsp";
    }
    function forUpdate(){
    	window.location.href=context+"/service/demo1/user/edits?userid="+userid1;
    }
    </script>
  </body>
  </head>
  <body>
	<!-- 页面结构 -->
	<header class="navbar navbar-static-top">
   		<div class="navbar-header">
   			<a class="fa fa-bars pull-left" onclick="toggleSide()"></a>
			<a href="#" class="navbar-brand"><span>|</span>PSE 协同办公系统</a>
		</div>
    	<nav class="collapse navbar-collapse">
    		<ul class="nav navbar-nav navbar-right"> 
    			<li>
    				<div class="dropdown">
    					<a class="fa fa-star-o" data-toggle="dropdown"></a>
    					<ul class="dropdown-menu ue-dropdown-menu dropdown-menu-right drop-area">
						  	<li class="ue-dropdown-angle"></li>
						    <li><a href="javascript:;">行政机构管理</a></li>
						    <li><a href="javascript:;">业务机构管理</a></li>
						    <li><a href="javascript:;">组织机构视角管理</a></li>
						    <li><a href="javascript:;">用户管理</a></li>
						    <li><a href="javascript:;">角色管理</a></li>
						    <li><a href="javascript:;">员工入职管理</a></li>
						    <li><a href="javascript:;" class="more">更多</a></li>
					  	</ul>
    				</div>
    			</li>
		        <li>
		        	<div class="dropdown">
		        		<span class="glyphicon glyphicon-user" style="color:blue;"></span>
		        		<a data-toggle="dropdown"><%=session.getAttribute("userid")%><span class="caret"></span></a>
		        		<div class="dropdown-menu ue-dropdown-menu dropdown-menu-right">
		        			<span class="ue-dropdown-angle"></span>
		        			<img class="user-photo" src="<%=request.getContextPath()%>/skin/images/user.jpg"/>
		        			<div class="user-info">
		        				<span class="user-role"><%=session.getAttribute("userid")%></span>
		        				<a href="javascript:forUpdate();" class="user-action"><i class="fa fa-edit">&nbsp;</i>修改资料</a>
				        		<a href="javascript:;" class="user-action"><i class="fa fa-user-md">&nbsp;</i>个人中心</a>
		        			</div>
		        			<div class="exit"><a onclick="backlogin()">退出</a></div>
		        		</div>
		        	</div>
		        </li>
		    </ul>
   		</nav>
	</header>
	
	<div class="ue-menu-wrap">
		<div class="ue-menu-left">
			<div class="ue-left-top ue-pie" >
				<span id="dyn-top"><img class="title-icon" src="<%=request.getContextPath()%>/skin/images/bpm.png"/>工作台</span>
			</div>
			<div class="ue-left-content">
				<div class="ue-vmenu">
					<ul>
						<li id="gzjh">
							<a>工作计划</a>
							<ul>
								<li><a onclick="loadUrl('工作计划', '<%=request.getContextPath()%>/jsp/kbjbg.jsp')" data-role="leaf">我的计划</a></li>
								<li><a onclick="loadUrl('新建计划', '<%=request.getContextPath()%>/service/demo1/job/adds?userid=<%=session.getAttribute("userid")%>')" data-role="leaf">新建计划</a></li>
							</ul>
						</li>
						<li id="xsgl"><a data-role="leaf">下属管理</a>
							<ul>
								<li><a onclick="loadUrl('下属管理', '<%=request.getContextPath()%>/jsp/branch.jsp')" data-role="leaf">我的下属</a></li>						
							</ul>
						</li>
						<li id="yuhl"><a data-role="leaf">用户管理</a>
							<ul>
								<li><a onclick="loadUrl('用户管理', '<%=request.getContextPath()%>/jsp/queryuser.jsp')" data-role="leaf">用户管理</a></li>						
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="ue-menu-right">
			<div class="ue-right-top ue-pie">PSE</div>
			<div class="ue-right-content">
				<iframe id="mainFrame" name="mainFrame" src="<%=request.getContextPath()%>/jsp/sub.jsp" frameborder="0" allowtransparency="true" width="100%" height="100%"></iframe>
			</div>
		</div>
	</div>
</html>