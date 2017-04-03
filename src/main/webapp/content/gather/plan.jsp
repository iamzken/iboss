<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>采集计划</title>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 采集计划</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-12 col-md-12">
    <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
      <div class="input-group input-group-sm">
        <span class="input-group-addon">采集计划名</span>
        <input type="text" class="form-control" id="name"/>
      </div>
      <div class="input-group input-group-sm">
        <span class="input-group-addon">计划任务数</span>
        <input type="text" class="form-control" id="taskNum"/>
      </div>
      <div class="input-group input-group-sm"><button type="button" class="btn btn-sm btn-primary" onclick="query()">查询</button></div>
    </form>
    <div id="table" class="devaeye-table-wrapper">
      <div class="table-responsive devaeye-table">
        <table class="table table-hover table-bordered table-striped no-margin-bottom">
          <thead>
          <tr class="info">
            <th>No</th>
            <th>采集计划名</th>
            <th>计划任务数</th>
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
  <div id="form-wrapper" class="hidden">
    <form class="form-horizontal">
      <div class="form-group">
        <label class="col-sm-2 control-label">采集计划名称：</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="name" required data-message="请输入采集计划名称！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">计划列表：</label>
        <div class="col-sm-10">
          <table class="table table-hover table-bordered table-striped">
            <tr>
              <th>选择</th>
              <th width="20%">计划任务</th>
              <th width="20%">目标库表</th>
              <th width="20%">采集对象</th>
              <th width="20%">采集频率(Cron表达式)</th>
              <th>操作</th>
              <th><button class="btn btn-xs btn-primary" type="button" onclick="addTask()"><span class="glyphicon glyphicon-plus"></span></button></th>
            </tr>
            <tbody class="tasks"></tbody>
          </table>
        </div>
      </div>
      <div style="display: none" class="others">
        <div class="form-group">
          <label class="col-sm-2 control-label">采集对象项目：</label>
          <div class="col-sm-10">
            <table class="table table-hover table-bordered table-striped">
              <tr>
                <th>序号</th>
                <th>项目名</th>
                <th>数据类型</th>
              </tr>
              <tbody class="source-columns"></tbody>
            </table>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">目标数据库表：</label>
          <div class="col-sm-10">
            <table class="table table-hover table-bordered table-striped">
              <tr>
                <th>序号</th>
                <th>项目名</th>
                <th>数据类型</th>
                <th>目标系统项目名</th>
                <th></th>
              </tr>
              <tbody class="target-columns"></tbody>
            </table>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">导入SQL脚本：</label>
          <div class="col-sm-10">
            <button onclick="generateSql(this)" type="button" class="btn btn-xs btn-primary btn-sql" style="margin-bottom:1em; float:right;">SQL脚本生成</button>
            <textarea class="form-control sql" rows="5" readonly></textarea>
          </div>
        </div>
      </div>
      <input type="hidden" name="id">
    </form>
  </div>
  <script>
    var tasks = {};
    var selectedColName = '';
    $(function() {
      load();
      $('#devaeye-table-modal').on('click', 'input[name="details.checked"]', function() {
        loadTargetAndObject(this);
      });
      $('#devaeye-table-modal').on('change', '.select-target, .select-object', function() {
        if($('input[name="details.checked"]', $(this).parents('tr')).prop('checked') == true) {
          loadTargetAndObject(this);
        }
      });
      $('#devaeye-table-modal').on('click', '.source-columns tr', function() {
        $('.source-columns tr').removeClass('danger');
        $(this).addClass('danger');
        selectedColName = $('.source-col-name' ,this).text();
      });
    });
    function load() {
      $('#table').table({
        url: 'gather/plan/page.do',
        data: {pageSize: 10},
        columns: [{}, {
          field: 'name'
        }, {
          field: 'taskNum'
        }, {
          field: 'id',
          align: 'center',
          format: function(column, row) {
            return '<button type="button" class="btn btn-xs btn-primary" onclick="toModify('+column+')"><i class="glyphicon glyphicon-edit"></i></button> ' +
                    '<button type="button" class="btn btn-xs btn-danger" onclick="remove('+column+')"><i class="glyphicon glyphicon-trash"></i></button> ';
          }
        }],
        add: function(callback) {
          $('#devaeye-table-modal').showModal({
            title: '添加数据采集计划',
            width: 800,
            content: $('#form-wrapper').html(),
            contentInit: function() {
              count = 0;
            },
            buttons: [{
              text: '提交',
              class: 'btn btn-primary',
              click: function () {
                if(formCheck($('form', '#devaeye-table-modal'))) {
                  $.post('gather/plan/add.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                    alert(data.message);
                    if(data && data.result == false) {
                      return;
                    }
                    callback();
                    $('#devaeye-table-modal').modal('hide');
                  });
                }
              }
            }]
          });
        }
      });
    }
    function remove(id) {
      if(confirm('确定删除？')) {
        $.post('gather/plan/remove.do', {id: id}, function(data) {
          $('#table').trigger('reload');
          alert(data.message);
        });
      }
    }
    function toModify(id) {
      $('#devaeye-table-modal').showModal({
        title: '修改数据采集计划',
        width: 800,
        content: $('#form-wrapper').html(),
        contentInit: function() {
          count = 0;
          tasks = {};
          var form = $('form', '#devaeye-table-modal');
          form[0].reset();
          $.post('gather/plan/get.do', {id: id}, function(data) {
            $('input[name="id"]', form).val(data.id);
            $('input[name="name"]', form).val(data.name);
            var tasks_html = '';
            for(var i in data.details) {
              var item = data.details[i];
              tasks_html += '<tr id="task_'+count+'">' +
                      '<td><input type="radio" name="details.checked" data-count="' + count + '">' +
                          '<input type="hidden" name="details['+count+'].sql" value="'+item.sql+'">' +
                      '</td>' +
                      '<td><input type="text" class="form-control" name="details['+count+'].name" value="'+item.name+'"></td>' +
                      '<td><select class="form-control select-target" name="details['+count+'].target.id" data-count="' + count + '">' + getTargetOptions(item.target.id) + '</select></td>' +
                      '<td><select class="form-control select-object" name="details['+count+'].object.id" data-count="' + count + '">' + getObjectOptions(item.object.id) + '</select></td>' +
                      '<td><input type="text" class="form-control" name="details['+count+'].frequency" value="'+item.frequency+'"></td>' +
                      '<td><button type="button" class="btn btn-xs btn-primary" onclick="test(' + count + ')">测试</button></td>' +
                      '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td>' +
                      '</tr>';
              tasks[count] = item;
              count ++;
            }
            $('.tasks', form).html(tasks_html);
          });
        },
        buttons: [{
          text: '提交',
          class: 'btn btn-primary',
          click: function () {
            if(formCheck($('form', '#devaeye-table-modal'))) {
              $.post('gather/plan/update.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                alert(data.message);
                if(data && data.result == false) {
                  return;
                }
                $('#table').trigger('reload');
                $('#devaeye-table-modal').modal('hide');
              });
            }
          }
        }]
      });
    }
    function query() {
      var name = $('#form-query #name').val();
      var taskNum = $('#form-query #taskNum').val();
      $('#table').trigger('query', {filter_LIKES_name: name, filter_EQI_taskNum: taskNum});
    }

    var count = 0;
    function addTask() {
      var form = $('form', '#devaeye-table-modal');
      $('.tasks', form).append('<tr id="task_'+count+'">' +
              '<td><input type="radio" name="details.checked" data-count="' + count + '">' +
                  '<input type="hidden" name="details['+count+'].sql"></td>' +
              '<td><input type="text" class="form-control" name="details['+count+'].name"></td>' +
              '<td><select class="form-control select-target" name="details['+count+'].target.id" data-count="' + count + '">' + getTargetOptions() + '</select></td>' +
              '<td><select class="form-control select-object" name="details['+count+'].object.id" data-count="' + count + '">' + getObjectOptions() + '</select></td>' +
              '<td><input type="text" class="form-control" name="details['+count+'].frequency"></td>' +
              '<td><button type="button" class="btn btn-xs btn-primary" onclick="test(' + count + ')">测试</button></td>' +
              '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td>' +
              '</tr>');
      count ++;
    }

    var objects = null, targets = null;
    function getObjectOptions(selected) {
      if(!objects) {
        $.ajax({
          url: 'gather/object/all.do',
          async: false
        }).done(function(data) {
          objects = data;
        });
      }
      var options = '';
      for(var i in objects) {
        var item = objects[i];
        options += '<option value="' + item.id + '" ' + (item.id == selected ? 'selected' : '') + '  data-table-name="' + item.dbTableName + '" data-source-id="' + item.gatherSource.id + '">' + item.name + '</option>';
      }
      return options;
    }
    function getTargetOptions(selected) {
      if(!targets) {
        $.ajax({
          url: 'gather/target/all.do',
          async: false
        }).done(function(data) {
          targets = data;
        });
      }
      var options = '';
      for(var i in targets) {
        var item = targets[i];
        options += '<option value="' + item.id + '" ' + (item.id == selected ? 'selected' : '') + ' data-table-name="' + item.dbTableName + '">' + item.name + '</option>';
      }
      return options;
    }

    function test(i) {
      var row = $('#task_'+i);
      var targetId = $('select[name="details['+i+'].target.id"]', row).val();
      var objectId = $('select[name="details['+i+'].object.id"]', row).val();
      var cron = $('input[name="details['+i+'].frequency"]', row).val();
      $.post('gather/plan/task/test.do', {'target.id': targetId, 'object.id': objectId, 'frequency': cron}, function(data) {
        alert(data.message);
      });
    }

    function generateSql(btn) {
      var count = $(btn).data('count'),
              objectTable = $(btn).data('object-table'),
              targetTable = $(btn).data('target-table'),
              objectId = $(btn).data('object-id');
      var modal = $('#devaeye-table-modal');
      var cols = new Array();
      $('.col-name').each(function (i, item) {
        cols[i] = $(item).text();
      });
      var _cols = new Array();
      $('.col-name-target').each(function (i, item) {
        if($(item).val()) {
          _cols[i] = $(item).val();
        } else {
          _cols[i] = cols[i];
        }
      });
      $.get('gather/object/get.do', {id: objectId}, function(data) {
        var conditions = data.condition;
        var wheres = '';
        for(var i in conditions) {
          var con = conditions[i];
          wheres += ' ' + con.relation + ' ' + con.colName + ' ' + con.condition + ' \'' + con.value + '\' ';
        }
        var sql = 'INSERT INTO ' + targetTable + '(' + cols.join(', ') + ') VALUES (SELECT ' + _cols.join(', ') + ' FROM ' + objectTable + ' WHERE 1=1 ' + wheres + ')';
        $('input[name="details['+count+'].sql"]', modal).val(sql);
        $('.sql', modal).val(sql);
      });
    }

    function autoFill(btn) {
      $('.col-name-target', $(btn).parents('tr')).val(selectedColName);
    }
    function loadTargetAndObject(dom) {
      var modal = $('#devaeye-table-modal');
      $('.source-columns', modal).html('');
      $('.target-columns', modal).html('');
      var count = $(dom).data('count'),
              sourceId = $('select[name="details['+count+'].object.id"] option:selected', modal).data('source-id'),
              objectTable = $('select[name="details['+count+'].object.id"] option:selected', modal).data('table-name');
      targetId = $('select[name="details['+count+'].target.id"]', modal).val(),
              targetTable = $('select[name="details['+count+'].target.id"] option:selected', modal).data('table-name');
      $.post('gather/source/columns.do', {id: sourceId, tableName: objectTable}, function (data) {
        if(!data || data.length == 0) {
          alert('未加载到该表数据！');
          return;
        }
        var html = '';
        for (var i in data) {
          var item = data[i];
          html += '<tr><td>' + (parseInt(i) + 1) + '</td><td class="source-col-name">' + item.colName + '</td><td>' + item.type + '</td></tr>';
        }
        $('.source-columns', modal).html(html);
        $.post('gather/target/get.do', {id: targetId}, function(target) {
          var columns_html = '';
          for(var i in target.columns) {
            var item = target.columns[i];
            columns_html += '<tr><td>' + (parseInt(i) + 1) + '<input type="hidden" name="details['+count+'].colMaps['+i+'].targetColName" value="'+item.name+'"></td>' +
                    '<td class="col-name">' + item.name + '</td>' +
                    '<td>' + item.type + '</td>' +
                    '<td><input type="text" required data-message="“目标系统项目名”不可为空！" class="form-control col-name-target" name="details['+count+'].colMaps['+i+'].oriColName" value="'+getMapVal(item.name, tasks[count] ? tasks[count].colMaps : null)+'"></td>' +
                    '<td><button class="btn btn-xs btn-primary" type="button" onclick="autoFill(this)"><span class="glyphicon glyphicon-arrow-left"></span></button></td></tr>';
          }
          $('.target-columns', modal).html(columns_html);
          $('.btn-sql', modal).data({'count': count, 'object-id': $('select[name="details['+count+'].object.id"] option:selected').val(), 'object-table': objectTable, 'target-table': targetTable});
          $('.sql').val($('input[name="details['+count+'].sql"]', modal).val());
          $('.others', modal).show();
        });
      });
    }

    function saveTask() {
      var modal = $('#devaeye-table-modal');
      var count = $('input[name="details.checked"]:checked', modal).data('count');
      //var
    }

    function getMapVal(key, colMaps) {
      if(!colMaps) {
        return '';
      }
      for(var i in colMaps) {
        var map = colMaps[i];
        if(key == map.targetColName) {
          return map.oriColName;
        }
      }
    }
  </script>
</div>
</body>
</html>
