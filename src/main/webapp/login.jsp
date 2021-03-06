<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/1.jpg" />
<!-- Bootstrap 核心 CSS 文件-->
<link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--validator-->
<link href="<%=request.getContextPath() %>/js/bootstrap/validator/bootstrapValidator.min.css" rel="stylesheet" >
<style type="text/css">
	body{
		  font-family: "华文细黑";
		  background:url("<%=request.getContextPath()%>/image/3.jpg") no-repeat;
		  background-size: 100%;
		}
</style>
</head>
<body>	
			<div style="margin-left: 265px; margin-top:430px;">
				<button type="button" onclick="login()">
				</button>
			</div>
			<center>
				<div id="diglogDiv">
					<div style="display: none">
						 <form class="form-horizontal"  id="loginForm">
					        <div class="form-group" style="margin-top: 20px;">
					            <label  class="col-sm-2 control-label">用户名</label>
					            <div class="col-sm-4">
					                <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名">
					            </div>
								<!-- <a href="javascript:;" onclick="jumpReg()">点击注册</a> -->

					        </div>
					        <div class="form-group">
					            <label  class="col-sm-2 control-label">密码</label>
					            <div class="col-sm-4">
					                 <input type="text" class="form-control"  name="userPwd" id="userPwd" placeholder="密码">
					            </div>
					        </div>
					        <div class="form-group">
					            <label  class="col-sm-2 control-label">验证码</label>
					            <div class="col-sm-4">
					                  <input type="text" class="form-control" name="code" placeholder="请输入验证码" id="imgAuthImag" />
					            </div>
					            <div class="col-sm-3">
					            	 <img src="<%=request.getContextPath()%>/authImage" onclick="imgAuthImagText(this)"/>
					            </div>
					        </div>
					       <!--  <div class="form-group">
					        	<label  class="col-sm-1 control-label"></label>
					        	<div class="col-sm-6">
					        		<button type="reset" class="btn dropdown-toggle">
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
										重置
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        		<button type="button" class="btn btn-warning" onclick="login()">
										<span class="glyphicon glyphicon-record" aria-hidden="true"></span>
										登陆
									</button>
					        	</div>
					        </div> -->
					<!-- 		 注册
							 <iframe name="cIframe" id="cIframe" src="http://192.168.0.135:8089/reg.html"></iframe> -->
					    </form>
					</div>	
				</div>		
			</center>







<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- 加载bootbox -->
<script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
<!--md5-->
<script src="<%=request.getContextPath() %>/js/md5.js"></script>
<!--validator-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/validator/bootstrapValidator.min.js"></script>
<script type="text/javascript">

	$(function(){
		initLogin();
        Validator($("#loginForm"));
	})

	$("#cIframe").css("width","500");
    //验证
    function Validator(data){
        data.bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
                userName: {/*键名username和input name值对应*/
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
                    }
                },
                userPwd: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '密码不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min:0,
                            max: 11,
                            message: '密码长度不能超过11位'
                        },
                        regexp : {
                            regexp : /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])|(?=.*[A-Z])(?=.*[a-z])(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])).{8,16}$/,
                            message : '用户确认密码长度为8至16位,并且需要包含数字、小写字母、大写字母、符号(至少三种)'
                        },
                        }
                },
                code: {
                    message: '验证码失败',//默认
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 4,
                            message: '用户名长度不能超过4位'
                        },
                        regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '只能是数字和字母_.'
                        },
                    }
                },
            }
        })
    }
    var loginDialog;
    function initLogin(){
		//弹出框
		loginDialog = bootbox.dialog({
            title: '欢迎登录',
            message:$("#loginForm").clone(),
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>登录',
                    className: 'btn-primary',
                    callback: function(){
                    	var v_userName=$("#userName",loginDialog).val();
                		var v_userPwd= hex_md5($("#userPwd",loginDialog).val());
                        //var v_userPwd=$("#userPwd",loginDialog).val();
                		var v_imgAuthImag=$("#imgAuthImag",loginDialog).val();
                		var param = {};
                		param.account = v_userName;
                		param.empPwd = v_userPwd;
                		param.imgAuthImag = v_imgAuthImag;
                		$.ajax({
                			type:"post",
                			data:param,
                			url:"<%=request.getContextPath()%>/user/userLogin.jhtml",
                			success:function(result){
                				if (result.code == 200) {
                					alert("登陆成功");
                					location.href="<%=request.getContextPath()%>/user/index.jhtml";
                				}else{
                					alert(result.message);
                                    initLogin();
                				}
                			}
                		})
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger',
                    callback: function(){
                        bootbox.alert({
                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请点击船桨",
                            size: 'small',
                            title:"警告"});
                    }
                }
            }
        });
        Validator(loginDialog);
	}
	
	
	function imgAuthImagText(obj){
		obj.src="<%=request.getContextPath()%>/authImage?"+new Date().getTime();
	}
	function login(){
        initLogin();
	}
</script>
</body>
</html>