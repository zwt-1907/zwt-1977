<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 核心 CSS 文件-->
<link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- datetime -->
<link href="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.css" rel="stylesheet" >
<!-- DataTables CSS -->
<link href="<%=request.getContextPath() %>/js/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" >
</head>
<body>



 			 <div class="row">
 			 	<div class="col-md-12">
 			 	<!-- 条件查询 -->
 			 	<div class="panel panel-warning">
				  <div class="panel-heading" style="height: 50px;">
				  		条件查询
					  <div style="float: right">
						  <button type="reset" class="btn btn-success" onclick="returnHome()">
							  <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
							  主页
						  </button>
					  </div>
				  </div>
				  <div class="panel-body">
				    <form class="form-horizontal">
					  <div class="form-group">
					    <label class="col-sm-3 control-label" >操作用户查询：</label>
					    <div class="col-sm-9">
						    <input type="text" class="form-control" id="userName" placeholder="用户查询" style="border-color: green;">
					  	</div>
					  </div>
					  <div class="form-group">
					    <label class="col-sm-3 control-label" >执行状态查询：</label>
					    <div class="col-sm-4">
						    <select id="status" class="form-control">
						    	<option value="">====请选择====</option>
						    	<option value="1">执行成功</option>
						    	<option value="0">执行失败</option>
						    </select>
					  	</div>
					  </div>
					  <div class="form-group">
					    <label class="col-sm-3 control-label" >消耗时间查询：</label>
					    <div class="col-sm-4">
						    <input type="text" class="form-control" id="minUseTime"  placeholder="最少时间" style="border-color: green;">
					  	</div>
					  	 <div style="float: left; margin-top:5px; height: 30px;"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></div>
					    <div class="col-sm-4">
						    <input type="text" class="form-control" id="maxUseTime"  placeholder="最多时间" style="border-color: green;">
					  	</div>
					  </div>
					  <div class="form-group">
					    <label class="col-sm-3 control-label" >执行时间查询：</label>
					    <div class="col-sm-4">
						    <input type="text" class="form-control" id="minAccessTime" placeholder="最小时间" style="border-color: green;">
					  	</div>
					  	 <div style="float: left; margin-top:5px; height: 30px;"><span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span></div>
					    <div class="col-sm-4">
						    <input type="text" class="form-control" id="maxAccessTime" placeholder="最大时间"style="border-color: green;">
					  	</div>
					  </div>
					  <div class="form-group">
					    <label class="col-sm-5 control-label" ></label>
					    <div class="col-sm-7">
						    <button type="button" class="btn btn-info" onclick="searchLog()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								查询
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="col-sm-2 control-label" ></label>
							<button type="reset" class="btn btn-info">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								重置
							</button>
					  	</div>
					  </div>
					 </form>
				  </div>
				</div>
			</div>
			</div>




		<!-- 列表展示 -->
		<div class="container-fluid">
		  <div class="row">
			<div class="panel panel-info">
			  <div class="panel-heading">
			  	日志列表
			  </div>
			  <div class="panel-body">
			    <div class="panel-body">
			      <table id="logDataTable" class="table table-bordered table-striped table-hover" border="1" >
				    <tbody>
				    <thead>
				        <tr>
				            <th>ID</th>
				            <th>用户名</th>
				            <th>访问类名</th>
				            <th>消耗时间</th>
				            <th>IP地址</th>
				            <th>状态</th>
				            <th>记录时间</th>
				        </tr>
				    <thead>
				    </tbody>
				 </table>
			   </div>
			  </div>
			</div>
		 </div>
	  </div>




<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- 加载bootbox -->
<script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
<!-- datetime -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTime/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
		logTable();
		time();
	})
    //返回主页
    function returnHome() {
        location.href="<%=request.getContextPath()%>/user/index.jhtml";
    }
	//模糊查询
	function searchLog(){
		var param = {};
		var userName = $("#userName").val();
		var status = $("#status").val();
		var minUseTime = $("#minUseTime").val();
		var maxUseTime = $("#maxUseTime").val();
		var maxAccessTime = $("#maxAccessTime").val();
		var minAccessTime = $("#minAccessTime").val();
		param.userName = userName;
		param.status = status;
		param.minUseTime = minUseTime;
		param.maxUseTime = maxUseTime;
		param.minAccessTime = minAccessTime;
		param.maxAccessTime = maxAccessTime;
		
		console.log(param);
		
		logDataTable.settings()[0].ajax.data=param;
		logDataTable.ajax.reload();
	}
	var logDataTable;
	function logTable(){
		logDataTable = $("#logDataTable").DataTable({
			'bStateSave': true,
			'paging': true,
			"searching": false,//屏蔽datatales的查询框
			'lengthMenu': [5, 10, 20, 30],
			"processing": false,//刷新的那个对话框
		    "serverSide": true,//服务器端分页
		    "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
			'ajax': {
				'url': '<%=request.getContextPath()%>/log/findLogger.jhtml',
				'type': 'POST',
				"dataSrc":function(result){
	       			 result.draw=result.data.draw;
	       			 result.iTotalRecords=result.data.iTotalRecords;
	       			 result.iTotalDisplayRecords=result.data.iTotalDisplayRecords;
	       			 return result.data.data;
				}
			},
			'columns': [
				{
					"data": "logId",
					render:function(data){
						return '<input type="checkbox" value="'+data+'" name="updateCheck"/>'
					}
				},
				{"data": "userName"},
				{"data": "info"},
				{"data": "useTime"},
				{"data": "userIp"},
				{
					"data": "status",
					render:function(data){
						if (data == 1) {
							return "成功"
						}else{
							return "失败"
						}
					}
				},
				{"data": "createTime"},
			],
			 "language": {
		            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
		      }
		});
	}

		function time(){
			$('#maxAccessTime').datetimepicker({
			    language:  'zh-CN',
			    weekStart: 0,
			    todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0,
				format:'yyyy-mm-dd hh'
			});
			$('#minAccessTime').datetimepicker({
			    language:  'zh-CN',
			    weekStart: 0,
			    todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0,
				format:'yyyy-mm-dd hh'
			});
		}

</script>
</body>
</html>