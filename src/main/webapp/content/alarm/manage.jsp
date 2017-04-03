<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/taglibs.jsp" %>
<html>
<head>
    <title>告警管理</title>
    <link rel="stylesheet" href="s/ztree/zTreeStyle/zTreeStyle.css">
    <style>
        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle;
        }

        .alarm-steps > div {
            float: left;
        }

        .alarm-steps > div.step {
            width: 30%;
        }

        .alarm-steps > div.step .info {
            padding: 10px;
            height: 10em;
            margin-bottom: 5px;
        }

        .alarm-steps > div.split {
            width: 5%;
            text-align: center;
            margin-top: 2.8em;
            font-size: 1.5em;
            color: #0044cc;
        }

        .alarm-steps .text {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="page-header">
    <h3><span class="glyphicon glyphicon-th-large"></span> 告警管理</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
    <div class="col-sm-3 col-md-3">
        <div style="border: 1px solid #cccccc; border-radius: 5px; width: 98%; background-color: rgba(241, 244, 248, 1);">
            <ul id="tree-ne" class="ztree"></ul>
            <input type="hidden" id="neId">
            <input type="hidden" id="path">
        </div>
    </div>
    <div class="col-sm-9 col-md-9" style="border: 1px solid #cccccc; border-radius: 5px; padding-top:2em;">
        <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
            <div class="input-group input-group-sm">
                <span class="input-group-addon">告警级别</span>
                <select type="text" class="form-control" id="alarmLevel">
                    <option value=""></option>
                    <c:forEach items="${leveldict}" var="level">
                        <option value="${level.key}">${level.value}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-group input-group-sm">
                <span class="input-group-addon">告警名称</span>
                <input type="text" class="form-control" id="alarmName">
            </div>

            <div class="input-group input-group-sm">
                <span class="input-group-addon">告警指标对象</span>
                <select type="text" class="form-control" id="alarmTarget">
                    <option value=""></option>
                    <c:forEach items="${targets}" var="target">
                        <option value="${target.id}">${target.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-group input-group-sm">
                <span class="input-group-addon">告警状态</span>
                <select type="text" class="form-control" id="alarmStatus">
                    <option value=""></option>
                    <c:forEach items="${statusDict}" var="status">
                        <option value="${status.key}">${status.value}</option>
                    </c:forEach>
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
                        <th>级别</th>
                        <th>名称</th>
                        <th>告警指标对象</th>
                        <th>频次</th>
                        <th>告警时间（初次）<%--<a href="javascript:void(0)" onclick="query('firstTime')" style="color: #0044cc;"><span class="glyphicon glyphicon-resize-vertical"></span></a>--%></th>
                        <th>告警时间（最新）<%--<a href="javascript:void(0)" onclick="query('lastTime')" style="color: #0044cc;"><span class="glyphicon glyphicon-resize-vertical"></span></a>--%></th>
                        <th>状态</th>
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
</div>

<div id="gather-source-form" class="hidden">
    <form class="form-horizontal">
        <div class="well">
            <div class="form-group">
                <label class="col-sm-3 control-label">定位信息：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="path" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警源：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmSource" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警名称：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmName" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警描述：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmComments" readonly>
                </div>
            </div>
        </div>

        <div class="well">
            <div class="form-group">
                <label class="col-sm-3 control-label">告警处理：</label>
                <div class="col-sm-9">
                    <input type="radio" checked readonly> 确认
                </div>
            </div>
            <div class="form-group alarm-steps">
                <div class="step">
                    <div class="thumbnail info">
                        <p><b>系统</b></p>
                        <p id="confirm_first_time"></p>
                        <p>符合告警规则，首次产生告警</p>
                    </div>
                    <div class="text">初始告警</div>
                </div>
                <div class="split"><span class="glyphicon glyphicon-arrow-right"></span></div>
                <div class="step">
                    <div class="thumbnail info">

                    </div>
                    <div class="text">手动确认</div>
                </div>
                <div class="split"><span class="glyphicon glyphicon-arrow-right"></span></div>
                <div class="step">
                    <div class="thumbnail info">

                    </div>
                    <div class="text">已清除</div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">当前状态：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="status" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警时间 初次：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="firstTime" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警时间 最新：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="lastTime" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警次数：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="frequency" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">短信接收人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="smsReceviers" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">邮件接收人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="emailReceviers" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警级别 原始：</label>
                <div class="col-sm-9">
                    <button type="button" class="btn btn-danger" disabled>紧急</button>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警级别 升级后：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="levels" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警规则：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="threshold" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警依据：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="threshold1" readonly>
                </div>
            </div>
        </div>

        <input type="hidden" name="id">
    </form>
</div>
<div id="gather-source-form1" class="hidden">
    <form class="form-horizontal">
        <div class="well">
            <div class="form-group">
                <label class="col-sm-3 control-label">定位信息：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="path" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警源：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmSource" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警名称：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmName" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警描述：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmComments" readonly>
                </div>
            </div>
        </div>

        <div class="col-sm-6 well">
            <div class="form-group alarm-steps">
                <div class="step">
                    <div class="thumbnail info">
                        <p><b>系统</b></p>
                        <p><p id="clean_first_time"></p></p>
                        <p>符合告警规则，首次产生告警</p>
                    </div>
                    <div class="text">初始告警</div>
                </div>
                <div class="split"><span class="glyphicon glyphicon-arrow-right"></span></div>
                <div class="step">
                    <div class="thumbnail info">
                        <p><b>系统</b></p>
                        <p><p id="clean_confirm_time"></p></p>
                        <p>手动告警确认</p>
                    </div>
                    <div class="text"><span class="glyphicon glyphicon-ok text-success" aria-hidden="true"></span>手动确认</div>
                </div>
                <div class="split"><span class="glyphicon glyphicon-arrow-right"></span></div>
                <div class="step">
                    <div class="thumbnail info">

                    </div>
                    <div class="text">已清除</div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">当前状态：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="status" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警时间 初次：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="firstTime" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警时间 最新：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="lastTime" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警次数：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="frequency" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">短信接收人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="smsReceviers" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">邮件接收人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="emailReceviers" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警级别 原始：</label>
                <div class="col-sm-9">
                    <button type="button" class="btn btn-danger" disabled>紧急</button>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警级别 升级后：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="levels" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警规则：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="threshold" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警依据：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="threshold1" readonly>
                </div>
            </div>
        </div>

        <div class="col-sm-6 well">
            <div class="form-group">
                <label class="col-sm-3 control-label">告警处理：</label>
                <div class="col-sm-9">
                    <input type="radio" checked readonly> 清除
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警处理：</label>
                <div class="col-sm-9">
                    <select type="text" class="form-control" name="reasonType">
                        <option value="0"></option>
                        <option value="1">数据异常</option>
                        <option value="2">进程异常</option>
                        <option value="3">应用程序异常</option>
                        <option value="4">硬件故障</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">操作原因：</label>
                <div class="col-sm-9 well">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">原因分析：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="causes"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">查证脚本：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="checkSql"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">处理总结：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="summary"></textarea>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <input type="hidden" name="id">
    </form>
</div>
<div id="gather-source-form2" class="hidden">
    <form class="form-horizontal">
        <div class="well">
            <div class="form-group">
                <label class="col-sm-3 control-label">定位信息：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="path" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警源：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmSource" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警名称：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmName" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警描述：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="alarmComments" readonly>
                </div>
            </div>
        </div>

        <div class="col-sm-6 well">
            <div class="form-group alarm-steps">
                <div class="step">
                    <div class="thumbnail info">
                        <p><b>系统</b></p>
                        <p><p id="view_first_time"></p></p>
                        <p>符合告警规则，首次产生告警</p>
                    </div>
                    <div class="text">初始告警</div>
                </div>
                <div class="split"><span class="glyphicon glyphicon-arrow-right"></span></div>
                <div class="step">
                    <div class="thumbnail info">
                        <p><b>系统</b></p>
                        <p><p id="view_confirm_time"></p></p>
                        <p>手动告警确认</p>
                    </div>
                    <div class="text">手动确认</div>
                </div>
                <div class="split"><span class="glyphicon glyphicon-arrow-right"></span></div>
                <div class="step">
                    <div class="thumbnail info">

                    </div>
                    <div class="text">已清除</div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">当前状态：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="status" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警时间 初次：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="firstTime" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警时间 最新：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="lastTime" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警次数：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="frequency" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">短信接收人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="smsReceviers" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">邮件接收人：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="emailReceviers" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">告警级别 原始：</label>
                <div class="col-sm-9">
                    <button type="button" class="btn btn-danger" disabled>紧急</button>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警级别 升级后：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="levels" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警规则：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="threshold" readonly>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">告警依据：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="threshold1" readonly>
                </div>
            </div>
        </div>

        <div class="col-sm-6 well">
            <div class="form-group">
                <label class="col-sm-3 control-label">告警处理：</label>
                <div class="col-sm-9">
                    <select type="text" class="form-control" name="reasonType" readonly>
                        <option value="0"></option>
                        <option value="1">数据异常</option>
                        <option value="2">进程异常</option>
                        <option value="3">应用程序异常</option>
                        <option value="4">硬件故障</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">操作原因：</label>
                <div class="col-sm-9 well">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">原因分析：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="causes" readonly></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">查证脚本：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="checkSql" readonly></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">处理总结：</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="summary" readonly></textarea>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <input type="hidden" name="id">
    </form>
</div>
<script src="s/ztree/jquery.ztree.all.min.js"></script>
<script>

    var alarmCount = {
    <c:forEach items="${counts}" var="count">
    ${count.key}:${count.value},
    </c:forEach>
    };

    var setting = {
        view: {
            selectedMulti: false,
            nameIsHTML: true
        },
        data: {
            simpleData: {
                pIdKey: "parentId",
                enable: true
            }
        },
        callback: {
            onClick: onClick
        }
    };

    function onClick(event, treeId, treeNode) {
        getNeInfo(treeNode);
    }


    $(function () {
        $.get('ne/tree.do', function (data) {
            var mytree = $.fn.zTree.init($("#tree-ne"), setting, data);
            mytree.expandAll(true);

            for(var id in alarmCount) {
                var count = alarmCount[id];
                var node = mytree.getNodeByParam("id", id, null);
                //var tId = node.tId;
                //$('#'+tId+"_span", '#'+tId).html(node.name + '<span class="badge" style="background-color: #ff0000; color: white">'+count+'</span>');
                node.name = node.name + '<span class="badge" style="background-color: #ff0000; color: white">' + count + '</span>';
                mytree.updateNode(node);
            }
        });
       /* $.get('ne/tree.do', function (data) {
            console.log(data);
            $.fn.zTree.init($("#tree-ne"), setting, data).expandAll(true);
        });*/
    });

    function getNeInfo(treeNode) {
        $.post('ne/node.do', {id: treeNode.id}, function (data) {
            $('#path').val(data.path + "/" + data.name);
            $('#neId').val(data.id);
            query();
        });
    }
</script>
<script>
    var statusDict = {
    <c:forEach items="${statusDict}" var="status">
    ${status.key}:'${status.value}',
    </c:forEach>
    };
    var levelsDict = {
    <c:forEach items="${leveldict}" var="level">
    ${level.key}:'${level.value}',
    </c:forEach>
    };

    $(function () {
        load();
    });
    function load() {
        $('#table').table({
            url: 'alarm/manage/page.do',
            data: {pageSize: 10},
            add: false,
            columns: [{}, {
                field: 'levels',
                format: function (column, row) {
                    var l = levelsDict[row.levels];
                    if (l) {
                        return l;
                    } else {
                        return '';
                    }
                }
            }, {
                field: 'name',
                format: function (column, row) {
                    return row.config.name;
                }
            }, {
                field: 'targetName',
                format: function (column, row) {
                    return row.config.alarmTarget.name;
                }
            }, {
                field: 'frequency'
            }, {
                field: 'firstTime'
            }, {
                field: 'lastTime'
            }, {
                field: 'status',
                format: function (column, row) {
                    return statusDict[row.status];
                }
            }, {
                field: 'id',
                align: 'center',
                format: function (column, row) {
                    var ret = "";
                    if (row.status < 3) {
                        ret = '<button type="button" class="btn btn-xs btn-primary" onclick="confirm(' + column + ')">确认</button><button type="button" class="btn btn-xs btn-danger" onclick="clean(' + column + ')" disabled>清除</button>';
                    }else if (row.status == 3) {
                        ret = '<button type="button" class="btn btn-xs btn-primary" onclick="confirm(' + column + ')" disabled>确认</button><button type="button" class="btn btn-xs btn-danger" onclick="clean(' + column + ')">清除</button>';
                    }else{
                        ret = '<button type="button" class="btn btn-xs btn-primary" onclick="confirm(' + column + ')" disabled>确认</button><button type="button" class="btn btn-xs btn-danger" onclick="clean(' + column + ')" disabled>清除</button>';
                    }


                    ret = ret + '<button type="button" class="btn btn-xs btn-info" onclick="view(' + column + ')">查看</button>';
                    return ret;
                }
            }]
        });
    }
    function confirm(id) {
        $('#devaeye-table-modal').showModal({
                title: '告警执行',
                content: $('#gather-source-form').html(),
                contentInit: function () {
                    var form = $('form', '#devaeye-table-modal');
                    form[0].reset();
                    $.post('alarm/manage/get.do', {id: id}, function (data) {
                        $('input[name="id"]', form).val(data.id);
                        $('input[name="path"]', form).val(data.config.path);
                        $('input[name="alarmSource"]', form).val(data.config.alarmTarget.name);
                        $('input[name="alarmName"]', form).val(data.config.name);
                        $('input[name="alarmComments"]', form).val(data.config.comments);
                        $('input[name="status"]', form).val(statusDict[data.status]);
                        $('input[name="firstTime"]', form).val(data.firstTime);
                        $('#confirm_first_time').text(data.firstTime);
                        $('input[name="lastTime"]', form).val(data.lastTime);
                        $('input[name="frequency"]', form).val(data.frequency);
                        $('input[name="smsReceviers"]', form).val(data.config.smsReceviers);
                        $('input[name="emailReceviers"]', form).val(data.config.emailReceviers);
                        $('input[name="levels"]', form).val(levelsDict[data.levels]);
                        $('input[name="threshold"]', form).val(data.config.threshold);
                        $('input[name="threshold1"]', form).val("=" + data.result);
                    });
                },
                buttons: [{
                    text: '提交工单',
                    class: 'btn btn-primary',
                    click: function () {
                    }
                }, {
                    text: '确认',
                    class: 'btn btn-primary',
                    click: function () {
                        $.post('alarm/manage/confirm.do', {id: id}, function (data) {
                            $('#table').trigger('reload');
                            alert(data.message);
                            $('#devaeye-table-modal').modal('hide');
                        });
                    }
                }]
            }
        );
    }
    function clean(id) {
        $('#devaeye-table-modal').showModal({
            title: '告警清除',
            width: '1000',
            content: $('#gather-source-form1').html(),
            contentInit: function () {
                var form = $('form', '#devaeye-table-modal');
                form[0].reset();
                $.post('alarm/manage/get.do', {id: id}, function (data) {
                    console.log(data);
                    $('input[name="id"]', form).val(data.id);
                    $('input[name="path"]', form).val(data.config.path);
                    $('input[name="alarmSource"]', form).val(data.config.alarmTarget.name);
                    $('input[name="alarmName"]', form).val(data.config.name);
                    $('input[name="alarmComments"]', form).val(data.config.comments);
                    $('input[name="status"]', form).val(statusDict[data.status]);
                    $('input[name="firstTime"]', form).val(data.firstTime);
                    $('input[name="lastTime"]', form).val(data.lastTime);
                    $('input[name="frequency"]', form).val(data.frequency);
                    $('input[name="smsReceviers"]', form).val(data.config.smsReceviers);
                    $('input[name="emailReceviers"]', form).val(data.config.emailReceviers);
                    $('input[name="levels"]', form).val(levelsDict[data.levels]);
                    $('input[name="threshold"]', form).val(data.config.threshold);
                    $('input[name="threshold1"]', form).val("=" + data.result);
                    $('#clean_first_time').text(data.firstTime);
                    $('#clean_confirm_time').text(data.confirmTime);
                });
            },
            buttons: [{
                text: '提交',
                class: 'btn btn-primary',
                click: function () {
                    var form = $('form', '#devaeye-table-modal');
                    var query={id: id,reasonType:$('select[name="reasonType"]', form).val(),
                        causes:$('textarea[name="causes"]', form).val(),
                        checkSql:$('textarea[name="checkSql"]', form).val(),
                        summary:$('textarea[name="summary"]', form).val()
                    };
                    console.log(query);
                    $.post('alarm/manage/clean.do', query, function (data) {
                        $('#table').trigger('reload');
                        alert(data.message);
                        $('#devaeye-table-modal').modal('hide');
                    });
                }
            }]
        });
    }

    function view(id) {
        $('#devaeye-table-modal').showModal({
            title: '告警清除',
            width: '1000',
            content: $('#gather-source-form2').html(),
            contentInit: function () {
                var form = $('form', '#devaeye-table-modal');
                form[0].reset();
                $.post('alarm/manage/get.do', {id: id}, function (data) {
                    console.log(data);
                    $('input[name="id"]', form).val(data.id);
                    $('input[name="path"]', form).val(data.config.path);
                    $('input[name="alarmSource"]', form).val(data.config.alarmTarget.name);
                    $('input[name="alarmName"]', form).val(data.config.name);
                    $('input[name="alarmComments"]', form).val(data.config.comments);
                    $('input[name="status"]', form).val(statusDict[data.status]);
                    $('input[name="firstTime"]', form).val(data.firstTime);
                    $('input[name="lastTime"]', form).val(data.lastTime);
                    $('input[name="frequency"]', form).val(data.frequency);
                    $('input[name="smsReceviers"]', form).val(data.config.smsReceviers);
                    $('input[name="emailReceviers"]', form).val(data.config.emailReceviers);
                    $('input[name="levels"]', form).val(levelsDict[data.levels]);
                    $('input[name="threshold"]', form).val(data.config.threshold);
                    $('input[name="threshold1"]', form).val("=" + data.result);
                    $('select[name="reasonType"]', form).val(data.reasonType);
                    $('input[name="causes"]', form).val("=" + data.causes);
                    $('input[name="checkSql"]', form).val("=" + data.checkSql);
                    $('input[name="summary"]', form).val("=" + data.summary);
                    $('#view_first_time').text(data.firstTime);
                    if(data.confirmTime){
                        $('#view_confirm_time').text(data.confirmTime);
                    }
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

    function query(sort) {
        var query = {};
        var alarmLevel = $('#form-query #alarmLevel').val();
        var alarmTarget = $('#form-query #alarmTarget').val();
        var alarmName = $('#form-query #alarmName').val();
        var alarmStatus = $('#form-query #alarmStatus').val();
        var neId = $('#neId').val();
        if(neId){
            query["filter_EQL_neId"] = neId;
        }
        if (alarmLevel) {
            query["filter_EQI_levels"] = alarmLevel;
        }
        if (alarmTarget) {
            query["filter_EQL_alarmTarget.id"] = alarmTarget;
        }
        if (alarmName) {
            query["filter_LIKES_name"] = alarmName;
        }
        if (alarmStatus) {
            query["filter_EQI_status"] = alarmStatus;
        }
        if(sort) {
            query['orderBy'] = sort;
            query['order'] = 'ASC';
        }
        $('#table').trigger('query', query);
    }
</script>
</body>
</html>
