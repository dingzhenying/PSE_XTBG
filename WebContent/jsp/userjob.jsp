<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html";charset=UTF-8">
		<title>用户详细信息</title>
		<!-- 引入css文件 -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/datatables.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/ui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/skin/css/form.css">
		<!-- 引入js文件 -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/form.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/datatables.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/userjob.js"></script>
		<script type="text/javascript">
			var context = "<%=request.getContextPath()%>";
			var userid1="<%=session.getAttribute("userid")%>"
		</script>
	</head>
	<body class="container">
		<div class="input-group form-inline" style="margin-top:10px;">
			<div class="input-group ">
				<input type="text" id="searchVal" class="form-control" style="width:200px;" placeholder="请输入所查工作周">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" id="search">
						搜索
					</button>
				</span>
			</div>
			<div class="input-group form-inline" style="margin-left:200px">
					<span class="input-group-btn">
						<button class="btn btn-default " type="button" id="lastweek">
							上一周
						</button>	
					</span>
						<input id="showweek" class="form-control" value="" style="width:50px;">
				    <span class="input-group-btn">
						<button class="btn btn-default " type="button" id="nextweek">
							下一周
						</button>	
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
						<th width="8%">星期</th>
						<th width="8%">用户ID</th>
						<th width="9%">时间</th>
						<th width="8%">星期</th>
						<th width="8%">工作周</th>
						<th width="15%">上午计划</th>
						<th width="15%">下午计划</th>
						<th width="15%">晚上计划</th>
						<th width="10%">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</body>
</html>
