<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>采集源</title>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 采集源</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-12 col-md-12">
    <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
      <div class="input-group input-group-sm">
        <span class="input-group-addon">采集源数据库</span>
        <input type="text" class="form-control" id="name"/>
      </div>
      <div class="input-group input-group-sm"><button type="button" class="btn btn-sm btn-primary" onclick="query()">查询</button></div>
    </form>
    <div id="table" class="devaeye-table-wrapper">
      <div class="table-responsive devaeye-table">
        <table class="table table-hover table-bordered table-striped no-margin-bottom">
          <thead>
          <tr class="info">
            <th>No</th>
            <th>采集源数据库</th>
            <th>IP地址</th>
            <th>数据库类型</th>
            <th>数据库用户</th>
            <th>数据库密码</th>
            <th>端口号</th>
            <th>实例名</th>
            <th>规则数量</th>
            <th>状态</th>
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
  <div id="gather-source-form" class="hidden">
    <form class="form-horizontal">
      <div class="form-group">
        <label class="col-sm-3 control-label">采集源数据库名称：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="name" required data-message="请输入采集源数据库名称！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">IP地址：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="ip" required data-message="请输入IP地址！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">数据库类型：</label>
        <div class="col-sm-9">
          <select class="form-control" name="dbType" required data-message="请选择数据库类型！">
            <c:forEach var="type" items="${dbTypes}">
              <option value="${type.key}">${type.value}</option>
            </c:forEach>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">数据库用户：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="dbUser" required data-message="请输入数据库用户！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">数据库密码：</label>
        <div class="col-sm-9">
          <input type="password" class="form-control" name="dbPassword" required data-message="请输入数据库密码！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">端口号：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="dbPort" required data-message="请输入端口号！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">实例名：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="dbSid" required data-message="请输入实例名！">
        </div>
      </div>
      <input type="hidden" name="id">
    </form>
  </div>
  <script>
    $(function() {
      load();
    });
    function load() {
      $('#table').table({
        url: 'gather/source/page.do',
        data: {pageSize: 10},
        columns: [{}, {
          field: 'name'
        }, {
          field: 'ip'
        }, {
          field: 'dbType',
          format: function(column, row) {
            if(column == 3) {
              return 'ORACLE'
            }
            return '';
          }
        }, {
          field: 'dbUser'
        }, {
          field: 'dbPassword',
          format: function(column, row) {
            return '******';
          }
        }, {
          field: 'dbPort'
        }, {
          field: 'dbSid'
        }, {
          field: 'quantity'
        }, {
          field: 'status',
          format: function(column, row) {
            return column === 'ENABLED' ? '启用' : '停止';
          }
        }, {
          field: 'id',
          align: 'center',
          format: function(column, row) {
            return '<button type="button" class="btn btn-xs btn-primary" onclick="toModify('+column+')"><i class="glyphicon glyphicon-edit"></i></button> ' +
                    '<button type="button" class="btn btn-xs btn-danger" onclick="remove('+column+')"><i class="glyphicon glyphicon-trash"></i></button> ' +
                    '<button type="button" class="btn btn-xs btn-'+(row.status === 'ENABLED' ? 'warning' : 'info')+'" onclick="toggle('+column+')"><i class="glyphicon glyphicon-'+(row.status === 'ENABLED' ? 'ban' : 'ok')+'-circle"></i></button>';
          }
        }],
        add: function(callback) {
          $('#devaeye-table-modal').showModal({
            title: '添加采集源',
            content: $('#gather-source-form').html(),
            buttons: [{
              text: '连接测试',
              class: 'btn btn-info',
              click: function () {
                $.post('gather/source/test.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                  alert(data.message);
                });
              }
            }, {
              text: '提交',
              class: 'btn btn-primary',
              click: function () {
                if(formCheck($('form', '#devaeye-table-modal'))) {
                  $.post('gather/source/add.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
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
        $.post('gather/source/remove.do', {id: id}, function(data) {
          $('#table').trigger('reload');
          alert(data.message);
        });
      }
    }
    function toModify(id) {
      $('#devaeye-table-modal').showModal({
        title: '修改采集源',
        content: $('#gather-source-form').html(),
        contentInit: function() {
          var form = $('form', '#devaeye-table-modal');
          form[0].reset();
          $.post('gather/source/get.do', {id: id}, function(data) {
            $('input[name="id"]', form).val(data.id);
            $('input[name="name"]', form).val(data.name);
            $('input[name="ip"]', form).val(data.ip);
            $('select[name="dbType"]', form).val(data.dbType);
            $('input[name="dbUser"]', form).val(data.dbUser);
            $('input[name="dbPassword"]', form).val(data.dbPassword);
            $('input[name="dbPort"]', form).val(data.dbPort);
            $('input[name="dbSid"]', form).val(data.dbSid);
          });
        },
        buttons: [{
          text: '连接测试',
          class: 'btn btn-info',
          click: function () {
            $.post('gather/source/test.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
              alert(data.message);
            });
          }
        }, {
          text: '提交',
          class: 'btn btn-primary',
          click: function () {
            if(formCheck($('form', '#devaeye-table-modal'))) {
              $.post('gather/source/modify.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                $('#table').trigger('reload');
                alert(data.message);
                $('#devaeye-table-modal').modal('hide');
              });
            }
          }
        }]
      });
    }

    function toggle(id) {
      if(confirm('确定执行？')) {
        $.post('gather/source/toggle.do', {id: id}, function(data) {
          $('#table-tr-' + id + '-status').text(data.status);
          alert(data.message);
        });
      }
    }

    function query() {
      var name = $('#form-query #name').val();
      $('#table').trigger('query', {filter_LIKES_name: name});
    }
  </script>
</div>
</body>
</html>
