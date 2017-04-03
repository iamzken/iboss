<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/taglibs.jsp"%>
<html>
<head>
  <title>告警配置</title>
  <link rel="stylesheet" href="s/ztree/zTreeStyle/zTreeStyle.css">
  <link rel="stylesheet" href="s/bootstrap-select/css/bootstrap-select.min.css">
  <link rel="stylesheet" href="s/bootstrap-datetimepicker/css/datetimepicker.css">
  <style>
    .ztree li span.button.add {
      margin-left: 2px;
      margin-right: -1px;
      background-position: -144px 0;
      vertical-align: top;
      *vertical-align: middle;
    }
  </style>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 告警配置</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-3 col-md-3">
    <button onclick="autoconfirm()" type="button" class="btn btn-sm btn-primary" style="margin-bottom:1em;">自动确认配置</button>
    <div style="border: 1px solid #cccccc; border-radius: 5px; width: 98%; background-color: rgba(241, 244, 248, 1);">
      <ul id="tree-ne" class="ztree"></ul>
      <input type="hidden" id="neId">
      <input type="hidden" id="path">
    </div>
  </div>
  <div class="col-sm-9 col-md-9" style="border: 1px solid #cccccc; border-radius: 5px; padding-top:2em;">
    <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
      <input type="hidden" id="query_neId"/>
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
        <span class="input-group-addon">告警指标对象</span>
        <select type="text" class="form-control" id="alarmTarget">
          <option value=""></option>
          <c:forEach items="${targets}" var="target">
            <option value="${target.id}">${target.name}</option>
          </c:forEach>
        </select>
      </div>
      <div class="input-group input-group-sm"><button type="button" class="btn btn-sm btn-primary" onclick="query()">查询</button></div>
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
            <th>告警描述</th>
            <th>阀值条件</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
      <%@ include file="../../theme/default/views/devaeye-table-footer.jsp"%>
    </div>
  </div>
</div>
<div id="alarm-auto-confirm-form" class="hidden">
  <form class="form-horizontal">

    <div class="form-group">
      <label class="col-sm-3 control-label">紧急：</label>
      <div class="col-sm-9">
        <div class="radio-inline">
            <label><input type="radio" name="jinji" value="0">不确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="jinji" value="1">立即确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="jinji" value="2">延时确认</label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">重要：</label>
      <div class="col-sm-9">
        <div class="radio-inline">
          <label><input type="radio" name="zhongyao" value="0">不确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="zhongyao" value="1">立即确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="zhongyao" value="2">延时确认</label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">次要：</label>
      <div class="col-sm-9">
        <div class="radio-inline">
          <label><input type="radio" name="ciyao" value="0">不确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="ciyao" value="1">立即确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="ciyao" value="2">延时确认</label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">提示：</label>
      <div class="col-sm-9">
        <div class="radio-inline">
          <label><input type="radio" name="tishi" value="0">不确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="tishi" value="1">立即确认</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" name="tishi" value="2">延时确认</label>
        </div>
      </div>
    </div>
    <div class="col-sm-12">
      <p>延时确认情况下，设置多长时间后自动确认告警。</p>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">输入数量：</label>
      <div class="col-sm-6 input-group">
        <input type="text" class="form-control" name="name">
        <div class="input-group-addon">分钟（单位）</div>
      </div>
    </div>
    <input type="hidden" name="id">
  </form>
</div>

<div id="parameter-setting-form" class="hidden">
  <form class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label">参数列表：</label>
      <div class="col-sm-7">
          	<select class="form-control" name="parameterSelect">
	          <c:forEach items="${parameterList}" var="target">
	            <option value="${target.value}">${target.name}</option>
	          </c:forEach>
        	</select>
       </div>
      <div class="col-sm-2">
        <button type="button" class="btn btn-sm btn-primary" onclick="insertText()">参数插入</button>
      </div>
    </div>
    <div class="form-group">
      	<label class="col-sm-3 control-label">警告描述：</label>
      	<div class="col-sm-7">
        	<textarea class="form-control" id="miaoshu" onclick="saveFocus(this)" onchange="saveFocus(this)"></textarea>
      	</div>
    </div>
    <input type="hidden" id="focusIdx">
  </form>
</div>

<div id="gather-source-form" class="hidden">
  <form class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label">定位信息：</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="path" readonly>
        <input type="hidden" name="neId">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">告警名称：</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">告警指标对象：</label>
      <div class="col-sm-9">
        <select type="text" class="form-control" name="alarmTarget.id">
          <c:forEach items="${targets}" var="target">
            <option value="${target.id}">${target.name}</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">阀值条件：</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="threshold">
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">告警级别：</label>
      <div class="col-sm-9">
        <select type="text" class="form-control" name="levels">
          <c:forEach items="${leveldict}" var="level">
            <option value="${level.key}">${level.value}</option>
          </c:forEach>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">告警描述：</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="comments">
      </div>
      <div class="col-sm-2">
        <button type="button" class="btn btn-sm btn-primary" onclick="paraSetting()">参数配置</button>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">告警时间：</label>
      <div class="col-sm-4">
        <input type="text" class="form-control datetimepicker" name="startTime">
      </div>
      <label class="col-sm-1 control-label">至</label>
      <div class="col-sm-4">
        <input type="text" class="form-control datetimepicker" name="endTime">
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">告警频率：</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="frequency" required data-message="请输入告警频率！">
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">升级规则：</label>
      <div class="col-sm-9">
        <div class="radio-inline">
          <label><input type="radio" id="upgradeRule_0" name="upgradeRule" value="0" checked="checked">经过时间</label>
        </div>
        <div class="radio-inline">
          <label><input type="radio" id="upgradeRule_1" name="upgradeRule" value="1">阀值判断</label>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">升级经过时间：</label>
      <div class="col-sm-2">
        <select type="text" class="form-control" name="timeUnit">
          <option value="0">分钟</option>
          <option value="1">小时</option>
          <option value="2">天</option>
          <option value="3">周</option>
        </select>
      </div>
      <div class="col-sm-2">
        <input type="text" class="form-control" name="timeRule">
      </div>
      <label class="col-sm-3 control-label">升级阀值单位：</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" name="thresholdUnit">
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">升级类型：</label>
      <div class="col-sm-9">
        <select type="text" class="form-control" name="upgradeType">
          <option value="0">逐次升级</option>
          <option value="1">直接升级到紧急</option>
          <option value="2">直接升级到重要</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label">邮件接收人：</label>
      <div class="col-sm-9">
        <select class="form-control bootstrap-select" multiple data-live-search="true" name="emailRecevierIds">
          <c:forEach items="${users}" var="user">
            <option value="${user.id}">${user.displayName}</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">短信接收人：</label>
      <div class="col-sm-9">
        <select class="form-control bootstrap-select" multiple data-live-search="true" name="smsRecevierIds">
          <c:forEach items="${users}" var="user">
            <option value="${user.id}">${user.displayName}</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <input type="hidden" name="id">
  </form>
</div>

<script src="s/ztree/jquery.ztree.all.min.js"></script>
<script src="s/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="s/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="s/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh_CN.js" charset="UTF-8"></script>
<script>
  var setting = {
    view: {
      selectedMulti: false
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

  $(function(){
    $.get('ne/tree.do', function(data) {
      if(data){
          $('#path').val("/" + data[0].name);
          $('#neId').val(data[0].id);
      }
      $.fn.zTree.init($("#tree-ne"), setting, data).expandAll(true);
    });
  });

  function getNeInfo(treeNode) {
    $.post('ne/node.do', {id: treeNode.id}, function(data) {
      $('#path').val(data.path + "/" + data.name);
      $('#neId').val(data.id);
      $('#query_neId').val(data.id);
      query();
    });
  }
</script>
<script>
  var levelsDict = {
  <c:forEach items="${leveldict}" var="level">
  ${level.key}:'${level.value}',
  </c:forEach>
  };

  $(function() {
    load();
  });
  function load() {
    $('#table').table({
      url: 'alarm/config/page.do',
      data: {pageSize: 10},
      columns: [{}, {
        field: 'levels',
        format: function(column, row) {
          var l = levelsDict[row.levels];
          if(l){
            return l;
          }else{
            return '';
          }
        }
      }, {
        field: 'name'
      }, {
        field: 'targetName',
        format: function(column, row) {
          return row.alarmTarget.name;
        }
      }, {
        field: 'comments'
      },{
        field: 'threshold'
      },{
        field: 'id',
        align: 'center',
        format: function(column, row) {
          return '<button type="button" class="btn btn-xs btn-primary" onclick="toModify('+column+')"><i class="glyphicon glyphicon-edit"></i></button> ' +
                  '<button type="button" class="btn btn-xs btn-danger" onclick="remove('+column+')"><i class="glyphicon glyphicon-trash"></i></button> ';
        }
      }],
      add: function(callback) {
        $.post('ne/node.do', {id: $("#neId").val()}, function(data) {
          if(data && data.leaf == 1){
            $('#devaeye-table-modal').showModal({
              title: '添加告警配置',
              content: $('#gather-source-form').html(),
              contentInit: function() {
                var form = $('form', '#devaeye-table-modal');
                form[0].reset();
                $('input[name="path"]', form).val($("#path").val());
                $('input[name="neId"]', form).val($("#neId").val());
                $('.bootstrap-select', form).selectpicker({noneSelectedText: '请选择...'});
                $('.datetimepicker', form).datetimepicker({
                  autoclose: true,
                  todayBtn: true,
                  format: 'yyyy-mm-dd hh:ii:ss',
                  language:  'zh_CN'
                });
              },
              buttons: [{
                text: '提交',
                class: 'btn btn-primary',
                click: function () {
                  if(formCheck($('form', '#devaeye-table-modal'))) {
                    $.post('alarm/config/add.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                      if(data.result){
                        callback();
                        $('#table').trigger('reload');
                        $('#devaeye-table-modal').modal('hide');
                      }
                      alert(data.message);
                    });
                  }
                }
              }]
            });
          }else{
            alert("请先选择网元叶子节点再增加告警配置!");
          }});
      }
    });
  }
  function remove(id) {
    if(confirm('确定删除？')) {
      $.post('alarm/config/remove.do', {id: id}, function(data) {
        $('#table').trigger('reload');
        alert(data.message);
      });
    }
  }
  function toModify(id) {
    $('#devaeye-table-modal').showModal({
      title: '修改告警配置',
      content: $('#gather-source-form').html(),
      contentInit: function() {
        var form = $('form', '#devaeye-table-modal');
        form[0].reset();
        $.post('alarm/config/get.do', {id: id}, function(data) {
          console.log(data);
          $('input[name="id"]', form).val(data.id);
          $('input[name="neId"]', form).val(data.neId);
          $('input[name="path"]', form).val(data.path);
          $('input[name="name"]', form).val(data.name);
          $('select[name="alarmTarget.id"]', form).val(data.alarmTarget.id);
          $('input[name="threshold"]', form).val(data.threshold);
          $('select[name="levels"]', form).val(data.levels);
          $('input[name="comments"]', form).val(data.comments);
          $('input[name="startTime"]', form).val(data.startTime);
          $('input[name="endTime"]', form).val(data.endTime);
          $('input[name="frequency"]', form).val(data.frequency);
          $("input:radio[name='upgradeRule']").eq(data.upgradeRule).attr("checked",'checked');
          $('select[name="timeUnit"]', form).val(data.timeUnit);
          $('input[name="timeRule"]', form).val(data.timeRule);
          $('input[name="thresholdUnit"]', form).val(data.thresholdUnit);
          $('select[name="upgradeType"]', form).val(data.upgradeType);
          $('.bootstrap-select', form).selectpicker({noneSelectedText: '请选择...'});
          $('.datetimepicker', form).datetimepicker({
            autoclose: true,
            todayBtn: true,
            format: 'yyyy-mm-dd hh:ii:ss',
            language:  'zh_CN'
          });
        });
      },
      buttons: [{
        text: '提交',
        class: 'btn btn-primary',
        click: function () {
          var form = $('form', '#devaeye-table-modal');
          console.log(form);
          if(formCheck($('form', '#devaeye-table-modal'))) {
              var form = $('form', '#devaeye-table-modal').serialize();
              console.log(form);
            $.post('alarm/config/modify.do', form, function(data) {
              if(data.result){
                $('#table').trigger('reload');
                $('#devaeye-table-modal').modal('hide');
              }
              alert(data.message);
            });
          }
        }
      }]
    });
  }

  function query() {
    var alarmLevel = $('#form-query #alarmLevel').val();
    var alarmTarget = $('#form-query #alarmTarget').val();
    var query_neId = $('#query_neId').val();
      var query = {};
    if(query_neId){
        query["filter_EQL_neId"] = query_neId;
    }
    if(alarmLevel){
        query["filter_EQI_levels"] = alarmLevel;
    }
    if(alarmTarget){
        query["filter_EQL_alarmTarget.id"] = alarmTarget;
    }
    $('#table').trigger('query', query);
  }

  function autoconfirm(){
    $('#devaeye-table-modal').showModal({
      title: '告警自动确认配置',
      content: $('#alarm-auto-confirm-form').html(),
      contentInit: function() {
        var form = $('form', '#devaeye-table-modal');
        form[0].reset();
        $.post('alarm/config/getAutoConfirm.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
            var form = $('form', '#devaeye-table-modal');
            $(":radio[name='jinji'][value='" + data.jinji + "']").prop("checked", "checked");
            $(":radio[name='zhongyao'][value='" + data.zhongyao + "']").prop("checked", "checked");
            $(":radio[name='ciyao'][value='" + data.ciyao + "']").prop("checked", "checked");
            $(":radio[name='tishi'][value='" + data.tishi + "']").prop("checked", "checked");
            $('input[name="time"]', form).val(data.time);
          });
      },
      buttons: [{
        text: '提交',
        class: 'btn btn-primary',
        click: function () {
            var form = $('form', '#devaeye-table-modal');
            console.log(form);
            if(formCheck($('form', '#devaeye-table-modal'))) {
                var form = $('form', '#devaeye-table-modal').serialize();
                console.log(form);
              	$.post('alarm/config/autoConfirmSetting.do', 
            		  {jinji:$('input[name="jinji"]:checked').val() ,zhongyao:$('input[name="zhongyao"]:checked').val()
              			, ciyao:$('input[name="ciyao"]:checked').val(),tishi:$('input[name="tishi"]:checked').val(),time:$('input[name="time"]').val()},
            function(data) {
                if(data.result){
                  $('#table').trigger('reload');
                  $('#devaeye-table-modal').modal('hide');
                }
                alert(data.message);
              });
            }
          }
      }]
    });
  }
  
  function paraSetting(){
	    $('#devaeye-table-modal2').showModal({
	        title: '告警描述参数配置',
	        content: $('#parameter-setting-form').html(),
	        contentInit: function() {
	          var form = $('form', '#devaeye-table-modal');
	          var form2 = $('form', '#devaeye-table-modal2');
// 	          form[0].reset();
	          $("#miaoshu", form2).val($('input[name="comments"]',form).val());
	        },
	        buttons: [{
	          text: '确定',
	          class: 'btn btn-primary',
	          click: function () {
				var form = $('form', '#devaeye-table-modal');
				var form2 = $('form', '#devaeye-table-modal2');
				$('input[name="comments"]',form).val($("#miaoshu", form2).val());
				$('#devaeye-table-modal2').modal('hide');
	          }
	        }]
	      });
  }
  function saveFocus(obj) {  
	  var form2 = $('form', '#devaeye-table-modal2');
	  $("#focusIdx", form2).val(obj.selectionStart);
	} 
  function insertText() {
	  var form2 = $('form', '#devaeye-table-modal2');
	  var textValue = $("#miaoshu", form2).val();
	  var insertValue = $('select[name="parameterSelect"]',form2).val();
	  var idx = $("#focusIdx", form2).val();
	  textValue.substring(0,idx)
	  var outValue=textValue.substring(0,idx)+insertValue;
	  outValue+=textValue.substring(idx)
	  $("#miaoshu", form2).val(outValue);
	} 
  
</script>
<div class="modal fade" id="devaeye-table-modal2" tabindex="-1" role="dialog" aria-labelledby="devaeye-table-modal-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="devaeye-table-modal-label">Modal title</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</body>
</html>
