<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>添加品牌</title>
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
<!--fileInput-->
<link href="<%=request.getContextPath()%>/js/bootstrap/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css"/>
<body>

    <%--<div class="container-fluid" id="adddivform">
        <div class="row">
            <div class="col-md-10">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-warning" onclick="addBrand(this)">
                            <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                            添加面板
                        </button>
                    </div>
                    <div name="brandAddForm" style="margin-top: 20px;">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >品牌名：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="brandName" id="add_brandName" placeholder="品牌名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >品牌描述：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="description" id="add_description" placeholder="品牌描述">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >品牌Logo：</label>
                                <div class="col-sm-6">
                                    <input type="file" name="photo" id="brandFile" data-ref="url12" multiple class="col-sm-10 myfile"/>
                                    <input type="text" id="brandLogo">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-left: 250px;">
        <button type="reset" class="btn btn-warning" >
            <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
            重置
        </button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-warning" onclick="addBatchBrand()">
            <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
            添加
        </button>
    </div>


    <!--被复制的面板，要隐藏起来-->
    <div class="container-fluid" style="display: none" flag="addPanel">
        <div class="row">
            <div class="col-md-10">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <button type="button" class="btn btn-warning" onclick="removeBrand(this)">
                            <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                            移除面板
                        </button>
                    </div>
                    <div style="margin-top: 20px;">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >品牌名：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="brandName"  placeholder="品牌名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >品牌描述：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="description"  placeholder="品牌描述">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >品牌Logo：</label>
                                <div class="col-sm-6">
                                    <input type="file" name="photo"  data-ref="url12" flag="photos" multiple class="col-sm-10 myfile"/>
                                    <input type="text" name="brandPhotos">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

    <div class="container-fluid" >
        <div class="row">
            <div class="col-md-10">
                <button type="button" class="btn btn-warning" onclick="addBrand(this)">
                    <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                    添加面板
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
                <div class="panel panel-info" flag="brandPanel">
                    <div class="panel-heading">
                        <h4>添加品牌</h4>
                    </div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" >品牌名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="brandName" placeholder="品牌名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" >品牌描述：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="description" placeholder="品牌描述">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" >品牌Logo：</label>
                            <div class="col-sm-6">
                                <input type="file" name="photo" id="brandFile" data-ref="url12" multiple class="col-sm-10 myfile"/>
                                <input type="text" id="brandLogo" name="brandLogo">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <center>
        <button type="reset" class="btn btn-warning" >
            <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
            重置
        </button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-warning" onclick="addBatchBrand()">
            <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
            添加
        </button>
    </center>

<div style="display: none" id="brandInfoDiv">
    <div class="panel panel-info" flag="brandPanelInfo">
        <div class="panel-heading">
            <button type="button" class="btn btn-warning" onclick="removeBrand(this)">
                <span class="glyphicon glyphicon-record" aria-hidden="true"></span>
                移除面板
            </button>
        </div>
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label" >品牌名：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="brandName"  placeholder="品牌名">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" >品牌描述：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="description"  placeholder="品牌描述">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" >品牌Logo：</label>
                <div class="col-sm-6">
                    <input type="file" name="photo"  data-id="brandPhotos" multiple class="col-sm-10 myfile"/>
                    <input type="text" flag="brandLogos" name="brandLogo">
                </div>
            </div>
        </form>
    </div>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/highCharts/highcharts.src.js"></script>
<!--fileInput-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/fileinput/js/locales/zh.js"></script>
<script type="text/javascript">

    $(function () {
        initBrandFile();
    })
    //移除面板
    function removeBrand(obj) {
        $(obj).parent().parent().remove();
    }
    function addBrand(obj){
        var v_div = $("div [flag='brandPanelInfo']").last().clone();
        fileinput(v_div);
        $(".row div[flag='brandPanel']").last().after(v_div);
    }

    //多面板添加
    function addBatchBrand() {
        var brandNameList = [];
        var descriptionList = [];
        var brandLogoList = [];
        $(".row input[name='brandName']").each(function () {
            brandNameList.push(this.value);
        })
        $(".row input[name='description']").each(function () {
            descriptionList.push(this.value);
        })
        $(".row input[name='brandLogo']").each(function () {
            brandLogoList.push(this.value);
        })
        var param = {};
        var isNodescriptionList = "该品牌暂未添加描述";
        param.brandName = brandNameList.join(",");
        if (descriptionList.length > 0){
            param.description = descriptionList.join(",");
        }else{
            param.description = isNodescriptionList;
        }
        param.brandLogo = brandLogoList.join(",");
        console.log(param);
        $.ajax({
            type:"post",
            data:param,
            url:"<%=request.getContextPath()%>/brand/addBrandTo.jhtml",
            success:function(result){
                if (result.code == 200) {
                    bootbox.alert({
                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                        size: 'small',
                        title:"提示信息"});
                    //跳转
                    location.href="<%=request.getContextPath()%>/brand/jumpBrand.jhtml";
                }else{
                    bootbox.alert({
                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
                        size: 'small',
                        title:"警告"});
                }
            }
        })
    }
    //图片
    function initBrandFile(url){
        $("#brandFile").fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            initialPreview:url,
            uploadUrl:"<%=request.getContextPath()%>/brand/flieinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#brandLogo").val(data.response.data);
        });
    }

    //第二个面板的图片
    function fileinput(obj){
        var settings= {
            language: 'zh', //设置语言
            showRemove: false, //显示移除按钮
            showPreview: true, //是否显示预览
            autoReplace: false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype: 'multipart/form-data',
            maxFileCount: 1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData: true,
            uploadUrl: "<%=request.getContextPath()%>/brand/flieinput.jhtml",
        }
            $("input[data-id='brandPhotos']",obj).fileinput(settings).on("fileuploaded", function(event, data) {
                $("input[flag='brandLogos']").val(data.response.data);
            });

    }
</script>

</body>
</html>
