<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>采集结果</title>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 采集结果</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-12 col-md-12">
    <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
      <%--<div class="input-group input-group-sm">
        <span class="input-group-addon">采集源</span>
        <select class="form-control" name="gatherSourceId"></select>
      </div>--%>
      <div class="input-group input-group-sm">
        <span class="input-group-addon">采集结果表名</span>
        <select class="form-control" name="gatherTargetId" id="gatherTargetId"></select>
      </div>
      <div style="margin-top:1em; width: 100%;">
        <div class="input-group" style="vertical-align: top;">
          <span class="input-group-addon">检索条件</span>
          <table class="table table-bordered conditions-table" style="margin-bottom: 0;">
            <tr class="active">
              <th style="width: 8em;">项目名</th>
              <th style="width: 6em;">条件</th>
              <th style="width: 8em;">条件值</th>
              <th style="width: 6em;">条件关系</th>
              <th style="width: 4em;"><button class="btn btn-xs btn-primary" type="button" onclick="addCondition()"><span class="glyphicon glyphicon-plus"></span></button></th>
            </tr>
            <tbody class="conditions"></tbody>
          </table>
        </div>
        <div class="input-group" style="vertical-align: top;">
          <span class="input-group-addon">排序条件</span>
          <table class="table table-bordered sorts-table" style="margin-bottom: 0;">
            <tr class="active">
              <th style="width: 8em;">项目名</th>
              <th style="width: 6em;">顺序</th>
              <th><button class="btn btn-xs btn-primary" type="button" onclick="addSort()"><span class="glyphicon glyphicon-plus"></span></button></th>
            </tr>
            <tbody class="sorts"></tbody>
          </table>
        </div>
        <div class="input-group input-group-sm"><button type="button" class="btn btn-sm btn-primary" onclick="query()">查询</button></div>
      </div>
    </form>
    <div id="table" class="devaeye-table-wrapper">
      <div class="table-responsive devaeye-table">
        <table class="table table-hover table-bordered table-striped no-margin-bottom">
          <thead>
          <tr class="info">
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
<script>
  var columns = null;
  $(function() {
    $('.btn-footer-add').remove();
    $.post('gather/target/all.do', function(data) {
      var options = '<option value="">请选择...</option>';
      for(var i in data) {
        options += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
      }
      $('#gatherTargetId').html(options).change(function() {
        $('.conditions').html('');
        $('.sorts').html('');
        if($(this).val()) {
          $.post('gather/target/get.do', {id: $(this).val()}, function(target) {
            columns = target.columns;
          });
        }
      });
    });
  });
  function load(data) {
    var _columns = [{}];
    for(var i in columns) {
      _columns.push({field: columns[i].name});
    }
    $('#table').trigger('destroy').table({
      url: 'gather/result/page.do',
      data: data,
      columns: _columns,
      add: false
    });
  }
  function query() {
    // 初始化表头
    var thead_html = '<th>No</th>';
    for(var i in columns) {
      thead_html += '<th>' + columns[i].name + '</th>';
    }
    $('#table thead > tr').html(thead_html);

    var data = {
      pageSize: 10,
      targetId: $('#gatherTargetId').val(),
      conditions: [],
      sorts: []
    };
    $('.conditions tr').each(function(i, item) {
      data.conditions.push({
        columnName: $('.column-name', item).val(),
        condition: $('.condition', item).val(),
        value: $('.value', item).val(),
        relation: $('.relation', item).val()
      });
    });
    $('.sorts tr').each(function(i, item) {
      data.sorts.push({
        columnName: $('.column-name', item).val(),
        direction: $('.direction', item).val()
      });
    });
    if(data.targetId) {
      load(data);
    } else {
      alert('请选择采集结果表名！');
    }
  }

  function addCondition() {
    if(columns) {
      var columns_options = '';
      for(var i in columns) {
        columns_options += '<option value="' + columns[i].name + '">' + columns[i].name + '</option>';
      }
      $('.conditions').append('<tr><td><select class="form-control column-name">' + columns_options + '</select></td>' +
              '<td><select class="form-control condition">' +
                '<option value="=">=</option>' +
                '<option value=">">></option>' +
                '<option value=">=">>=</option>' +
                '<option value="<"><</option>' +
                '<option value="<="><=</option>' +
                '<option value="like">like</option>' +
              '</select></td>' +
              '<td><input type="text" class="form-control value"></td>' +
              '<td><select class="form-control relation">' +
                '<option value="AND">AND</option>' +
                '<option value="OR">OR</option>' +
              '</select></td>' +
              '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td></tr>');
    } else {
      alert('请选择采集结果表名！');
    }
  }

  function addSort() {
    if(columns) {
      var columns_options = '';
      for(var i in columns) {
        columns_options += '<option value="' + columns[i].name + '">' + columns[i].name + '</option>';
      }
      $('.sorts').append('<tr><td><select class="form-control column-name">' + columns_options + '</select></td>' +
              '<td><select class="form-control direction">' +
              '<option value="DESC">降序</option>' +
              '<option value="ASC">升序</option>' +
              '</select></td>' +
              '<td><button class="btn btn-xs btn-primary" type="button" onclick="$(this).parents(\'tr\').remove()"><span class="glyphicon glyphicon-minus"></span></button></td></tr>');
    } else {
      alert('请选择采集结果表名！');
    }
  }
</script>
</body>
</html>
