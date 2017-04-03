<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="${'http://'.concat(pageContext.request.serverName).concat(':').concat(pageContext.request.serverPort).concat(pageContext.request.contextPath)}/">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><sitemesh:write property='title' /> - 上海总控管理系统</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="s/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="theme/default/css/style.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="s/html5shiv/html5.min.js"></script>
    <script src="s/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="s/jquery/1.11.3/jquery.min.js"></script>
    <sitemesh:write property='head' />
</head>

<body>
<nav class="navbar navbar-default" role="navigation" id="topbar">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">上海总控管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user large"></span> 超级管理员</a></li>
                <li><a href="msg/msg-info-listReceived.do"><span class="glyphicon glyphicon-envelope large"></span><span class="badge">4</span> 系统公告</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-bell large"></span><span class="badge">12</span> 告警处理</a></li>
                <li><a href="user/my-change-password-input.do"><span class="glyphicon glyphicon-edit"></span> 修改密码</a></li>
                <li><a href="j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span> 安全退出</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div class="row" id="menu">
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1 col-md-1" id="sidebar">
            <div class="row" id="submenu"></div>
        </div>
        <div class="col-sm-11 col-md-11" id="content">
            <sitemesh:write property='body' />
        </div>
    </div>
</div>

<div id="footer" class="well text-center">
    <a href="#">上海市教育委员会</a>
    <a href="#">上海市电化教育馆</a>
    版权所有
    <span>网站备案/许可证号：沪ICP备00000000号-0</span>
</div>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<div class="modal fade" id="devaeye-modal" tabindex="-1" role="dialog" aria-labelledby="devaeye-modal-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="devaeye-modal-label">Modal title</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<script src="s/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="theme/default/js/common.js"></script>
<script src="theme/default/js/devaeye.table.js"></script>
</body>
</html>