<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员列表页面</title>
    <!--路径图片-->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/image/2.png" />
    <!-- Bootstrap 核心 CSS 文件-->
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 加载bootbox -->
    <script src="<%=request.getContextPath() %>/js/bootstrap/bootbox.min.js"></script>
    <!-- datetime -->
    <link href="<%=request.getContextPath() %>/js/dataTime/bootstrap-datetimepicker.min.css" rel="stylesheet" >
    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath() %>/js/DataTables-1.10.15/media/css/dataTables.bootstrap.css" rel="stylesheet" >
    <!--fileInput-->
    <link href="<%=request.getContextPath()%>/js/bootstrap/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css"/>
    <!-- zTree -->
    <link href="<%=request.getContextPath() %>/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" >
    <!--validator-->
    <link href="<%=request.getContextPath() %>/js/bootstrap/validator/bootstrapValidator.min.css" rel="stylesheet" >
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    条件查询
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    列表展示
                    <button type="button" class="btn btn-danger" onclick="deleteMember()">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        删除
                    </button>
                    <button type="button" class="btn btn-info" onclick="updateMember()">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                       修改
                    </button>
                </div>
                <div class="panel-body">
                    <div class="panel-body">
                        <table id="memberDataTable" class="table table-bordered table-striped table-hover" >
                            <thead>
                            <tr>
                                <th>选择</th>
                                <th>会员名</th>
                                <th>手机号</th>
                                <th>邮箱</th>
                                <th>生日</th>
                                <th>图片</th>
                                <th>图片</th>
                            </tr>
                            <thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!--修改商品-->
<div id="editMemberForm" style="display:none">
    <form class="form-horizontal" id="memberFrom" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label" >会员名：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="userName" id="userName" placeholder="会员名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >手机号：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="phone" id="phone" placeholder="手机号">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >邮箱：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="email" id="email" placeholder="邮箱">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >生日：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="birthday" id="birthday" placeholder="生日">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >注册时间：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="regTime" id="regTime" placeholder="注册时间">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >最后一次登录时间：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="lastLoginTime" id="lastLoginTime" placeholder="最后一次登录时间">
            </div>
        </div>

    </form>
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
<!--fileInput-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/locales/zh.js"></script>
<!--validator-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/validator/bootstrapValidator.min.js"></script>
<script type="text/javascript">

    $(function () {
        memberTable();
        trColor();
        time();
        Validator();
        timestampToTime();
    })


    /*function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y + M + D;
    }*/
    //修改
    var updateMemberDialog;
    function updateMember() {
        if (trIds.length == 1){
            var id ;
            for (var i = 0; i <trIds.length ; i++) {
                id = trIds[i];
            }

            $.ajax({
                type: "post",
                data: {"id":id},
                url:"<%=request.getContextPath()%>/member/toUpdateMember.jhtml",
                success: function (result) {
                    if (result.code == 200){
                        //赋值
                        var v_data = result.data;
                        $("#userName",updateMemberDialog).val(v_data.userName);
                        $("#phone",updateMemberDialog).val(v_data.phone);
                        $("#email",updateMemberDialog).val(v_data.email);
                        $("#birthday",updateMemberDialog).val(v_data.birthday);
                        $("#regTime",updateMemberDialog).val(v_data.regTime);
                        $("#lastLoginTime",updateMemberDialog).val(v_data.lastLoginTime);
                        updateMemberDialog = bootbox.dialog({
                            title: '<h2>修改列表</h2>',
                            message:$("#editMemberForm form").clone(),
                            size:"large",
                            buttons: {
                                confirm: {
                                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                                    className: 'btn-primary',
                                    callback: function(){
                                        //获取值
                                        var param = {};
                                        var v_userName =  $("#userName",updateMemberDialog).val();
                                        var v_phone =  $("#phone",updateMemberDialog).val();
                                        var v_email = $("#email",updateMemberDialog).val();
                                        var v_birthday = $("#birthday",updateMemberDialog).val();
                                        var v_regTime = $("#regTime",updateMemberDialog).val();
                                        var v_lastLoginTime = $("#lastLoginTime",updateMemberDialog).val();
                                        param.userName = v_userName;
                                        param.phone = v_phone;
                                        param.email = v_email;
                                        param.birthday = v_birthday;
                                        param.regTime = v_regTime;
                                        param.lastLoginTime = v_lastLoginTime;
                                        console.log(param);
                                        $.ajax({
                                            type:"post",
                                            data:param,
                                           url:"<%=request.getContextPath()%>/member/updateMember.jhtml",
                                            success:function (result) {
                                                if (result.code == 200){
                                                    bootbox.alert({
                                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改成功",
                                                        size: 'small',
                                                        title:"提示信息"});
                                                }else{
                                                    bootbox.alert({
                                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改失败",
                                                        size: 'small',
                                                        title:"提示信息"});
                                                }
                                            }
                                        })
                                    }
                                },
                                cancel: {
                                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                    className: 'btn-danger',
                                }
                            }
                        });
                        //调用表单验证
                        Validator(updateMemberDialog);
                        time();
                    }
                }
            })
        } else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个",
                size: 'small',
                title: "提示信息"
            });
        }

    }
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
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                phone: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '号码不能为空'
                        },
                        stringLength: {/*长度提示*/
                            min:11,
                            max: 11,
                            message: '号码长度不能超过11位'
                        },
                    }
                },
                email: {
                    message: '用户名验证失败',//默认
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址格式有误'
                        },
                    }
                },
                birthday: {
                    validators: {
                        date: {
                             format: 'YYYY/MM/DD',
                             message: 'The birthday is not valid'
                        }
                    }
                },
                regTime: {//验证指定的日期格式
                    validators: {
                        date: {
                            format: 'YYYY/MM/DD HH:mm:ss',
                            message: 'The birthday is not valid'
                        }
                    }
                },
                lastLoginTime: {//验证指定的日期格式
                    validators: {
                        date: {
                            format: 'YYYY/MM/DD HH:mm:ss',
                            message: 'The birthday is not valid'
                        }
                    }
                }
            }
        })
    }
    function time(){
        $('#birthday',updateMemberDialog).datetimepicker({
            language:  'zh-CN',
            weekStart: 0,
            todayBtn:  1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            format:'yyyy-mm-dd',
        });
        $('#regTime',updateMemberDialog).datetimepicker({
            language:  'zh-CN',
            weekStart: 0,
            todayBtn:  1,
            autoclose: true,
            todayHighlight:1,
            startView: 2,
            minView: 0,
            minuteStep:1,
            forceParse: 0,
            format:'yyyy-mm-dd hh:mm:ss'
        });
        $('#lastLoginTime',updateMemberDialog).datetimepicker({
            language:  'zh-CN',
            weekStart: 0,
            todayBtn:  1,
            todayHighlight:1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            format:'yyyy-mm-dd hh:mm:ss',
            autoclose: true,
            minView: 0,
            minuteStep:1
        });
    }
    //删除会员
    function deleteMember() {
            bootbox.confirm({
                message: "你确定删除吗?",
                size: 'small',
                title: "提示信息",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确定',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    //判断这个result的值是否为true  点击取消返回false 点击确定才会进这个判断
                    if (result) {
                        //删除选中的复选框
                        $.ajax({
                            type: "post",
                            data: {"ids":trIds},
                            url:"<%=request.getContextPath()%>/member/deleteMember.jhtml",
                            success: function (result) {
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除成功",
                                        size: 'small',
                                        title: "提示信息"
                                    });
                                    memberTables.ajax.reload();
                                }
                            }
                        })
                    }
                }
            })
    }
    //表格翻页选中存放id的数组
    var trIds = [];
    function trColor(){
        // 给表格的行添加点击事件
        $("#memberDataTable tbody").on("click","tr",function(){
            var v_checkbox = $(this).find("td input[type='checkbox']");

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
    //初始化表格
    var memberTables;
    function memberTable(){
        memberTables = $('#memberDataTable').DataTable({
            'bStateSave': false,
            'paging': true,
            "processing": false,
            "serverSide": true,
            'lengthMenu': [5, 10, 20, 30],
            "ajax": {
                "url": "<%=request.getContextPath()%>/member/findMember.jhtml",
                "type": "POST",
                "dataSrc":function(result){
                    console.log(result.data);
                    if(result.code==200){
                        result.draw = result.data.draw;
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
                        return '<input type="checkbox" value="'+data+'" name="memberCheckbox"/>';
                    }
                },
                {"data": "userName"},
                {"data": "phone"},
                {"data": "email"},
                {"data": "birthday"},
                {"data": "regTime"},
                {"data": "lastLoginTime"},
            ],

            "language": {
                "url": "<%=request.getContextPath()%>/js/DataTables-1.10.15/Chinese.json"
            },
            "drawCallback": function( settings ) {
                $("#memberDataTable tbody").find(":checkbox").each(function(){
                    var v_id = this.value;
                    if (isExist(v_id)) {
                        $(this).prop("checked",true);
                        $(this).closest("tr").css({background:"green"});
                    }
                })
            },
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
</script>
</body>
</html>
