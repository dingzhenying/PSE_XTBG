<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>楼上云应用支撑平台-门户</title>

    <!-- 需要引用的CSS -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/skin/site.ico" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/ui.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/skin/css/form.css" />
    <style type="text/css">
    .ue-panel.myPro {
    	width: 64%;
    }  
    .ue-panel {
    	margin: 1%;
    	height: 300px;
    }  
    
    </style>
<!-- 需要引用的JS -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/skin/js/echarts.js"></script>
	<script type="text/javascript">
        $(function(){
        	require.config({
                paths: {
                    echarts:'<%=request.getContextPath()%>/skin/js'
                }
            });
    	    // 使用
    	    require(
    	   	[
    	    	'echarts',
    	        'echarts/line'
    	    ],
    	    function (ec) {
    	   		var myLine = ec.init(document.getElementById('lineCharts'));
        	option1 = {
        			tooltip : {
    			        trigger: 'axis'
    			    },
        		    toolbox: {
        		        show : false
        		    },
        		    grid: {
        		    	x: 0,
        		    	y: 0,
        		    	x2: 0,
        		    	y2: 0
        		    },
        		    calculable : true,
        		    xAxis : [
        		        {
        		            type : 'category',
        		            boundaryGap : false,
        		            data : ['一','二','三','四','五','六','日']
        		        }
        		    ],
        		    yAxis : [
        		        {
        		            type : 'value'
        		        }
        		    ],
        		    series : [
        		        {
        		            name:'成交',
        		            type:'line',
        		            smooth:true,
        		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
        		            data:[10, 12, 21, 54, 260, 830, 710]
        		        }
        		    ]
        		};
        	myLine.setOption(option1);
    	   	});
        	
    	    require.config({
                paths: {
                    echarts: '../../skin/js'
                }
            });
    	    // 使用
    	    require(
    	   	[
    	    	'echarts',
    	        'echarts/bar'
    	    ],
    	    function (ec) {
        		var myBar = ec.init(document.getElementById('barCharts')); 
        	option2 = {
        			    tooltip : {
        			        trigger: 'axis'
        			    },
        			    grid: {
            		    	x: 0,
            		    	y: 0,
            		    	x2: 0,
            		    	y2: 0
            		    },
        			    calculable : true,
        			    xAxis : [
        			        {
        			            type : 'category',
        			            data : ['1月','2月','3月','4月','5月','6月']
        			        }
        			    ],
        			    yAxis : [
        			        {
        			            type : 'value'
        			        }
        			    ],
        			    series : [
        			        {
        			            name:'蒸发量',
        			            type:'bar',
        			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7]
        			        },
        			        {
        			            name:'降水量',
        			            type:'bar',
        			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7]
        			        }
        			    ]
        		};
        		myBar.setOption(option2);
    	   	});
        	
    	    require.config({
                paths: {
                    echarts: '../../skin/js'
                }
            });
    	    // 使用
    	    require(
    	   	[
    	    	'echarts',
    	        'echarts/pie'
    	    ],
    	    function (ec) {
        	var myChart = ec.init(document.getElementById('pieCharts')); 
        	option = {
        			tooltip : {
    			        trigger: 'item'
    			    },
        		    legend: {
        		        orient : 'horizontal',
        		        x : 'bottom',
        		        data:['待办','已办','办结']
        		    },
        		    toolbox: {
        		        show : false
        		    },
        		    calculable : true,
        		    series : [
        		        {
        		            name:'',
        		            type:'pie',
        		            data:[
        		                {value:30, name:'待办'},
        		                {value:30, name:'已办'},
        		                {value:40, name:'办结'}
        		            ]
        		        }
        		    ]
        		};
        		myChart.setOption(option);
    	   	});
        });
        
      //checkbox全选 
        function selectAll(obj,iteName){
        	  if (obj.checked) {
            	$("input[name='checkList']").each(function(){this.checked=true;}); 
            } else {
            	$("input[name='checkList']").each(function(){this.checked=false;}); 
            }
        }
    </script>
  </head>
  <body>
	<!-- 页面结构 -->
	<div class="panels clearfix">
		<div class="panel ue-panel pull-left">
			<div class="panel-heading">
				我的流程
			</div>
			<div class="panel-body" style="width: 310px;height: 250px;text-align: center;">
				<a class="ue-icon-title sx">
					<span class="fa fa-table fa-3x ue-icon"></span>
					<span class="ue-title">我的事项</span>
				</a>
				<a class="ue-icon-title bj">
					<span class="fa fa-header fa-3x ue-icon"></span>
					<span class="ue-title">我的办件</span>
				</a>
				<a class="ue-icon-title sf">
					<span class="fa fa-list-alt fa-3x ue-icon"></span>
					<span class="ue-title">我的收费</span>
				</a>
				<a class="ue-icon-title pj">
					<span class="fa fa-arrows-alt fa-3x ue-icon"></span>
					<span class="ue-title">我的评价</span>
				</a>
				<a class="ue-icon-title kq">
					<span class="fa fa-slack fa-3x ue-icon"></span>
					<span class="ue-title">我的考勤</span>
				</a>
				<a class="ue-icon-title">
					<span class="fa fa-medium fa-3x ue-icon"></span>
					<span class="ue-title">我的客户</span>
				</a>
			</div>
		</div>
<!-- 		<div class="panel ue-panel panel-width pull-left"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				新增应用 -->
<!-- 				<ul class="ue-panel-tools"> -->
<!-- 					<li><a><i class="fa fa-refresh"></i></a></li> -->
<!-- 					<li><a><i class="fa fa-times"></i></a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="panel-body" id="lineCharts" style="width: 310px;height: 250px;"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="panel ue-panel panel-width pull-left"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				网络销售情况 -->
<!-- 				<ul class="ue-panel-tools"> -->
<!-- 					<li><a><i class="fa fa-refresh"></i></a></li> -->
<!-- 					<li><a><i class="fa fa-times"></i></a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="panel-body" id="barCharts" style="width: 310px;height: 250px;"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="panel ue-panel panel-width pull-left"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				任务结构 -->
<!-- 				<ul class="ue-panel-tools"> -->
<!-- 					<li><a><i class="fa fa-refresh"></i></a></li> -->
<!-- 					<li><a><i class="fa fa-times"></i></a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="panel-body" id="pieCharts" style="width: 310px;height: 250px;"> -->
<!-- 			</div> -->
<!-- 		</div> -->
    	<div class="panel ue-panel panel-width pull-left myPro">
			<div class="panel-heading">
				我的流程
				<ul class="ue-panel-tools">
					<li><a><i class="fa fa-refresh"></i></a></li>
					<li><a><i class="fa fa-times"></i></a></li>
				</ul>
			</div>
			<div class="panel-body">
				<table class="table">
	      			<thead>
	        			<tr>
		          			<th><input type="checkbox" id="selectAll" onchange="selectAll(this,'checkList')"/></th>
		          			<th>编号</th>
		          			<th>申请事项</th>
		          			<th>申请人</th>
		          			<th>申请时间</th>
		          			<th>审批状态</th>
	        			</tr>
	      			</thead>
	      			<tbody>
	        			<tr>
		          			<td><input type="checkbox" name="checkList"/></td>
		          			<td>0001</td>
		          			<td>出差补助</td>
		          			<td>张志勋</td>
		          			<td>2017-3-9</td>
		          			<td>批准</td>
	        			</tr>
	        			<tr>
		          			<td><input type="checkbox" name="checkList"/></td>
		          			<td>0002</td>
		          			<td>出差补助</td>
		          			<td>张明轩</td>
		          			<td>2017-3-2</td>
		          			<td>批准</td>
	        			</tr>
	        			<tr>
		          			<td><input type="checkbox" name="checkList"/></td>
		          			<td>0003</td>
		          			<td>出差补助</td>
		          			<td>张明轩</td>
		          			<td>2017-3-4</td>
		          			<td>批准</td>
	        			</tr>
	        			<tr>
		          			<td><input type="checkbox" name="checkList"/></td>
		          			<td>0004</td>
		          			<td>出差补助</td>
		          			<td>刘程元</td>
		          			<td>2017-3-12</td>
		          			<td>批准</td>
	        			</tr>
	        			<tr>
		          			<td><input type="checkbox" name="checkList"/></td>
		          			<td>0005</td>
		          			<td>出差补助</td>
		          			<td>徐士模</td>
		          			<td>2017-3-21</td>
		          			<td>批准</td>
	        			</tr>
	      			</tbody>
	    		</table>
			</div>
		</div>
    </div>
	
    
  </body>
</html>