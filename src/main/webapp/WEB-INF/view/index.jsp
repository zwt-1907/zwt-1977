<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>飞狐教育</title>
<!--路径图片-->
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/2.png" />
<!-- Bootstrap 核心 CSS 文件-->
<link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- zTree -->
<link href="<%=request.getContextPath() %>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" >
<!-- 加载bootbox -->
<script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
<!-- datetime -->
<link href="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.css" rel="stylesheet" >
<!-- DataTables CSS -->
<link href="<%=request.getContextPath() %>/js/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" >
<!--switch-->
<link href="<%=request.getContextPath() %>/js/bootstrap/switch/bootstrap-switch.min.css" rel="stylesheet" >
<!--highcharts-->
<link href="<%=request.getContextPath() %>/js/highCharts/highcharts.css" rel="stylesheet" >
	<!--validator-->
	<link href="<%=request.getContextPath() %>/js/bootstrap/validator/bootstrapValidator.min.css" rel="stylesheet" >
</head>
<body>

		<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<ul class="nav navbar-nav navbar-left">
							<li>
								欢迎 ${login.dept.deptName}的
								<h4 style="color: red">${login.staffName}</h4>
								同志登陆飞狐官网;
								&nbsp;
								这是今天您的第${login.loginOkCount+1}次登录
								&nbsp;&nbsp;
								<c:if test="${!empty login.lastLoginTime }">
									上次访问时间为:${login.lastTime}
								</c:if>
							</li>
						</ul>
					</div>
					<div style="margin-top: 20px;">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="<%=request.getContextPath()%>/member/jumpMember.jhtml">查询会员列表</a></li>
							<li><a href="<%=request.getContextPath()%>/goClass/jump.jhtml">查询分类</a></li>
							<li><a href="<%=request.getContextPath()%>/goods/jump.jhtml">查询商品</a></li>
							<li><a href="<%=request.getContextPath()%>/log/jump.jhtml">查询日志</a></li>
							<li><a href="<%=request.getContextPath()%>/brand/jumpBrand.jhtml">查询品牌</a></li>
							<li><a href="<%=request.getContextPath()%>/removeUser.jhtml">安全退出</a></li>

						</ul>
					</div>
				</div>
			</nav>



		<div class="container-fluid">
		  <div class="row">
			 <div class="col-md-4">
			 	<div class="panel panel-default">
				  <div class="panel-heading">
					 部门管理
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" onclick="addDeptDlg()">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						新增
					</button>
					&nbsp;
					<button type="button" class="btn btn-info" onclick="showDeptDlg()">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						修改
					</button>
					&nbsp;
					<button type="button" class="btn btn-danger" onclick="deleteDept()">
						<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						删除
					</button>
				  </div>
				  <ul id="ztreeDemo" class="ztree"></ul>
				</div>
					<!--部门树下留待更多内容填充......-->

			 </div>
			 
			 
 			 <!-- 右侧内容 -->
 			 	<div class="col-md-8">
	 			 	<!-- 条件查询 -->
	 			 	<div class="panel panel-info">
					  <div class="panel-heading">
					  		条件查询
					  </div>
					  <div class="panel-body">
					     <form class="form-horizontal" id="excelForm">
						  <div class="form-group">
						    <label class="col-sm-3 control-label" >员工姓名查询：</label>
						    <div class="col-sm-9">
						    	
							    <input type="hidden" class="form-control" name="idList" id="sc_deptId" >
							    <input type="text" class="form-control" id="sc_staffName" name="staffName" placeholder="员工姓名" style="border-color: green;">
						  	</div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-3 control-label" >员工性别查询：</label>
						    <div class="col-sm-9">
							    <input type="radio"  name="staffSex" value="1" style="border-color: green;">&nbsp;男
							    &nbsp;&nbsp;
							    <input type="radio"  name="staffSex" value="0" style="border-color: green;">&nbsp;女
							    &nbsp;&nbsp;
							    <input type="radio"  name="staffSex"  style="border-color: green;">&nbsp;&nbsp;不分性别
						  	</div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-3 control-label" >员工生日查询：</label>
						    <div class="col-sm-4">
							    <input type="text" class="form-control" id="minDate" name="birthday" style="border-color: green;">
						  	</div>
						  	 <div style="float: left; margin-top:5px; height: 30px;"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></div>
						    <div class="col-sm-4">
							    <input type="text" class="form-control" id="maxDate" name="birthday" style="border-color: green;">
						  	</div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-3 control-label" >员工薪资查询：</label>
						    <div class="col-sm-4">
							    <input type="text" class="form-control" id="minSalary" name="salary" style="border-color: green;">
						  	</div>
						  	 <div style="float: left; margin-top:5px; height: 30px;"><span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span></div>
						    <div class="col-sm-4">
							    <input type="text" class="form-control" id="maxSalary" name="salary" style="border-color: green;">
						  	</div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-5 control-label" ></label>
						    <div class="col-sm-7">
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    <button type="button" class="btn btn-info" onclick="searchEmp()">
									<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
									查询
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-info">
									<span class="glyphicon glyphicon-flash" aria-hidden="true"></span>
									重置
								</button>
						  	</div>
						  </div>
						 </form>
					  </div>
					</div>
				
				<!-- 列表展示 -->
				<div class="panel panel-info">
				  <div class="panel-heading">
				  	员工列表
				  	<button type="button" class="btn btn-info" onclick="addEmployee()">
						<span class="glyphicon glyphicon-record" aria-hidden="true"></span>
						添加
					</button>
					&nbsp;&nbsp;
				  	<button type="button" class="btn btn-warning" onclick="deleteEmployee()">
						<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						删除
					</button>
				  	<button type="button" class="btn btn-warning" onclick="downLoadExcel()">
						<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
						导出Excel
					</button>
				  	<button type="button" class="btn btn-success" onclick="dynaMicdownLoadExcel()">
						<span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span>
						动态导出Excel
					</button>
				  	<button type="button" class="btn btn-warning" onclick="exportExcelByDept()">
						<span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
						按部门导出Excel
					</button>
				  </div>
				  <div class="panel-body">
				    <div class="panel-body">
				      <table id="employeeDataTable" class="table table-bordered table-striped table-hover" border="1" >
					    <thead>
					        <tr>
					            <th>选择</th>
					            <th>员工名</th>
					            <th>性别</th>
					            <th>生日</th>
					            <th>部门</th>
					            <th>薪资</th>
								<th width="150px;">状态</th>
					            <th>操作</th>
					        </tr>
					    <thead>
					</table>
				  </div>
				  </div>
				</div>
 			 </div>
		  </div>
		</div>


			<!--highcharts-->
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>部门平均工资</h4>
							</div>
						</div>
						<div class="panel-body">
							<div id="container"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4>部门平均人数</h4>
							</div>
							<div class="panel-body">
								<div id="containerColumn"></div>
							</div>
						</div>
					</div>
				</div>
			</div>



		<!-- 新增 -->
		<div id="deptAddForm" style="display:none">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >父级菜单：</label>
			    <div class="col-sm-6">
				    <input type="text" class="form-control" id="fatherName" placeholder="父级菜单" style="border-color: green;" readonly="readonly">
				    <input type="hidden" class="form-control" id="fatherId" placeholder="父级id">
			  	</div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >菜单名：</label>
			    <div class="col-sm-6">
				    <input type="text" class="form-control" id="deptName" placeholder="菜单名" style="border-color: red;">
			  	</div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >部门描述：</label>
			    <div class="col-sm-6">
				    <textarea rows="3" class="form-control" id="description" placeholder="部门描述"></textarea>
			  	</div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >时间：</label>
			    <div class="col-sm-6">
				    <input class="form-control" id="addtime" type="text"  placeholder="添加时间">
			  	</div>
			  </div>
			</form>
		</div>
		
		<!-- 修改 -->
		<div id="deptShowForm" style="display:none">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >菜单名：</label>
			    <div class="col-sm-6">
				    <input type="text" class="form-control" id="edit_deptName" placeholder="菜单名" style="border-color: red;">
			  		<input type="hidden" class="form-control" id="edit_id" placeholder="本级id">
			  	</div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >部门描述：</label>
			    <div class="col-sm-6">
				    <textarea rows="3" class="form-control" id="edit_description" placeholder="部门描述"></textarea>
			  	</div>
			  </div>
			</form>
		</div>
		<!-- 新增员工菜单树 -->
		<div id="empTreeDiv">
			<ul id="empAndTree" class="ztree"></ul>
		</div>
		
		<!-- 添加员工 -->
		<div id="empAddForm" style="display:none">
			<form class="form-horizontal" id="empFrom">
				<div class="form-group">
				    <label class="col-sm-2 control-label" >员工名：</label>
				    <div class="col-sm-6">
					    <input type="text" class="form-control" name="validatorName" id="staffName" placeholder="员工名">
				  	</div>
			  	</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label" >出生日期：</label>
				    <div class="col-sm-6">
					    <input type="text" class="form-control" name="validatorTime" id="birthday" placeholder="出生日期">
				  	</div>
			  	</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label" >登陆账号：</label>
				    <div class="col-sm-6">
					    <input type="text" class="form-control" name="validatorName" id="account" placeholder="登陆账号">
				  	</div>
			  	</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label" >密码：</label>
				    <div class="col-sm-6">
					    <input type="text" class="form-control" name="validatorName" id="empPwd" placeholder="密码">
				  	</div>
			  	</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label" >薪资：</label>
				    <div class="col-sm-6">
					    <input type="text" class="form-control" name="validatorName" id="salary" placeholder="薪资">
				  	</div>
			  	</div>
				<div class="form-group">
				    <label class="col-sm-2 control-label" >选择部门：</label>
				    <div class=row>
				    	<div class="col-sm-5">
					    <input type="text" class="form-control" id="AddEmpDeptName" placeholder="部门名" readonly="readonly">
					    <input type="text" class="form-control" id="deptId" placeholder="部门id">
					    </div>
					    <div>
					    	<button type="button" class="btn btn-warning" onclick="EmployeeAndDept()">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								选择部门
							</button>
					    </div>
				  	</div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-2 control-label" >性别：</label>
				    <div class="col-sm-6">
					    <input type="radio" name="staffSex" value="1">男
					    <input type="radio" name="staffSex" value="0">女
				  	</div>
			  	</div>
			</form>
		</div>




		<!-- 修改员工 -->
		<div id="edit_empForm" style="display:none">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label" >员工名：</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="validatorName"  id="edit_staffName" placeholder="员工名">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" >出生日期：</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="validatorTime"  id="edit_birthday" placeholder="出生日期">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" >薪资：</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="validatorName"  id="edit_salary" placeholder="薪资">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" >选择部门：</label>
					<div class=row>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="edit_AddEmpDeptName" placeholder="部门名" readonly="readonly">
							<input type="text" class="form-control" id="edit_deptId" placeholder="部门id">
						</div>
						<div>
							<button type="button" class="btn btn-warning" onclick="EmployeeAndDept()">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								选择部门
							</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" >性别：</label>
					<div class="col-sm-6">
						<input type="radio" name="edit_staffSex" value="1">男
						<input type="radio" name="edit_staffSex" value="0">女
					</div>
				</div>
			</form>
		</div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- zTree -->
<script src="<%=request.getContextPath() %>/js/zTree_v3/js/jquery.ztree.core.min.js"></script>
<!-- 加载bootbox -->
<script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
<!-- datetime -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTime/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
<!--highcharts-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/highCharts/highcharts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/highCharts/exporting.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/highCharts/dark-unica.js"></script>
<script src="http://cdn.pisen.com.cn/pmc/plugins/highcharts/highcharts.js" type="text/javascript"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<!--validator-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/validator/bootstrapValidator.min.js"></script>

<!--switch-->
<script src="<%=request.getContextPath() %>/js/bootstrap/switch/bootstrap-switch.min.js"></script>





<script type="text/javascript">
	$(function(){
		initTree();
		minDate();
		maxDate();
		employeeTable();
		trColor();
		//highcharts
        container();
        containerColumn();
        Validator($("#excelForm"));
	})
    //验证
    function Validator(data){
        data.bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                /*验证*/
                validatorName: {
                    /*键名username和input name值对应*/
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                staffName:{
                    /*键名username和input name值对应*/
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '用户名长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                /*phone: {/!*键名username和input name值对应*!/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/!*非空提示*!/
                            message: '号码不能为空'
                        },
                        stringLength: {/!*长度提示*!/
                            min:11,
                            max: 11,
                            message: '号码长度不能超过11位'
                        },
                    }
                },*/
                validatorTime: {
                    validators: {
                        date: {
                            format: 'YYYY/MM/DD',
                            message: '时间格式错误，请检查'
                        }
                    }
                },
                birthday: {
					validators: {
						date: {
							format: 'YYYY/MM/DD',
								message: '时间格式错误，请检查'
						}
					}
				},
                salary:{
                    validators: {
                        notEmpty: { //!*非空提示*!/
							message: '不能为空',
						},
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '不能包含大写、小写、数字和下划线'
                        }
                    }
				}
            }
        })
    }
	//柱状图
	function containerColumn(param){
	    if(param != null){
            $.ajax({
                type:"post",
                data:{"param":param},
                url:"<%=request.getContextPath()%>/emp/empAndDeptcolumn.jhtml",
                success:function(result){
                    console.log(result.data);
                    var chart = Highcharts.chart('containerColumn', {
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: '各部门平均工资'
                        },
                        subtitle: {
                            text: '数据截止 2019-03，来源: <a href="https://en.wikipedia.org/wiki/List_of_cities_proper_by_population">飞狐教育</a>'
                        },
                        xAxis: {
                            type: 'category',
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: '平均工资 (百万)'
                            }
                        },
                        legend: {
                            enabled: true
                        },
                        tooltip: {
                            pointFormat: '平均工资: <b>{point.y} 百万</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    format: '<b>{point.name}</b>: {point.y}',
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            name: '总人口',
                            data: result.data,
                            colorByPoint: true,
                            color: '#FFFFFF',
                            format: '{point.y:.2f}', // :.1f 为保留 1 位小数
                            y: 10
                        }]
                    });
                }
            })
		}
	}
    function container(param){
	    if (param != null){
            $.ajax({
                type:"post",
                data:{"param":param},
                url:"<%=request.getContextPath()%>/emp/empAndDeptPie.jhtml",
                success:function(result){
                    // 创建渐变色
                    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
                        return {
                            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
                            stops: [
                                [0, color],
                                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                            ]
                        };
                    });
                    // 构建图表
                    var chart = Highcharts.chart('container',{
                        title: {
                            text: '每个部门的员工'
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.y}</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    format: '<b>{point.name}</b>: {point.y}',
                                },
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                },
                                connectorColor: 'silver',
                                showInLegend: true
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: '员工人数占比:',
                            colorByPoint: true,
                            data: result.data
                        }]
                    });
                }
            })
		}
    }

	/* 按部门导出execl */
	function exportExcelByDept(){
		var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
		var nodes = treeObj.getSelectedNodes();
		if(nodes.length==1){
			//获取选中的节点
			var v_selected=nodes[0];
			var code=[];
			
			//判断其是否存在子节点
			if(v_selected.children){
				//获得所有的子节点
				var v_node=v_selected.children;
				//循环子节点
				for(var i=0;i<v_node.length;i++){
					var v_nodeId = v_node[i].id;
					var v_nodeName = v_node[i].name;
					//获取当前节点下的子子孙孙节点
					var childrenNodes=treeObj.transformToArray(v_node);
					
					var nodeIds=[];
					for(var k=0;k<childrenNodes.length;k++){
						nodeIds.push(childrenNodes[k].id);
					}
					var idsArr = nodeIds.join(",");
					
					var idsVal = v_nodeName+":"+idsArr;
					code.push(idsVal);
				}
				
			}else{
				code.push(v_selected.name+":"+v_selected.id);
			}

			//构建表单，动态提交
			var v_form=$('<form></form>');
			 v_form.html('<input type="hidden" id="params" name="params">');
			 v_form.prop("action","<%=request.getContextPath()%>/employee/exportExeclByDept.jhtml");
			 v_form.prop("method","post");
			
			//将form表单放入body 中，可以直接通过id找到，进行赋值
			$(document.body).append(v_form);
			$("#params").val(code.join(";"));
			
			//表单提交
			v_form.submit();
		}else{
			bootbox.alert({
				title:"温馨提示",
				size:"small",
				message:"<span class='glyphicon glyphicon-grain'></span>请选择要导出的部门"
			})
		}
	}
	//动态导出Excel
	function dynaMicdownLoadExcel(){
		//获取条件查询的值
		var v_empForm = document.getElementById("excelForm");
		v_empForm.action = "<%=request.getContextPath()%>/emp/dynaMicdownLoadExcel.jhtml";
		v_empForm.method = "post";
		v_empForm.submit();
	}
	//导出Excel
	function downLoadExcel(){
		//获取条件查询的值
		var v_empForm = document.getElementById("excelForm");
		v_empForm.action = "<%=request.getContextPath()%>/emp/downLoadExcel.jhtml";
		v_empForm.method = "post";
		v_empForm.submit();
	}
	//部门关联员工  关联统计图
	function deptClickEmp(event,treeId,treeNode){
	    //拼接的菜单树id
		var ids = [];
		//点击节点的下一级部门名
		var deptName = [];
        //点击节点的下一级部门名
		var deptId = [];
		//获取当前选中节点的ID
		var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
		var empNodes = treeObj.transformToArray(treeNode);
		for (var i = 0; i < empNodes.length; i++) {
			ids.push(empNodes[i].id);
		}
		//给查询隐藏域赋值
		$("#sc_deptId").val(ids);
		//调用员工表条件查询
		searchEmp(ids);

		//获取当前节点的下一级节点和下一级节点的子孙节点
        //var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
        var nodes = treeObj.getSelectedNodes();
        var a=nodes[0].children;
        var v_param=[];

        for (var i = 0; i <a.length ; i++) {
            var v_nodes = treeObj.transformToArray(a[i]);
            var v_ids=[]
            for (var j = 0; j <v_nodes.length ; j++) {

                v_ids.push(v_nodes[j].id)
            }

            v_param.push(a[i].name+":"+v_ids.join(","));
        }
        //饼状图关联
        container(v_param.join(";"));
        containerColumn(v_param.join(";"));
	}
	//加载新增员工菜单树
	function EmployeeAndDept(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/dept/findDeptList.jhtml",
			success:function(result){
				if(result.code == 200){
					var setting = {
							data: {
								simpleData: {
									enable: true
								}
							}
						};
						$(document).ready(function(){
							$.fn.zTree.init($("#empAndTree"), setting, result.data);
						});
				}
				else{
					alert(result.error);
				}
			}
		})
		//弹框
		var empTreeDialog = bootbox.dialog({
            title: '增加部门',
            message:$("#empTreeDiv"),
            size:"small",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                    	//点击事件，获取当前点击的id和name
                    	var treeObj = $.fn.zTree.getZTreeObj("empAndTree");
						var nodes = treeObj.getSelectedNodes();
						if (nodes.length == 1) {
							//获取id和name
							var v_deptId = nodes[0].id;
							var v_deptName = nodes[0].name;
							//赋值给新增员工弹框内的表单
							$("#AddEmpDeptName",addEmpDialog).val(v_deptName);
							$("#deptId",addEmpDialog).val(v_deptId);
							//赋值给修改员工弹框的表单
                            //部门名
                            $("#edit_AddEmpDeptName",editEmpDialog).val(v_deptName);
                            //部门IP
                            $("#edit_deptId",editEmpDialog).val(v_deptId);
						}else {
							bootbox.alert({
					              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择一个部门",
					              size: 'small',
					              title:"警告"});
						}
                    	//重新给菜单div赋值
                    	$("#empTreeDiv").html('<ul id="empAndTree" class="ztree"></ul>');
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger',
					callback: function(){
						$("#empTreeDiv").html('<ul id="empAndTree" class="ztree"></ul>');                	
					}
                }
            }
        });
	}
	//条件查询
	function searchEmp(ids){
		var sc_staffName = $("#sc_staffName").val();
		var sc_staffSex = $("[name='staffSex']:checked").val();
		var sc_minDate = $("#minDate").val();
		var sc_maxDate = $("#maxDate").val();
		var sc_minSalary = $("#minSalary").val();
		var sc_maxSalary = $("#maxSalary").val();
		var sc_idList = $("#sc_deptId").val();
		var param = {};
		param.staffName = sc_staffName;
		param.staffSex = sc_staffSex;
		param.minDate = sc_minDate;
		param.maxDate = sc_maxDate;
		param.minSalary = sc_minSalary;
		param.maxSalary = sc_maxSalary;
		param.idList = sc_idList;
		console.log(param);
		empTable.settings()[0].ajax.data=param;
		empTable.ajax.reload();
	}
    //删除员工
    function deleteEmployee(){
        console.log(trIds);
        bootbox.confirm({
            message: "确定要删除这些数据？",
            size: "small",
            buttons: {
                confirm: {
                    label: '是',
                    className: 'btn-success'
                },
                cancel: {
                    label: '否',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result == true) {
                    //ajax把数组发送到后台删除
                    $.ajax({
                        type:"post",
                        data:{"ids":trIds},
                        url:"<%=request.getContextPath()%>/emp/deleteEmployee.jhtml",
                        success:function (result) {
                            if (result.code == 200){
                                bootbox.alert({
                                    message: "删除成功",
                                    className: 'bb-alternate-modal'
                                });
                                searchEmp();
                            }else{
                                bootbox.alert({
                                    message: "删除失败，请联系管理员",
                                    className: 'bb-alternate-modal'
                                });
                            }
                        }
                    })
                } else {
                    bootbox.alert({
                        message: "已取消删除",
                        className: 'bb-alternate-modal'
                    });
                }

            },
        })
    }
    //修改员工信息
    var editEmpDialog;
    function updateEmployee(id) {
        //查询数据库
        $.ajax({
            type:"post",
            data:{"id":id},
            url:"<%=request.getContextPath()%>/emp/toUpdateEmp.jhtml",
            success:function(result){
                //赋值  只修改 员工名，性别，部门，薪资，状态
                $("#edit_staffName",editEmpDialog).val(result.data.staffName);
                $("#edit_birthday",editEmpDialog).val(result.data.birthday);
                $("#edit_salary",editEmpDialog).val(result.data.salary);
                //部门名
                $("#edit_AddEmpDeptName",editEmpDialog).val(result.data.dept.deptName);
                //部门IP
                $("#edit_deptId",editEmpDialog).val(result.data.deptId);
                //性别
                var staffSex = $("input[name='edit_staffSex']",editEmpDialog);
                for (var i=0; i<staffSex.length; i++){
                    if (result.data.staffSex == staffSex[i].value){
                        $(staffSex[i]).attr("checked",true);
                    }
                }

                editEmpDialog = bootbox.dialog({
                    title: '修改员工',
                    message:$("#edit_empForm").clone(),
                    size:"large",
                    buttons: {
                        confirm: {
                            label: '<span class="glyphicon glyphicon-ok"></span>确认',
                            className: 'btn-primary',
                            callback: function () {
                                //获取值
                                var v_staffName = $("#edit_staffName",editEmpDialog).val();
                                var v_birthday = $("#edit_birthday",editEmpDialog).val();
                                var v_salary = $("#edit_salary",editEmpDialog).val();
                                //部门IP
                                var v_deptId = $("#edit_deptId",editEmpDialog).val();
                                //性别
                                var staffSexs = $("input[name='edit_staffSex']",editEmpDialog).val();
                                var v_staffSex;
                                if(staffSexs.length == 0){
                                    v_staffSex = result.data.staffSex;
                                }else{
                                    v_staffSex = $("input[name='edit_staffSex']:checked",editEmpDialog).val();
                                }
                                var param = {};
                                param.id = id;
                                param.staffName = v_staffName;
                                param.birthday = v_birthday;
                                param.salary = v_salary;
                                param.deptId = v_deptId;
                                param.staffSex = v_staffSex;
                                console.log(param);
                                //ajax提交
                                $.ajax({
                                    type:"post",
                                    data:param,
                                    url:"<%=request.getContextPath()%>/emp/updateByIdEmp.jhtml",
                                    success:function(result){
                                        if (result.code == 200) {
                                            empTable.ajax.reload();
                                            bootbox.alert({
                                                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                                size: 'small',
                                                title:"提示信息"});
                                        }else{
                                            bootbox.alert({
                                                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
                                                size: 'small',
                                                title:"警告"});
                                        }
                                    }
                                })
                            },
                            cancel: {
                                label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                className: 'btn-danger',
                                callback: function () {

                                }
                            }
                        }
                    }
                });
                Validator(editEmpDialog);
            }
        })
    }
	//添加员工
	var addEmpDialog;
	function addEmployee(){
		addEmpDialog = bootbox.dialog({
            title: '<h2>增加员工</h2>',
            message:$("#empAddForm form"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                    	//点击确定获取新增用户输入框里新增节点的值
                    	var param = {};
                    	param.staffName = $("#staffName",addEmpDialog).val();
                    	param.birthday = $("#birthday",addEmpDialog).val();
                    	param.account = $("#account",addEmpDialog).val();
                    	param.empPwd = $("#empPwd",addEmpDialog).val();
                    	param.salary = $("#salary",addEmpDialog).val();
                    	param["dept.id"] = $("#deptId",addEmpDialog).val();
                    	param.staffSex = $("input[name='staffSex']:radio:checked",addEmpDialog).val();
                    	$.ajax({
                    		type:"post",
                    		data:param,
                    		url:"<%=request.getContextPath()%>/emp/addEmployee.jhtml",
                    		success:function(result){
                    			if (result.code == 200) {
                    				empTable.ajax.reload();
                    				bootbox.alert({
      					              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
      					              size: 'small',
      					              title:"提示信息"});
								}else{
									bootbox.alert({
						              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
						              size: 'small',
						              title:"警告"});
								}
                    		}
                    	})
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
        });
        Validator(addEmpDialog);
		$('#birthday',addEmpDialog).datetimepicker({
		    language:  'zh-CN',
		    weekStart: 0,
		    todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format:'yyyy-mm-dd'
		});
	
	}
	//初始化表格
	var empTable;
	//表格翻页选中存放id的数组
	var trIds = [];
 	function trColor(){
 		//给表格的行添加点击事件
 		$("#employeeDataTable tbody").on("click","tr",function(){
 			var v_checkbox = $(this).find("td input[type='checkbox']");
 			//
			if (v_checkbox.prop("checked")) {
				v_checkbox.prop("checked",false);
				$(this).closest("tr").css({background:""})
				//删除数组
				for (var i = 0; i < trIds.length; i++) {
					if (v_checkbox.val() == trIds[i]) {
						trIds.splice(trIds[i],1);
						break;
					}
				}
			}else{
				//增加
				v_checkbox.prop("checked",true);
				v_checkbox.closest("tr").css({background:"green"});
				trIds.push(v_checkbox.val());
			}
 		})
    }


    //员工表格
	function employeeTable(){
		empTable = $('#employeeDataTable').DataTable({
			'bStateSave': false,
			'paging': true,
			"processing": true,
	        "serverSide": true,
	        'lengthMenu': [5, 10, 20, 30],
	        "ajax": {
	            "url": "<%=request.getContextPath()%>/emp/findEmployee.jhtml",
	            "type": "POST",
	           "dataSrc":function(result){
	            	if(result.code==200){
		       			 result.iTotalRecords=result.data.iTotalRecords;
		       			 result.iTotalDisplayRecords=result.data.iTotalDisplayRecords;
		       			 return result.data.data;
	            	}
	            	
				} 
	        },
	        'columns': [
						{
							"data": "id",
							"render":function(data,type,row,meta){
								return '<input type="checkbox" value="'+data+'" name="empCheckbox"/>';
							}
						},
						{"data": "staffName"},
						{
							"data": "staffSex",
							'render':function(data,type,row){
									if (data == 1) {
										return "男";
									}else {
										return "女";
									}					
							}
						},
						{"data": "birthday"},
						{"data": "dept.deptName"},
						{"data": "salary"},
						{
						    "data":"status",
							"render":function (data,row,type) {
								return '<input type="checkbox" data-empId="'+type.id+'" name="status" value="'+data+'" data-on-color="danger" data-off-color="success" class="checkbox"  data-on-text="锁定" data-off-text="解锁" style="height: 20px;"/> ';
						}
						},
						{
							"data":"id",
							render:function(data){
								return '<button type="button" class="btn btn-warning" id="bb" onclick="updateEmployee('+data+')">'
										+'<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>'
										+'修改'
										+'</button>'
							}
						}
					],
					/*"createdRow": function( row, data, dataIndex ) {

						if (data.status == 0) {

							$(function () {
								$('[name="mySwitch"] input', row).bootstrapSwitch("state", false);
								$('[name="mySwitch"] input', row).on('switchChange.bootstrapSwitch', function (event, state) {
									updeteStatus(1, data);
								});
							})

						} else {
							$(function () {
								$('[name="mySwitch"] input', row).bootstrapSwitch("state", true);
								$('[name="mySwitch"] input', row).on('switchChange.bootstrapSwitch', function (event, state) {
									updeteStatus(0, data);
								});
							})
						}
					},*/
		            //翻页选中
		            "drawCallback": function() {
		                //switch状态
                        //先获取状态复选框
                        $("#employeeDataTable tbody").find("input[name='status']:checkbox").each(function(){
                            //获取复选框，改变样式
                            $(this).bootstrapSwitch({
                                onSwitchChange:function(event,data){
                                    //获取id
                                    var v_id = $(this).attr("data-empId");
                                    var statusId = data?1:0;
                                    var param = {};
                                    param.id = v_id;
                                    param.status = statusId;
                                    //发送ajax
                                   $.ajax({
                                        type:"post",
                                        data:param,
                                        url:"<%=request.getContextPath()%>/emp/updateStatus.jhtml",
                                        success:function (result) {
                                            if(result.code==200){
                                                bootbox.alert({
                                                    message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改状态成功",
                                                    size: 'small',
                                                    title: "提示信息"
                                                });
                                                searchEmp();
                                            }
                                        }
                                    })
                                }
                            });
                            //回显按钮状态
                            if (this.value ==0){
                                $(this).bootstrapSwitch("state", false,true);
                            }else{
                                $(this).bootstrapSwitch("state", true,true);
                            }
                        })


		            	$("#employeeDataTable tbody").find("input[name='empCheckbox']:checkbox").each(function(){
		            		   var v_id = this.value;
				               if (isExist(v_id)) {
									$(this).prop("checked",true);
									$(this).closest("tr").css({background:"green"});
								}
		            	})
		            },
	        "language": {
	            "url": "<%=request.getContextPath()%>/js/DataTables-1.10.15/Chinese.json"
	        }
	    } );
	}
	function isExist(id){
		for (var i = 0; i < trIds.length; i++) {
			if (trIds[i] == id) {
				return true;
				break;
			}
		}
		return false;
	}

	
	//员工生日查询
	function minDate(){
		$('#minDate').datetimepicker({
		    language:  'zh-CN',
		    weekStart: 0,
		    startDate:'2018-09-01',
		    todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format:'yyyy-mm-dd'
		});
	}
	function maxDate(){
		$('#maxDate').datetimepicker({
		    language:  'zh-CN',
		    weekStart: 0,
		    startDate:'2018-09-01',
		    todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format:'yyyy-mm-dd'
		});
	}
	//菜单树删除
	function deleteDept(){
		//获取当前选中节点的ID
		var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
		var nodes = treeObj.getSelectedNodes();
		if (nodes.length ==0) {
			bootbox.alert({
              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
              size: 'small',
              title:"提示信息"});
		}else{
			bootbox.confirm({ 
			  size: "small",
			  message: "删除部门", 
			  callback: function(result){
				 if (result) {
					 //接收所有节点的id
					  var idList = [];
					  //接收所有选择的节点及子孙节点
					  var selectNode = [];
					  for (var i = 0; i < nodes.length; i++) {
						//接收当前节点及子孙节点循环出来的值
						var node = nodes[i];
						//转换成简单数组
						var nodeList = treeObj.transformToArray(node);
						//循环转换完成的数组
						for (var j = 0; j < nodeList.length; j++) {
							//ids接收id值
							idList.push(nodeList[j].id);
							//selectNode 接收循环出来的子孙节点
							selectNode.push(nodeList[j]);
						}
					}
					  //把IDS 发送到后台删除数据库
					  $.ajax({
						  type:"post",
						  data:{"idList":idList},
						  url:"<%=request.getContextPath()%>/dept/deleteDept.jhtml",
						  success:function(result){
							  if (result.code == 200) {
								  bootbox.alert({
						              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除成功",
						              size: 'small',
						              title:"提示信息"});
								  for (var i = 0; i < selectNode.length; i++) {
										treeObj.removeNode(selectNode[i]);
									} 
								  empTable.ajax.reload();
							}
						  }
					  })
				}
			  }
			})
		}
	}
	
	//菜单树修改
	function showDeptDlg(){
		//获取当前选中节点的ID
		var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
		var nodes = treeObj.getSelectedNodes();
		if (nodes.length == 1) {
			//获取选中节点的值
			var v_fatherId = nodes[0].id;
			var v_fatherName = nodes[0].name;
			var v_description = nodes[0].description
			//赋值给弹出框的输入框
			$("#edit_deptName").val(v_fatherName);
			$("#edit_id").val(v_fatherId);
			$("#edit_description").val(v_description);
			//弹出框
			var editDeptDialog = bootbox.dialog({
                title: '修改部门',
                message:$("#deptShowForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                        	//点击确定获取用户输入框里新增节点的值
                        	var edit_name = $("#edit_deptName",editDeptDialog).val();
                        	var v_edit_description = $("#edit_description",editDeptDialog).val();
                        	var param = {};
                        	param.id = v_fatherId;
                        	param.deptName = edit_name;
                        	param.description = v_edit_description;
                        	$.ajax({
                        		type:"post",
                        		data:param,
                        		url:"<%=request.getContextPath()%>/dept/update.jhtml",
                        		success:function(result){
                        			if (result.code == 200) {
                        				bootbox.alert({
                       		              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改成功",
                       		              size: 'small',
                       		              title:"提示信息"});
                        				//修改节点
                        				nodes[0].name = edit_name;
                        				nodes[0].description = v_edit_description;
                        				treeObj.updateNode(nodes[0]);
                        				empTable.ajax.reload();
									}
                        		}
                        	})
                        	
                        	//使用ajax把获取到的值发送到后台
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
            });
		}else if(nodes.length == 0){
			bootbox.alert({
              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
              size: 'small',
              title:"提示信息"});
		}else {
			bootbox.alert({
              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个部门",
              size: 'small',
              title:"提示信息"});
		}
	}
	
	//菜单树新增
	function addDeptDlg(){
		//获取当前选中节点的ID
		var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
		var nodes = treeObj.getSelectedNodes();
		if (nodes.length == 1) {
			//获取选中节点的值
			var v_fatherId = nodes[0].id;
			var v_fatherName = nodes[0].name;
			//赋值给弹出框的输入框
			$("#fatherName").val(v_fatherName);
			$("#fatherId").val(v_fatherId);
			//弹出框
			var addDeptDialog = bootbox.dialog({
                title: '增加部门',
                message:$("#deptAddForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                        	//点击确定获取用户输入框里新增节点的值
                        	var v_description = $("#description",addDeptDialog).val();
                        	var v_addtime = $("#addtime",addDeptDialog).val();
                        	var param = {};
                        	param.fatherId = v_fatherId;
                        	param.deptName = $("#deptName",addDeptDialog).val();
                        	param.description = v_description;
                        	param.addtime= v_addtime;
                        	$.ajax({
                        		type:"post",
                        		data:param,
                        		url:"<%=request.getContextPath()%>/dept/addDept.jhtml",
                        		success:function(result){
                        			if (result.code == 200) {
                        				bootbox.alert({
                       		              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                       		              size: 'small',
                       		              title:"提示信息"});
                        				var treeObj = $.fn.zTree.getZTreeObj("ztreeDemo");
                        				var newNode = {};
                        				newNode.id = result.data.id;
                        				newNode.name = result.data.deptName;
                        				newNode.pId = result.data.fatherId;
                        				newNode.description = result.data.description;
                        				newNode.addtime = result.data.addtime;
                        				newNode = treeObj.addNodes(nodes[0], newNode);
									}
                        		}
                        	})
                        	
                        	//使用ajax把获取到的值发送到后台
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
            });
			$('#addtime',addDeptDialog).datetimepicker({
			    language:  'zh-CN',
			    weekStart: 0,
			    startDate:'2018-09-01',
			    todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0,
				format:'yyyy-mm-dd'
			});
		}else if(nodes.length == 0){
			bootbox.alert({
              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
              size: 'small',
              title:"提示信息"});
		}else {
			bootbox.alert({
              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个部门",
              size: 'small',
              title:"提示信息"});
		}
	}
	
	//加载树
	function initTree(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/dept/findDeptList.jhtml",
			success:function(result){
				if(result.code == 200){
					var setting = {
							callback: {
								onClick: deptClickEmp
							},
							data: {
								simpleData: {
									enable: true
								}
							}
						};
						$(document).ready(function(){
							$.fn.zTree.init($("#ztreeDemo"), setting, result.data);
						});
				}
			}
		})
	}
</script>

</body>
</html>