<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>网元管理</title>
  <link rel="stylesheet" href="s/ztree/zTreeStyle/zTreeStyle.css">
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
  <h3><span class="glyphicon glyphicon-th-large"></span> 网元管理</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-4 col-md-4">
    <button onclick="toAdd()" type="button" class="btn btn-sm btn-primary" style="margin-bottom:1em;">新建网元项目</button>
    <button onclick="alert('未完成...')" type="button" class="btn btn-sm btn-primary" style="margin-bottom:1em;">导入网元项目</button>
    <div style="border: 1px solid #cccccc; border-radius: 5px; width: 98%; background-color: rgba(241, 244, 248, 1);">
      <ul id="tree-ne" class="ztree"></ul>
    </div>
  </div>
  <div class="col-sm-8 col-md-8" style="border: 1px solid #cccccc; border-radius: 5px; padding-top:2em;">
    <div class="form-horizontal" role="form" id="ne-info">
      <div class="form-group">
        <label for="path" class="col-sm-3 control-label">网元路径：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" id="path" name="path" readonly>
        </div>
      </div>
      <div class="form-group">
        <label for="type" class="col-sm-3 control-label">网元类型：</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" id="type" name="type" readonly>
        </div>
      </div>
      <div class="dynamic-fields">
      </div>
    </div>
    <hr>
    <div class="page-header">
      <h5><b>关联警告项</b></h5>
    </div>
    <table class="table table-bordered table-striped">
      <tr class="info">
        <th>No</th>
        <th>告警项</th>
        <th>告警阀值说明</th>
      </tr>
      <tbody id="configs"></tbody>
    </table>
  </div>
</div>
<div id="form-wrapper" class="hidden">
  <form class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label">网元路径：</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="path" readonly>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">网元类型：</label>
      <div class="col-sm-9 neTemplate">
        <select class="form-control" name="neTemplate.id" required data-message="请选择网元类型！"></select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label">网元名称：</label>
      <div class="col-sm-9">
        <input type="text" class="form-control" name="name" required data-message="请输入网元名称！">
      </div>
    </div>
    <div class="dynamic-fields">

    </div>
    <input type="hidden" name="id">
    <input type="hidden" name="parentId">
  </form>
</div>
<script src="s/ztree/jquery.ztree.all.min.js"></script>
<script>
  var setting = {
    view: {
      addHoverDom: addHoverDom,
      removeHoverDom: removeHoverDom,
      selectedMulti: false
    },
    edit: {
      enable: true,
      editNameSelectAll: true,
      showRemoveBtn: showRemoveBtn,
      showRenameBtn: true
    },
    data: {
      simpleData: {
        pIdKey: "parentId",
        enable: true
      }
    },
    callback: {
      beforeRemove: beforeRemove,
      beforeEditName: beforeEditName,
      onClick: onClick
    }
  };

  function showRemoveBtn(treeId, treeNode) {
    return !treeNode.isParent;
  }
  function beforeRemove(treeId, treeNode) {
    var result = false;
    if(confirm("确认删除网元“" + treeNode.name + "”吗？")) {
      $.ajax({
        url: 'ne/remove.do',
        data: {id: treeNode.id},
        async: false
      }).done(function(data) {
        if(data) {
          alert(data.message);
          result = (data.result === true);
        }
      })
    }
    return result;
  }
  function beforeEditName(treeId, treeNode) {
    $('#devaeye-modal').showModal({
      title: '修改网元项目',
      content: $('#form-wrapper').html(),
      contentInit: function() {
        getEditNeInfo(treeNode);
      },
      buttons: [{
        text: '提交',
        class: 'btn btn-primary',
        click: function () {
          if(formCheck($('form', '#devaeye-modal'))) {
            $.post('ne/update.do', $('form', '#devaeye-modal').serialize(), function(data) {
              alert(data.message);
              if(data && data.result === true) {
                $('#devaeye-modal').modal('hide');
                $.fn.zTree.getZTreeObj("tree-ne").destroy();
                $.get('ne/tree.do', function(data) {
                  $.fn.zTree.init($("#tree-ne"), setting, data).expandAll(true);
                });
              }
            });
          }
        }
      }]
    });
    return false;
  }
  function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_"+treeNode.tId);
    if (btn) btn.bind("click", function(){
      toAdd(treeNode);
    });
  };
  function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
  };

  function onClick(event, treeId, treeNode) {
    getNeInfo(treeNode);
  }
  $(function(){
    $.get('ne/tree.do', function(data) {
      $.fn.zTree.init($("#tree-ne"), setting, data).expandAll(true);
    });
  });

  function toAdd(treeNode) {
    $('#devaeye-modal').showModal({
      title: '添加网元项目',
      content: $('#form-wrapper').html(),
      contentInit: function() {
        var modal = $('#devaeye-modal');
        initNeTypeSelector($('select[name="neTemplate.id"]', modal), $('.dynamic-fields', modal));

        if(treeNode) {
          var nodes = treeNode.getPath();
          var _path = new Array(nodes.length);
          for(var i in nodes) {
            _path[i] = nodes[i].name;
          }
          $('input[name="path"]', modal).val(_path.join('/'));
          $('input[name="parentId"]', modal).val(treeNode.id);
        }
      },
      buttons: [{
        text: '提交',
        class: 'btn btn-primary',
        click: function () {
          if(formCheck($('form', '#devaeye-modal'))) {
            $.post('ne/create.do', $('form', '#devaeye-modal').serialize(), function(data) {
              alert(data.message);
              if(data && data.result === true) {
                $('#devaeye-modal').modal('hide');
                $.fn.zTree.getZTreeObj("tree-ne").destroy();
                $.get('ne/tree.do', function(data) {
                  $.fn.zTree.init($("#tree-ne"), setting, data).expandAll(true);
                });
              }
            });
          }
        }
      }]
    });
  }
  function initNeTypeSelector(selector, dynamicFields) {
    $.get('ne/templates.do', function(data) {
      var html = '', details = {};
      for(var i in data) {
        var item = data[i];
        html += '<option value="'+item.id+'">'+item.name+'</option>';
        details[item.id] = item.details;
      }
      $(selector).html(html).off('change').on('change', function() {
        var _details = details[$(this).val()];
        if(_details) {
          var _html = '';
          for(var i in _details) {
            var d = _details[i];
            _html += '<div class="form-group">' +
                      '<label class="col-sm-3 control-label">'+d.name+'：</label>' +
                      '<div class="col-sm-9">' +
                        '<input type="text" class="form-control" name="record.props['+d.code+'].value"/>' +
                      '</div>' +
                    '</div>';
          }
          $(dynamicFields).html(_html);
        }
      }).change();
    });
  }

  function getNeInfo(treeNode) {
    $.post('ne/node.do', {id: treeNode.id}, function(data) {
      var wrapper = '#ne-info';
      $('input[name="path"]', wrapper).val(data.path);
      $('input[name="type"]', wrapper).val(data.neTemplate.name);
      var fields = data.neTemplate.details;
      var _html = '';
      for(var i in fields) {
        var d = fields[i];
        _html += '<div class="form-group">' +
                '<label class="col-sm-3 control-label">'+d.name+'：</label>' +
                '<div class="col-sm-9">' +
                '<input type="text" class="form-control" id="prop_'+ d.code +'" readonly/>' +
                '</div>' +
                '</div>';
      }
      $('div.dynamic-fields', wrapper).html(_html);
      var props = data.record.props;
      for(var i in props) {
        $('#prop_' + props[i].code, wrapper).val(props[i].value);
      }
      var configs = data.alarmConfig;
      var html_configs = '';
      for(var i in configs) {
        var config = configs[i];
        html_configs += '<tr><td>'+(i+1)+'</td><td>'+config.name+'</td><td>'+config.comments+'</td></tr>';
      }
      $('#configs').html(html_configs);
    });
  }

  function getEditNeInfo(treeNode) {
    var modal = $('#devaeye-modal');
    $.post('ne/node.do', {id: treeNode.id}, function(data) {
      $('.neTemplate', modal).html('<input type="text" class="form-control typeName" readonly/><input type="hidden" name="neTemplate.id"/>');
      $('input[name="path"]', modal).val(data.path);
      $('.typeName', modal).val(data.neTemplate.name);
      $('input[name="neTemplate.id"]', modal).val(data.neTemplate.id);
      $('input[name="name"]', modal).val(data.name);
      $('input[name="id"]', modal).val(data.id);
      $('input[name="parentId"]', modal).val(data.parentId);
      var fields = data.neTemplate.details;
      var _html = '';
      for(var i in fields) {
        var d = fields[i];
        _html += '<div class="form-group">' +
                '<label class="col-sm-3 control-label">'+d.name+'：</label>' +
                '<div class="col-sm-9">' +
                '<input type="text" class="form-control" name="record.props['+ d.code +'].value" id="prop_'+ d.code +'"/>' +
                '</div>' +
                '</div>';
      }
      $('div.dynamic-fields', modal).html(_html);
      var props = data.record.props;
      for(var i in props) {
        $('#prop_' + props[i].code, modal).val(props[i].value);
      }
    });
  }
</script>
</body>
</html>
