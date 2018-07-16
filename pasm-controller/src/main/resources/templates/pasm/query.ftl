<#include "/layout/layout1.ftl">
<#assign css>

</#assign>
<#assign js>
<script>
    $(".btn-submit").click(function () {
        $.ajax({
            type: "POST",
            url: "${ctx!}/pasm/queryInfo",
            data: $(".form-edit").serialize(),
            dataType: "JSON",
            success: function (res) {
                layer.msg(res.message, {
                    time: 2000
                }, function () {
                    document.getElementById("td_id").innerHTML = res.id;
                    document.getElementById("td_applicationNo").innerHTML = res.applicationNo;
                    document.getElementById("td_name").innerHTML = res.name;
                    if(res.idCardType=="0"){
                        document.getElementById("td_idCardType").innerHTML = "身份证";
                    }else if(res.idCardType=="1"){
                        document.getElementById("td_idCardType").innerHTML = "户口簿";
                    }else if(res.idCardType=="2"){
                        document.getElementById("td_idCardType").innerHTML = "护照";
                    }else {
                        document.getElementById("td_idCardType").innerHTML = res.idCardType;
                    }
                    document.getElementById("td_idCardNo").innerHTML = res.idCardNo;
                    if(res.applicationRole=="A"){
                        document.getElementById("td_applicationRole").innerHTML ="申请人";
                    }else if(res.applicationRole=="B"){
                        document.getElementById("td_applicationRole").innerHTML ="共同申请人";
                    }else if(res.applicationRole=="C"){
                        document.getElementById("td_applicationRole").innerHTML ="担保人";
                    }else {
                        document.getElementById("td_applicationRole").innerHTML =res.applicationRole;
                    }
                    if(res.queryReason=="01"){
                        document.getElementById("td_queryReason").innerHTML = "贷后管理";
                    }else if(res.queryReason=="02"){
                        document.getElementById("td_queryReason").innerHTML = "贷款审批";
                    }else if(res.queryReason=="03"){
                        document.getElementById("td_queryReason").innerHTML = "信用卡审批";
                    }else if (res.queryReason=="05"){
                        document.getElementById("td_queryReason").innerHTML = "异议核查";
                    }else if(res.queryReason=="08"){
                        document.getElementById("td_queryReason").innerHTML = "担保资格审查";
                    }else if(res.queryReason=="16"){
                        document.getElementById("td_queryReason").innerHTML = "公积金提取复核";
                    }else if(res.queryReason=="19"){
                        document.getElementById("td_queryReason").innerHTML = "特约商户实名审查";
                    }else {
                        document.getElementById("td_queryReason").innerHTML = res.queryReason;
                    }
                    document.getElementById("td_phone").innerHTML = res.phone;
                    document.getElementById("td_queryTime").innerHTML = res.queryTime;
                    if (res.queryResult == "01") {
                        document.getElementById("td_queryResult").innerHTML = "通过";
                    } else if (res.queryResult == "03") {
                        document.getElementById("td_queryResult").innerHTML = "未通过";
                    } else if (res.queryResult == "02") {
                        document.getElementById("td_queryResult").innerHTML = "查询中";
                    } else {
                        document.getElementById("td_queryResult").innerHTML = "未知";
                    }
                    document.getElementById("td_branchId").innerHTML = res.branchId;
                });
            }
        });
    });

</script>
</#assign>
<@layout title="预授信条件查询" active="resource">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        预授信
        <small>输入key</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-cog"></i> 系统</a></li>
        <li><a href="#"><i class="fa fa-list-ul"></i> 预授信管理</a></li>
        <li class="active"><i class="fa fa-edit"></i> 预预信条件查询</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-10">
            <!-- Default box -->
            <div class="box  box-primary">
                <form class="form-horizontal form-edit" id="frm" method="post" action="${ctx!}/psam/queryInfo">
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 connametrol-label">请输入身份证号：</label>
                            <div class="col-sm-3">
                                <input id="idCardNo" name="idCardNo" class="form-control" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-default btn-back">返回</button>
                        <button type="button" class="btn btn-info pull-right btn-submit">点击查询</button>
                    </div>
                </form>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>申请编号</th>
                        <th>姓名</th>
                        <th>身份证类型</th>
                        <th>身份证号</th>
                        <th>申请人角色</th>
                        <th>查询原因</th>
                        <th>手机号码</th>
                        <th>查询时间</th>
                        <th>查询结果</th>
                        <th>门店ID</th>
                    </tr>

                    <tr>
                        <td id="td_id"></td>
                        <td id="td_applicationNo"></td>
                        <td id="td_name"></td>
                        <td id="td_idCardType"></td>
                        <td id="td_idCardNo"></td>
                        <td id="td_applicationRole"></td>
                        <td id="td_queryReason"></td>
                        <td id="td_phone"></td>
                        <td id="td_queryTime"></td>
                        <td id="td_queryResult"></td>
                        <td id="td_branchId"></td>
                    </tr>
                </table>
            </div>

            <!-- /.box -->
        </div>
    </div>
</section>
<!-- /.content -->
</@layout>