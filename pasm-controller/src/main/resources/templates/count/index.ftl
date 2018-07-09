<#include "/layout/layout1.ftl">
<#assign css>
<style>
</style>
</#assign>
<#assign js>
<script>
    document.getElementById("c0").className="treeview active";
    document.getElementById("c1").className="active";
</script>
</#assign>
<@layout title="统计查询" active="resource">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        预预授信统计查询
        <small>一切从这里开始</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-cog"></i> 系统</a></li>
        <li><a href="#"><i class="fa fa-list-ul"></i> 预授信统计管理</a></li>
        <li class="active"><i class="fa fa-table"></i>预授信统计查询</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-10">
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
                        <th>总数</th>
                        <th>通过人数</th>
                        <th>未通过人数</th>
                        <th>查询中人数</th>
                        <th>通过率</th>
                    </tr>

                    <tr>
                        <td id="td_id">${count.total}</td>
                        <td id="td_name">${count.success}</td>
                        <td id="td_card">${count.fail}</td>
                        <td id="td_phone">${count.querying}</td>
                        <td id="td_queryTime">${count.rate}</td>
                    </tr>
                </table>
            </div>

            <!-- /.box -->
        </div>
    </div>
</section>
<!-- /.content -->
</@layout>