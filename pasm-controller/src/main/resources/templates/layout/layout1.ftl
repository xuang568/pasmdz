<#macro layout title="" active="">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PASMDZ- ${title!}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${ctx!}/assets/plugins/bootstarp/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${ctx!}/assets/plugins/font-awesome/css/font-awesome.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${ctx!}/assets/plugins/Ionicons/css/ionicons.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${ctx!}/assets/css/AdminLTE.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${ctx!}/assets/css/_all-skins.css">
    <!-- layer -->
    <link rel="stylesheet" href="${ctx!}/assets/plugins/layer/theme/default/layer.css">
    ${css!}

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="${ctx!}/assets/plugins/google/css.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="../../index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>dmin</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>东正汽车金融</b>admin</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="<@shiro.principal property="avatar"/>" class="user-image" alt="User Image">
                            <span class="hidden-xs"><@shiro.principal property="nickName"/></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="<@shiro.principal property="avatar"/>" class="img-circle" alt="User Image">

                                <p>
                              <@shiro.principal property="description"/>
                                    <small><@shiro.principal property="createTime"/></small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="${ctx!}/user/updatePwd" class="btn btn-default btn-flat">Change pass</a>
                                </div>
                                <div class="pull-right">
                                    <a href="${ctx!}/logout" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<@shiro.principal property="avatar"/>" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><@shiro.principal property="nickName"/></p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li <#if active = "home">class="active" </#if>><a href="${ctx!}/index"><i class="fa fa-home"></i> <span>主页</span></a>
                </li>
                <li id="s0" class="treeview">
                    <a href="#">
                        <i class="fa fa-cog"></i> <span>系统管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
            <@shiro.hasPermission name="system:user:index">
                <li id="s1"><a href="${ctx!}/user/index"><i class="fa fa-user-o"></i>
                    用户管理</a></li>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="system:role:index">
                <li id="s2"><a href="${ctx!}/role/index"><i
                        class="fa fa-user-circle-o"></i> 角色管理</a></li>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="system:resource:index">
                <li id="s3"><a href="${ctx!}/resource/index"><i
                        class="fa fa-file-o"></i> 资源管理</a></li>
            </@shiro.hasPermission>
                    </ul>
                </li>

                <!-- sidebar menu: : 预授信管理 -->
                <li id="p0" class="treeview">
                    <a href="#">
                        <i class="fa fa-cog"></i> <span>预授信管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
            <@shiro.hasPermission name="system:pasm:index">
                <li id="p1"><a href="/pasm/index.ftl"><i class="fa fa-user-o"></i>
                    首次查询</a></li>
            </@shiro.hasPermission>

            <@shiro.hasPermission name="system:pasm:history">
                <li id="p2"><a href="${ctx!}/pasm/history"><i class="fa fa-user-o"></i>
                    结果查询</a></li>

            </@shiro.hasPermission>
                    </ul>
                </li>

                <!-- sidebar menu: :预授信统计管理 -->
                <li id="c0" class="treeview">
                    <a href="#">
                        <i class="fa fa-cog"></i><span>数据统计</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
            <@shiro.hasPermission name="system:count:index">
                <li id="c1"><a href="${ctx!}/count/index"><i class="fa fa-user-o"></i>预授信统计</a></li>
            </@shiro.hasPermission>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <#nested >
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2018 <a>pasmdz</a>.</strong> All rights
        reserved.
    </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${ctx!}/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${ctx!}/assets/plugins/bootstarp/js/bootstrap.js"></script>
<!-- FastClick -->
<script src="${ctx!}/assets/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${ctx!}/assets/js/adminlte.js"></script>
<!-- layer -->
<script src="${ctx!}/assets/plugins/layer/layer.js"></script>
<script>
    $(document).ready(function () {
        $('.sidebar-menu').tree();
        $(".btn-back").click(function () {
            window.history.back();
        });
    })
</script>
    ${js!}
</body>
</html>
</#macro>