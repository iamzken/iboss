<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>目标库</title>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 目标库</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-12 col-md-12">
    <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
      <div class="input-group input-group-sm">
        <span class="input-group-addon">目标库表名</span>
        <input type="text" class="form-control" id="name"/>
      </div>
      <div class="input-group input-group-sm">
        <span class="input-group-addon">目标库物理名</span>
        <input type="text" class="form-control" id="dbTableName"/>
      </div>
      <div class="input-group input-group-sm"><button type="button" class="btn btn-sm btn-primary" onclick="query()">查询</button></div>
    </form>
    <div id="table" class="devaeye-table-wrapper">
      <div class="table-responsive devaeye-table">
        <table class="table table-hover table-bordered table-striped no-margin-bottom">
          <thead>
          <tr class="info">
            <th>No</th>
            <th>目标库表名</th>
            <th>目标库物理名</th>
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
        <label class="col-sm-3 control-label">目标库表名称：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="name" required data-message="请输入目标库表名称！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">目标库表物理名：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="dbTableName" required data-message="请输入目标库表物理名！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">项目设定：</label>
        <div class="col-sm-9">
          <table class="table table-hover table-bordered table-striped">
            <tr>
              <th>项目名</th>
              <th width="20%">数据类型</th>
              <th width="20%">字段长度</th>
              <th width="10%">主键</th>
              <th width="15%">允许为空</th>
              <th width="5%"><button class="btn btn-xs btn-primary" type="button" onclick="addRow()"><span class="glyphicon glyphicon-plus"></span></button></th>
            </tr>
            <tbody class="items"></tbody>
          </table>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">SQL脚本：</label>
        <div class="col-sm-9">
          <button onclick="generateSql()" type="button" class="btn btn-xs btn-primary" style="margin-bottom:1em; float:right;">SQL脚本生成</button>
          <textarea name="sql" rows="5" class="form-control" required data-message="请先生成采集SQL脚本！"></textarea>
        </div>
      </div>
      <input type="hidden" name="id">
    </form>
  </div>
  <script>
    var dataTypes = [/*{
      id: 3,
      name: 'DATE',
      desc: '日期'
    }, */{
      id: 1,
      name: 'NVARCHAR',
      desc: '字符串'
    }/*, {
      id: 2,
      name: 'LONG',
      desc: '数字'
    }*/];

    function getDataTypeOptions(selected) {
      var typeOptions = '';
      for(var i in dataTypes) {
        var dataType = dataTypes[i];
        typeOptions += '<option value="' + dataType.id + '" data-name="' + dataType.name + '" ' + (dataType.id == selected ? 'selected' : '') + '>' + dataType.desc + '</option>';
      }
      return typeOptions;
    }

    $(function() {
      load();
      $('#devaeye-table-modal').on('click', '.key', function() {
        $('.key').prop('checked', false);
        $(this).prop('checked', true);
      });

      $('#devaeye-table-modal').on('change', '.type', function() {
        if($(this).val() == 1) {
          $('.len', $(this).parents('tr')).val(64);
        } else {
          $('.len', $(this).parents('tr')).val('');
        }
      });
    });
    function load() {
      $('#table').table({
        url: 'gather/target/page.do',
        data: {pageSize: 10},
        columns: [{}, {
          field: 'name'
        }, {
          field: 'dbTableName'
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
            title: '添加目标库表',
            content: $('#form-wrapper').html(),
            width: 800,
            contentInit: function() {
              count = 0;
              var form = $('form', '#devaeye-table-modal');
              $('.items', form).html('<tr>' +
                      '<td><input type="text" class="form-control name" name="columns['+count+'].name" value="CREATE_TIME"></td>' +
                      '<td><select class="form-control type" name="columns['+count+'].type">'+getDataTypeOptions()+'</select></td>' +
                      '<td><input type="text" class="form-control len" name="columns[' + count + '].len"></td>' +
                      '<td><input type="checkbox" class="key" name="columns[' + count + '].key" value="1"></td>' +
                      '<td><input type="checkbox" class="nill" name="columns['+count+'].nill" value="1"></td>' +
                      '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td>' +
                      '</tr>');
              $('.type', form).change();
              count++;
            },
            buttons: [{
              text: '提交',
              class: 'btn btn-primary',
              click: function () {
                if(formCheck($('form', '#devaeye-table-modal'))) {
                  $.post('gather/target/add.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                    callback();
                    alert(data.message);
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
        $.post('gather/target/remove.do', {id: id}, function(data) {
          $('#table').trigger('reload');
          alert(data.message);
        });
      }
    }
    function toModify(id) {
      $('#devaeye-table-modal').showModal({
        title: '修改目标库表',
        content: $('#form-wrapper').html(),
        width: 800,
        contentInit: function() {
          count = 0;
          var form = $('form', '#devaeye-table-modal');
          form[0].reset();
          $.post('gather/target/get.do', {id: id}, function(data) {
            $('input[name="id"]', form).val(data.id);
            $('input[name="name"]', form).val(data.name);
            $('input[name="dbTableName"]', form).val(data.dbTableName);
            $('textarea[name="sql"]', form).val(data.sql);
            var columns_html = '';
            for(var i in data.columns) {
              var item = data.columns[i];
              columns_html += '<tr>' +
                      '<td><input type="text" class="form-control name" name="columns['+count+'].name" value="'+item.name+'"></td>' +
                      '<td><select class="form-control type" name="columns['+count+'].type">'+getDataTypeOptions(item.type)+'</select></td>' +
                      '<td><input type="text" class="form-control len" name="columns[' + count + '].len" value="'+item.len+'"></td>' +
                      '<td><input type="checkbox" class="key" name="columns[' + count + '].key" value="1" ' + (item.key == 1 ? 'checked' : '') + '></td>' +
                      '<td><input type="checkbox" class="nill" name="columns['+count+'].nill" value="1"' + (item.nill == 1 ? 'checked' : '') + '></td>' +
                      '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td>' +
                      '</tr>';
              count ++;
            }
            $('.items', form).html(columns_html);
          });
        },
        buttons: [{
          text: '提交',
          class: 'btn btn-primary',
          click: function () {
            if(formCheck($('form', '#devaeye-table-modal'))) {
              var name = $('input[name="name"]', '#devaeye-table-modal form').val();
              if (confirm('是否确定删除现有的“' + name + '”目标库并重新创建“' + name + '”目标库')) {
                $.post('gather/target/update.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                  $('#table').trigger('reload');
                  alert(data.message);
                  $('#devaeye-table-modal').modal('hide');
                });
              }
            }
          }
        }]
      });
    }
    function query() {
      var name = $('#form-query #name').val();
      var dbTableName = $('#form-query #dbTableName').val();
      $('#table').trigger('query', {filter_LIKES_name: name, filter_LIKES_dbTableName: dbTableName});
    }

    function generateSql() {
      var form = $('form', '#devaeye-table-modal');
      var tableName = $('input[name="dbTableName"]', form).val().toUpperCase();
      var sql = 'DROP TABLE "' + tableName + '";';
      sql += 'CREATE TABLE "' + tableName + '" (';
      var keyName = '';
      $('.items tr', form).each(function(i, item) {
        var name = $('.name', item).val().toUpperCase();
        var type = $('.type option:selected', item).data('name');
        var len = $('.len', item).val();
        var key = $('.key', item).prop('checked');
        var nill = $('.nill', item).prop('checked');

        sql += '"' + name + '" ' + type + ' ' + (len?'('+len+')':'') + ' ' + (!nill?'NOT NULL':'') + ', ';
        if(key) {
          keyName = name;
        }
      });
      sql += ');';
      sql += 'ALTER TABLE "' + tableName + '" ADD PRIMARY KEY ("' + keyName + '");';
      $('textarea[name="sql"]', form).val(sql);
    }

    var count = 0;
    function addRow() {
      var form = $('form', '#devaeye-table-modal');
      $('.items', form).append('<tr>' +
              '<td><input type="text" class="form-control name" name="columns[' + count + '].name"></td>' +
              '<td><select class="form-control type" name="columns[' + count + '].type">' + getDataTypeOptions() + '</select></td>' +
              '<td><input type="text" class="form-control len" name="columns[' + count + '].len"></td>' +
              '<td><input type="checkbox" class="key" name="columns[' + count + '].key" value="1"></td>' +
              '<td><input type="checkbox" class="nill" name="columns[' + count + '].nill" value="1"></td>' +
              '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td>' +
              '</tr>');
      $('.type', form).change();
      count++;
    }
  </script>
</div>
</body>
</html>
