<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下属管理-树</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/ztree.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/skin/css/ui.css">
<script type="text/javascript">
var context="<%=request.getContextPath()%>";
var userid="<%=session.getAttribute("userid")%>";
<% Object userid_branch=session.getAttribute("userid");
session.setAttribute("userid_branch", userid_branch);%>
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/form.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/ztree.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/skin/js/branch.js"></script>

<style type="text/css">
#ztree {
	float: left;
	width: 20%;
}

#iframe {
	height: 600px;
	width: 80%;
	float: right;
	left: 255px;
}

#gn_iframe {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="ue-menu-wrap" style="top:10px">
		<div class="ue-menu-left" id="ztree">
			<ul id="tree" class="ztree"></ul>
		</div>
		<div class="ui-resizable-handle ui-resizable-e" style="z-index: 80;"></div>
		<div class="ue-menu-right" id="iframe">
			<iframe id="gn_iframe" name="mainFrame" src="<%=request.getContextPath()%>/jsp/branchjob.jsp" frameborder="0" allowtransparency="true"></iframe>
		</div>
	</div>
</body>
</html>