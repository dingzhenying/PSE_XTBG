	var week1=getWeekOfYear();
	// 定义表格对象
	var grid;
	// 表格数据
	var data = [];
	var dataView;
$(function(){
	
		//周框获取周
		$("#showweek").val(week1);
		console.log(week1);
		// 初始化表格
		initTable();
		// 增加
		$("#add").bind("click",add);
		// 删除
		$("#del").bind("click",del);
		
		// 保存
		$("#save").bind("click",save);

		//时间框隐藏
		$(".slick-cell").focus(function(){
			
			$('.datetimepicker').datetimepicker('hide');
				
		});
		//搜索用户
		$("#search").on("click",function(){
			var week = $("#searchVal").val();
			if(1<=week&&week<=53){
				week1=week;
				query(week);
				$("#showweek").val(week1);
			}else{
				$.dialog({
			        type: 'alert',
			        content: '查询日期超出范围！'
			    });
			}
			
		});
		
		//回车查询事件
		$("#searchVal").keydown(function(event) {
			if (event.keyCode == 13) {
				alert(event.keyCode);
				var week = $("#searchVal").val();
				week1=week;
				query(week);
				$("#showweek").val(week1);
				}
			});
		
		//上一周计划
		$("#lastweek").on("click",function(){
			if( week1>1){
				week1--;
				var lastweek = week1;
				LastWeek(lastweek);
				$("#showweek").val(week1);
				
			}else{
				$.dialog({
			        type: 'alert',
			        content: '查询日期超出范围！'
			    });	
				
			}
		});

		//下一周计划
		$("#nextweek").on("click",function(){
			if( week1<53){
				week1 ++;
				var nextweek = week1;
				NextWeek(nextweek);
				$("#showweek").val(week1);
			}else{
				$.dialog({
			        type: 'alert',
			        content: '查询日期超出范围！'
			    });
				
			}
			
		});
		
	});

	// 初始化表格
	function initTable() {
		var options={
				
				
		};
		var url=context + "/service/demo1/job/findPlan?userid="+userid1+"&week="+week1;
		grid = new L.EditGrid("productList", url);
		grid.init(options);		// 初始化editGrid
	}

	// 查询
	function query() {
		var name = $("#productName").val();
		grid.setParameter("productName", name);
		grid.reload();//重新加载事件
	}

	// 增加一行
	function add() {
		grid.addRow({});//添加 事件
	}

	// 删除
	function del() {
		grid.deleteRow();//删除事件
	}

	// 保存数据
	function save() {
		var changedRows = grid.getChangedData();//// 获取变动的数据		
		alert("更新："+changedRows.length+"条数据" );
		if(changedRows.length < 1) {
			$.dialog({
				type: "alert",
				content: "数据未发生改变!"
			});
		}else {
			var url = context + "/service/product/save";
			var json = JSON.stringify(changedRows);
			console.log("json"+json);
			$.ajax({
				url : url,
				type : "POST",
				async : false,//同步请求时为False
				contentType: "application/json",//当发送信息发送到服务器时，内容编码类型
				dataType: "json",//预期数据库返回数据类型
				data: json,//发送到服务器的数据
				success : function(data){
					if(data.success=="true"){
					    $.dialog({
						 type:"alert",
						 content:"保存成功",
						 autofocus: true
					    });
					    grid.reload();
					}
				},
				error : function(data, textstatus){
					alert(data);
					$.dialog({
						 type:"alert",
						 content:"错误",
						 autofocus: true
					 });
				}
			}); 
		} 
	}	

	
//渲染列值
function renderstatus(row, cell, value, columnDef, dataContext){
	if(value == "1")
		return "星期一";
	if(value == "2")
		return "星期二";
	if(value == "3")
		return "星期三";
	if(value == "4")
		return "星期四";
	if(value == "5")
		return "星期五";
	if(value == "6")
		return "星期六";
	if(value == "7")
		return "星期天";
	else
		return "";
	return value;
}
//操作按钮
function operationBtn(row, cell, value, columnDef, dataContext) {
	return'<div class="btn-group pull-center">'
	+'<button type="button"  id="del" onclick="del1('+"'"+ value+ "'"+')" class="btn btn-xs ue-btn del" style="margin-left:5px;margin-bottom:3px"><span class="fa fa-trash"></span>删除</button>'
	+'<button type="button" id="edit" onclick="lookinfo('+"'"+ value+ "'"+')"  class="btn btn-xs ue-btn modify" style="margin-bottom:3px"><span class="fa fa-cog"></span>查看</button></div>'
}


//删除用户信息
function del1(id){
	$.ajax({
		url:context+"/service/demo1/job/del?id="+id,
		type:"get",
		async:false,
		success:function(){
		    grid.reload();
		},
		error:function(data){
			alert(data);
		}
		});
}
//查看详情
function lookinfo(id){
	
	if(id!= "null"){
	    $.dialog({
	        type: 'iframe',
	        url: context+'/service/demo1/job/userinfo?id='+id,
	        title: '计划详情',
	        width: 700,
	        height: 400,
	        onshow: function () {
	        },              
	        onclose: function () {
	            if(this.returnValue != ""){
	                eval("var str='"+JSON.stringify(this.returnValue)+"';");
	                $('#rtnValue').val(str);
	            }
	        },
	        oniframeload: function () {
	        }
	    })
	    
	}else{
		$.dialog({
	        type: 'alert',
	        content: '当前日期未建计划'
	    });

	}
}
//查询某一周计划
function query(week){
	if ((week == "" || week == null)) {
		week=getWeekNumber();
		var url=context + "/service/demo1/job/findPlan?userid="+userid1+"&week="+week;
		grid.reload(url);
		return week1=week;
	} else {
		var url=context + "/service/demo1/job/findPlan?userid="+userid1+"&week="+week;
		grid.reload(url);
	}
}
//获取上一周计划
function LastWeek(lastweek){
	var url=context + "/service/demo1/job/findPlan?userid="+userid1+"&week="+lastweek;
	grid.reload(url);
}
//获取下一周计划
function NextWeek(nextweek){
	var url=context + "/service/demo1/job/findPlan?userid="+userid1+"&week="+nextweek;
	grid.reload(url);
}
	//获取当前日期的周
	/**
	 * 判断年份是否为润年
	 *
	 * @param {Number} year
	 */
	function isLeapYear(year) {
	    return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
	}
	/**
	 * 获取某一年份的某一月份的天数
	 *
	 * @param {Number} year
	 * @param {Number} month
	 */
	function getMonthDays(year, month) {
	    return [31, null, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month] || (isLeapYear(year) ? 29 : 28);
	}26 
	/**
	 * 获取某年的某天是第几周
	 * @param {Number} y
	 * @param {Number} m
	 * @param {Number} d
	 * @returns {Number}
	 */
	function getWeekNumber() {
	    var now = new Date(),
	        year = now.getFullYear(),
	        month = now.getMonth(),
	        days = now.getDate();
	    console.log(year+" "+month+" "+days);
	    //那一天是那一年中的第多少天
	    for (var i = 0; i < month; i++) {
	        days += getMonthDays(year, i);
	    }

	    //那一年第一天是星期几
	    var yearFirstDay = new Date(year, 0, 1).getDay() || 7;

	    var week = null;
	    if (yearFirstDay == 1) {
	        week = Math.ceil(days / yearFirstDay);
	    } else {
	        days -= (7 - yearFirstDay + 1);
	        week = Math.ceil(days / 7) + 1;
	    }
	    return week;
	 
	}
	
	function getWeekOfYear(){
		  var today = new Date();
		  var firstDay = new Date(today.getFullYear(),0, 1);
		  var dayOfWeek = firstDay.getDay(); 
		  var spendDay= 1;
		  if (dayOfWeek !=0) {
		    spendDay=7-dayOfWeek+1;
		  }
		  firstDay = new Date(today.getFullYear(),0, 1+spendDay);
		  var d =Math.ceil((today.valueOf()- firstDay.valueOf())/ 86400000);
		  var result =Math.ceil(d/7);
		  return result+1;
	}
