<#include "/layout/layout1.ftl">
<#import "/layout/macro.ftl" as macro>
<#assign css>
<style>
</style>
    </#assign>
    <#assign js>
<script>
    document.getElementById("p0").className="treeview active";
    document.getElementById("p2").className="active";
</script>
    </#assign>
<@layout title="预授信管理" active="resource">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        预授信结果列表
        <small>一切从这里开始</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-cog"></i> 系统</a></li>
        <li><a href="#"><i class="fa fa-list-ul"></i> 预授信管理</a></li>
        <li class="active"><i class="fa fa-table"></i> 预授信结果查询</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="box box-primary">
        <div class="box-header">
            <a class="btn btn-sm btn-success" href="/pasm/query.ftl">个人查询</a>
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
                <#list pageInfo.content as clientqueryInfo>
                <tr>
                    <td>${clientqueryInfo.id}</td>
                    <td>${clientqueryInfo.applicationNo}</td>
                    <td>${clientqueryInfo.name}</td>
                    <td>${clientqueryInfo.idCardType}</td>
                    <td>${clientqueryInfo.idCardNo}</td>
                    <td>${clientqueryInfo.applicationRole}</td>
                    <td>${clientqueryInfo.queryReason}</td>
                    <td>${clientqueryInfo.phone}</td>
                    <td>${clientqueryInfo.queryTime}</td>
                    <td>
                        <#if clientqueryInfo.queryResult == "01">
                            <span class="label label-info">通过</span>
                        <#elseif clientqueryInfo.queryResult == "02">
                            <span class="label label-danger">查询中</span>
                        <#elseif clientqueryInfo.queryResult == "03">
                            <span class="label label-danger">未通过</span>
                        <#else >
                            <span class="label label-warning">未知</span>
                        </#if>
                    </td>
                    <td>${clientqueryInfo.branchId}</td>
                </tr>
                </#list>
            </table>
            </div>
            <div class="box-footer clearfix">
            <@macro.page pageInfo=pageInfo url="${ctx!}/pasm/history?" />
            </div>
        </div>
    <!-- /.box -->
</section>
<!-- /.content -->
</@layout>