<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工单管理</title>
</head>
<body>
<div class="page-header">
    <h3><span class="glyphicon glyphicon-th-large"></span> 工单管理</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
    <div class="col-sm-12 col-md-12">
        <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
            <div class="input-group input-group-sm">
                <span class="input-group-addon">项目</span>
                <select type="text" class="form-control" id="sysCode">
                    <option value=""></option>
                    <option value="1">招生系统</option>
                    <option value="2">学籍系统</option>
                </select>
            </div>
            <div class="input-group input-group-sm">
                <span class="input-group-addon">服务记录单号</span>
                <input type="text" class="form-control" id="no"/>
            </div>
            <div class="input-group input-group-sm">
                <span class="input-group-addon">工单问题</span>
                <input type="text" class="form-control" id="title"/>
            </div>
            <div class="input-group input-group-sm">
                <span class="input-group-addon">工单类型</span>
                <select type="text" class="form-control" id="type">
                    <option value=""></option>
                    <option value="1">bug</option>
                    <option value="2">数据处理</option>
                    <option value="3">网元告警</option>
                    <option value="4">客服问题</option>
                    <option value="5">无问题</option>
                </select>
            </div>
            <div class="input-group input-group-sm">
                <span class="input-group-addon">节点状态</span>
                <select type="text" class="form-control" id="status">
                    <option value=""></option>
                    <option value="1">审核中</option>
                    <option value="2">通过审核</option>
                    <option value="3">已撤销</option>
                    <option value="4">执行中</option>
                    <option value="5">已完成</option>
                </select>
            </div>
            <div class="input-group input-group-sm">
                <button type="button" class="btn btn-sm btn-primary" onclick="query()">查询</button>
            </div>
        </form>
        <div id="table" class="devaeye-table-wrapper">
            <div class="table-responsive devaeye-table">
                <table class="table table-hover table-bordered table-striped no-margin-bottom">
                    <thead>
                    <tr class="info">
                        <th>No</th>
                        <th>工单问题</th>
                        <th>服务记录单号</th>
                        <th>工单类型</th>
                        <th>工单当前节点</th>
                        <th>节点状态</th>
                        <th>最后处置人</th>
                        <th>最后处置时间</th>
                        <th>优先级</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <%@ include file="../../theme/default/views/devaeye-table-footer.jsp" %>
        </div>
    </div>

    <div id="order-type-form" class="hidden">
        <form class="form-horizontal">
            <div class="form-group col-sm-12">
                <label class="col-sm-4 control-label">请选择工单：</label>
                <div class="col-sm-8">
                    <select class="form-control" id="order-type">
                        <option value="0">请假工单</option>
                        <option value="1">故障处理工单</option>
                    </select>
                </div>
            </div>
        </form>
    </div>

    <div id="gather-source-form" class="hidden">
        <form class="form-horizontal">

            <div class="panel panel-primary">
                <div class="panel-heading">发起流程</div>
                <div class="panel-body">
                    <div class="form-group col-sm-5">
                        <label class="col-sm-4 control-label">流程下一步：</label>
                        <div class="col-sm-1">
                            <p class="control-label">送</p>
                        </div>
                        <div class="col-sm-7">
                            <select class="form-control">
                                <option>总控管理系统</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group  col-sm-7">
                        <label class="col-sm-4 control-label">综合运维管理组：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="name" required>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>提交
                        </button>
                        <%--<button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>存草稿
                        </button>--%>
                        <button class="btn btn-primary" type="button" onclick="$('#devaeye-table-modal').modal('hide');">取消</button>
                    </div>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">流程内容</div>
                <div class="panel-body well">
                    <h4 class="row text-center">工单问题记录</h4><hr/>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">项目名称：</label>
                        <div class="col-sm-8">
                            <select class="form-control">
                                <option>总控管理系统</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">问题来源：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="sourceCode">
                                <option></option>
                                <option value="1">运维告警</option>
                                <option value="2">监控告警</option>
                                <option value="3">客服</option>
                                <option value="4">投诉</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">服务记录单号：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="no">
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">优先级：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="priority">
                                <option></option>
                                <option value="1">一般</option>
                                <option value="2">中</option>
                                <option value="3">高</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">问题类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="type">
                                <option></option>
                                <option value="1">硬件网络</option>
                                <option value="2">软件</option>
                                <option value="3">业务</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">用户类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="userType">
                                <option></option>
                                <option value="1">总控领导</option>
                                <option value="2">监控管理员</option>
                                <option value="3">客服人员</option>
                                <option value="4">运维人员</option>
                                <option value="5">资产管理员</option>
                                <option value="6">区县管理员</option>
                                <option value="7">公办小学招生</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">用户姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userName">
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">所在部门：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="userDept">
                                <option></option>
                                <option value="1">监控部门</option>
                                <option value="2">硬件运维部门</option>
                                <option value="3">软件运维部门</option>
                                <option value="4">客服部门</option>
                                <option value="5">资产管理部门</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">联系电话：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userTel">
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">电子邮件：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userEmail">
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-2 control-label">工单问题：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title">
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-2 control-label">问题描述：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="description">
                        </div>
                    </div>
                </div>
                <div class="well">

                    <h4 class="row text-center">问题处理过程</h4>
                    <hr>
                </div>
            </div>


            <input type="hidden" name="id">
        </form>
    </div>


    <div id="view-order-model" class="hidden">
        <form class="form-horizontal">

            <div class="panel panel-primary">
                <div class="panel-body">
                    总控管理系统工单流程 &nbsp;&nbsp;&nbsp;
                    <span id="view_no"></span>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">流程内容</div>
                <div class="panel-body well">
                    <h4 class="row text-center">工单问题记录</h4><hr/>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">项目名称：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="sysCode">
                                <option value="1">总控管理系统</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">问题来源：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="sourceCode">
                                <option></option>
                                <option value="1">运维告警</option>
                                <option value="2">监控告警</option>
                                <option value="3">客服</option>
                                <option value="4">投诉</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">服务记录单号：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="no">
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">优先级：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="priority">
                                <option></option>
                                <option value="1">一般</option>
                                <option value="2">中</option>
                                <option value="3">高</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">问题类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="type">
                                <option></option>
                                <option value="1">硬件网络</option>
                                <option value="2">软件</option>
                                <option value="3">业务</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">用户类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="userType">
                                <option></option>
                                <option value="1">总控领导</option>
                                <option value="2">监控管理员</option>
                                <option value="3">客服人员</option>
                                <option value="4">运维人员</option>
                                <option value="5">资产管理员</option>
                                <option value="6">区县管理员</option>
                                <option value="7">公办小学招生</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">用户姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userName">
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">所在部门：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="userDept">
                                <option></option>
                                <option value="1">监控部门</option>
                                <option value="2">硬件运维部门</option>
                                <option value="3">软件运维部门</option>
                                <option value="4">客服部门</option>
                                <option value="5">资产管理部门</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">联系电话：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userTel">
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">电子邮件：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userEmail">
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-2 control-label">工单问题：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title">
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-2 control-label">问题描述：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="description">
                        </div>
                    </div>
                </div>
                <div class="well">
                    <h4 class="row text-center">问题处理过程</h4>
                    <hr>
                </div>
            </div>


            <input type="hidden" name="id">
        </form>
    </div>
    <script>

        var orderType = "";
        $(function () {
            load();
        });
        function load() {
            $('#table').table({
                url: 'work/order/page.do',
                data: {pageSize: 10},
                columns: [{}, {
                    field: 'title'
                }, {
                    field: 'no'
                }, {
                    field: 'type',
                    format: function(column, row) {
                        if(row.type == 1){
                           return "硬件网络";
                        }else if(row.type == 2){
                            return "软件";
                        }else if(row.type == 3){
                            return "业务";
                        }
                        return "";
                    }
                }, {
                    field: 'currentNode'
                }, {
                    field: 'currentNodeStatus'
                }, {
                    field: 'lastOperatorName'
                }, {
                    field: 'lastOperatedTime'
                },{
                    field: 'priority',
                    format: function(column, row) {
                        if(row.priority == 1){
                            return "一般";
                        }else if(row.priority == 2){
                            return "中";
                        }else if(row.priority == 3){
                            return "高";
                        }
                        return "";
                    }
                },  {
                    field: 'id',
                    align: 'center',
                    format: function (column, row) {
                        return '<button type="button" class="btn btn-xs btn-primary" onclick="toView(' + column + ')">查看</i></button> ' +
                            '<button type="button" class="btn btn-xs btn-info" onclick="trake(' + column + ')">追踪</button> ' +
                            '<button type="button" class="btn btn-xs btn-danger" onclick="cancel(' + column + ')">撤销</button> ';
                    }
                }],
                add: function () {
                    $('#devaeye-table-modal').showModal({
                        title: '选择工单',
                        content: $('#order-type-form').html(),
                        contentInit: function () {
                            var form = $('form', '#devaeye-table-modal');
                            form[0].reset();
                        },
                        buttons: [{
                            text: '确定',
                            class: 'btn btn-primary',
                            click: function () {
                                if (formCheck($('form', '#devaeye-table-modal'))) {
                                    orderType = $("#order-type").val();
                                    toAdd();
                                }
                            }
                        }]
                    });
                }
            });
        }

        function toAdd() {
            $('#devaeye-table-modal').showModal({
                title: '工单创建',
                width: '1000',
                content: $('#gather-source-form').html(),
                buttons: [{
                    text: '提交',
                    class: 'btn btn-primary',
                    click: function () {
                        if (formCheck($('form', '#devaeye-table-modal'))) {
                            $.post('alarm/target/modify.do', $('form', '#devaeye-table-modal').serialize(), function (data) {
                                $('#table').trigger('reload');
                                alert(data.message);
                                $('#devaeye-table-modal').modal('hide');
                            });
                        }
                    }
                }]
            });
        }

        function cancel(id) {
            if (confirm('确定撤销？')) {
                $.post('work/order/status/change.do', {id: id, status: 3}, function (data) {
                    $('#table').trigger('reload');
                    alert(data.message);
                });
            }
        }
        function toModify(id) {
            $('#devaeye-table-modal').showModal({
                title: '修改工单',
                content: $('#gather-source-form').html(),
                contentInit: function () {
                    var form = $('form', '#devaeye-table-modal');
                    form[0].reset();
                    $.post('alarm/target/get.do', {id: id}, function (data) {
                        $('input[name="id"]', form).val(data.id);
                        $('input[name="name"]', form).val(data.name);
                        $('textarea[name="sql"]', form).val(data.sql);
                    });
                },
                buttons: [{
                    text: '提交',
                    class: 'btn btn-primary',
                    click: function () {
                        if (formCheck($('form', '#devaeye-table-modal'))) {
                            $.post('alarm/target/modify.do', $('form', '#devaeye-table-modal').serialize(), function (data) {
                                $('#table').trigger('reload');
                                alert(data.message);
                                $('#devaeye-table-modal').modal('hide');
                            });
                        }
                    }
                }]
            });
        }

        function toView(id) {
            $('#devaeye-table-modal').showModal({
                title: '查看工单',
                width: '1000',
                content: $('#view-order-model').html(),
                contentInit: function () {
                    var form = $('form', '#devaeye-table-modal');
                    form[0].reset();
                    $.post('work/order/get.do', {id: id}, function (data) {
                        $('#view_no').text(data.no);
                        $('select[name="sysCode"]', form).val(data.sysCode);
                        $('select[name="sourceCode"]', form).val(data.sourceCode);
                        $('input[name="no"]', form).val(data.no);
                        $('select[name="priority"]', form).val(data.priority);
                        $('select[name="type"]', form).val(data.type);
                        $('select[name="userType"]', form).val(data.userType);
                        $('input[name="userName"]', form).val(data.userName);
                        $('select[name="userDept"]', form).val(data.userDept);
                        $('input [name="userTel"]', form).val(data.userTel);
                        $('input [name="userEmail"]', form).val(data.userEmail);
                        $('input[name="title"]', form).val(data.title);
                        $('input[name="description"]', form).val(data.description);
                    });
                },
                buttons: [{
                    text: '关闭',
                    class: 'btn btn-primary',
                    click: function () {
                        $('#devaeye-table-modal').modal('hide');
                    }
                }]
            });
        }


        function query() {
            var form = '#form-query';
            var sysCode = $('#sysCode', form).val();
            var no = $('#no', form).val();
            var title = $('#title', form).val();
            var type = $('#type', form).val();
            var status = $('#status', form).val();
            $('#table').trigger('query', {filter_LIKES_title: title, filter_EQI_sysCode: sysCode, filter_LIKES_no: no, filter_EQI_type: type, filter_EQI_status: status});
        }

    </script>
</div>
</body>
</html>
