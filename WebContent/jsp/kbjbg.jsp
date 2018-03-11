<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/tags/loushang-web" prefix="l"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>slickgrid-可编辑表格</title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/skin/site.ico" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/form.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/slickgrid.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/slickgrid1.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/prettify.css"/>
		<!-- 需要引用的js文件 -->
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/form.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/slickgrid.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/loushang-framework.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/ui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/ZeroClipboard.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/prettify.js"></script>
    <script type="text/javascript">
    var context ="<%=request.getContextPath()%>";
	var userid1="<%=session.getAttribute("userid")%>";
    </script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/kbjbg.js"></script>
</head>
<body>
	<div class="container" style="padding-top: 2%;">
		<div class="col-xs-12 col-md-12">	
	   		<div class="row">
				<form class="form-inline" onsubmit="return false;" style="margin-bottom: 0px;">										
					<div class="input-group">
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
		    		<div class="btn-group pull-right">
			    		<button id="add" type="button" class="btn ue-btn">
							<span class="fa fa-plus"></span> 增加
						</button>
						<button id="del" type="button" class="btn ue-btn">
							<span class="fa fa-minus"></span> 删除
						</button>
						<button id="save" type="button" class="btn ue-btn">
							<span class="fa fa-save"></span> 保存
						</button>
					</div>
				</form>
			</div>
		</div>
		<div>
		<table id="productList" class="table table-bordered table-hover" style="font-size: 10px;font-weight: 20px;">
			<thead>
				<tr>
					<th width="5%" data-field="id" data-render="checkbox"></th>
					<th width="5%" data-field="weekday" data-editor="text" data-render="renderstatus">星期-week</th>
					<th width="10%" data-field="userid" data-editor="text">用户名</th>
					<th width="15%" data-field="plantime" data-editor="date">时间</th>
                    <th width="20%" data-field="job_zao" data-editor="text">上午计划</th>
                    <th width="20%" data-field="job_zhong" data-editor="text">下午计划</th>
                    <th width="20%" data-field="job_wan" data-editor="text">晚上计划</th>
                    <th width="20%" data-field="id" data-render="operationBtn">操作</th>                  
                </tr>
			</thead>
		</table>
		</div>
	</div>


</body>
</html>