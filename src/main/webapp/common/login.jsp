<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="">
  <title>门户</title>

  <!-- Bootstrap -->
  <link href="${ctx}/s/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #eee;
      font: 12px/16px arial, "Microsoft Yahei", 微软雅黑;
    }

    .form-signin {
      max-width: 330px;
      padding: 15px;
      margin: 0 auto;
    }

    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }

    .form-signin .checkbox {
      font-weight: normal;
    }

    .form-signin .form-control {
      position: relative;
      height: auto;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      padding: 10px;
      font-size: 16px;
    }

    .form-signin .form-control:focus {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
    .form-wrapper {
      background-color: rgba(0, 102, 204, 1);
    }
    .top h1 {
      font-size: 2em;
      font-weight: bold;
      margin-top: 1.8em;
      margin-bottom: 0.5em;
    }
    .top p{
      font-size: 1.5em;
      color: rgb(134, 134, 134);
    }
    .top .right {
      margin-top: 7em;
      text-align: right;
    }
    .form-wrapper {
      padding-top: 5em;
      padding-bottom: 5em;
    }
    .form-wrapper .div-login {
      background-color: rgba(229, 229, 229, 1);
      height: 244px;
      border-radius: 5px;
    }
    .form-wrapper .form-signin-heading {
      color: #0066CC;
      text-align: center;
      font-size: 1.5em;
      font-weight: bold;
    }
    .form-wrapper .control-label {
      font-size: 1.1em;
      line-height: 20px;
      padding-right: 0;
    }
    #footer {
      color: #004C8A;
      border-radius: 0;
    }

    #footer a {
      color: #004C8A;
    }

    #footer span {
      margin-left: 2em;
    }
  </style>
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="${ctx}/s/html5shiv/html5.min.js"></script>
  <script src="${ctx}/s/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<div class="container top">
  <div class="row">
    <div class="col-sm-4 col-sm-offset-2 col-md-4 col-md-offset-2">
      <h1>上海总控管理系统</h1>
      <p>Shanghai Total Control System</p>
    </div>
    <div class="col-sm-4 col-md-4 right">
      <a href="#">使用帮助 <span class="glyphicon glyphicon-save"></span></a>
    </div>
  </div>
</div>
<div class="container-fluid form-wrapper">
  <div class="row">
    <div class="col-sm-4 col-sm-offset-2 col-md-4 col-md-offset-2">
      <img src="${ctx}/theme/default/images/login-image.png"/>
    </div>
    <div class="col-sm-4 col-md-4 div-login">
      <form class="form-horizontal" method="post" role="form" action="${tenantPrefix}/j_spring_security_check">
        <h2 class="form-signin-heading">用户登录</h2>
        <hr>
        <div class="form-group">
          <label for="username" class="col-sm-3 control-label">用&nbsp;户&nbsp;名</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="username" name="j_username" placeholder="请输入用户名">
          </div>
        </div>
        <div class="form-group">
          <label for="password" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
          <div class="col-sm-8">
            <input type="password" class="form-control" id="password" name="j_password" placeholder="请输入密码">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-10 col-sm-offset-1">
            <button class="btn btn-md btn-primary btn-block" type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div> <!-- /container -->
<div id="footer" class="well text-center">
  <a href="#">上海市教育委员会</a>
  <a href="#">上海市电化教育馆</a>
  版权所有
  <span>网站备案/许可证号：沪ICP备00000000号-0</span>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/s/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${ctx}/s/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>