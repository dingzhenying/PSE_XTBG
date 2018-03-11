<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html";charset=UTF-8">
		<title>用户详细信息</title>
		<!-- 引入css文件 -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/datatables.css">
		<!-- 引入js文件 -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/datatables.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/queryuser.js"></script>
		<script type="text/javascript">
			var context = "<%=request.getContextPath()%>";
			var userid = "<%= session.getAttribute("userid")%>"
		</script>
	</head>
	<body class="container">
		<div class="input-group" style="margin-top:10px;">
			<div class="input-group col-xs-6 col-md-6">
				<input type="text" id="searchVal" class="form-control" style="width:200px;" placeholder="请输入用户ID">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" id="search">
						搜索
					</button>
					<span><font color="red">${data.msname} </font></span>
				</span>
				
			</div>
	    </div>
	    
	    <div class="btn-group pull-right" style="margin-top:-35px;padding-bottom:5px;">
			<button type="button" class="btn btn-primary" id="addusers">新增</button>
		</div>
		<div>
			<table id="userList" class="table table-bordered table-hover">
				<thead>
					<tr>
						<th width="20">用户ID</th>
						<th width="20">名称</th>
						<th width="20">密码</th>
						<th width="20">上级</th>
						<th width="20">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</body>
</html>
