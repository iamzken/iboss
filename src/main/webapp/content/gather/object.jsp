<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>采集对象</title>
  <style>
    .conditions input,
    .conditions select {
      padding-left: 0; padding-right: 0;
    }
  </style>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 采集对象</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
  <div class="col-sm-12 col-md-12">
    <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
      <div class="input-group input-group-sm">
        <span class="input-group-addon">采集对象名称</span>
        <input type="text" class="form-control" id="name"/>
      </div>
      <div class="input-group input-group-sm">
        <span class="input-group-addon">采集源数据库</span>
        <select type="text" class="form-control" id="gatherSourceId">
          <option value="">全部</option>
          <c:forEach var="source" items="${sources}">
            <option value="${source.id}">${source.name}</option>
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
            <th>数据采集对象名称</th>
            <th>采集源数据库</th>
            <th>采集对象说明</th>
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
        <label class="col-sm-4 control-label">采集对象名称：</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" name="name" required data-message="请输入采集对象名称！">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-4 control-label">采集对象说明：</label>
        <div class="col-sm-8">
          <textarea name="comment" class="form-control" required data-message="请输入采集对象说明！"></textarea>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-4 control-label">采集源数据库：</label>
        <div class="col-sm-8">
          <select class="form-control" name="gatherSource.id" required data-message="请选择采集源数据库！">
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-4 control-label">采集源数据库表名：</label>
        <div class="col-sm-8">
          <div class="input-group">
            <input type="text" class="form-control" name="dbTableName" required data-message="请输入采集源数据库表名！">
            <span class="input-group-btn"><button type="button" class="btn btn-primary" onclick="columns()">载入数据结构</button></span>
          </div>
        </div>
      </div>
      
      <ul id="tabs" class="nav nav-tabs">
			<li class="active">
				<a href="#oneTab" data-toggle="tab">
					 第一张表
				</a>
			</li>
			<li><a href="#twoTab" data-toggle="tab">第二张表</a></li>
			<li style="float:right;"><a href="#moreTab" data-toggle="tab">多张表</a></li>
		</ul>
      <div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="oneTab">
			<div class="form-group">
		        <label class="col-sm-2 control-label">采集源数据库表结构：</label>
		        <div class="col-sm-10">
		          <table class="table table-hover table-bordered table-striped">
		            <tr>
		              <th>序号</th>
		              <th>项目名</th>
		              <th>数据类型</th>
		            </tr>
		            <tbody class="one-columns"></tbody>
		          </table>
		        </div>
		     </div>
		     <div class="form-group">
		        <label class="col-sm-2 control-label">检索条件：</label>
		        <div class="col-sm-10">
		          <table class="table one-table table-hover table-bordered table-striped">
		            <tr>
		              <th width="30%">项目名</th>
		              <th width="18%">条件</th>
		              <th width="17%">条件值</th>
		              <th width="25%">提交关系</th>
		              <th width="10%"><button class="btn btn-xs btn-primary" type="button" onclick="addCondition('one')"><span class="glyphicon glyphicon-plus"></span></button></th>
		            </tr>
		            <tbody class="one-conditions"></tbody>
		          </table>
		        </div>
		     </div>
		     <div class="form-group">
		      	 <button onclick="generateSql()" type="button" class="btn btn-xs btn-primary" style="margin-bottom:1em; float:right;">采集SQL脚本生成</button>
		      </div>
   		</div>
   		<div class="tab-pane fade in" id="twoTab">
			<div class="form-group">
		        <label class="col-sm-2 control-label">采集源数据库表结构：</label>

		        <div class="col-sm-10">
		          <table class="table table-hover table-bordered table-striped">
		            <tr>
		              <th>序号</th>
		              <th>项目名</th>
		              <th>数据类型</th>
		            </tr>
		            <tbody class="two-columns"></tbody>
		          </table>
		        </div>
		     </div>
		     
		     
		    <div class="form-group">
		        <label class="col-sm-2 control-label">检索条件：</label>
		        <div class="col-sm-10">
		          <table class="table table-hover table-bordered table-striped two-table">
		            <tr>
		               <th width="30%">项目名</th>
		              <th width="18%">条件</th>
		              <th width="17%">条件值</th>
		              <th width="25%">提交关系</th>
		              <th width="10%"><button class="btn btn-xs btn-primary" type="button" onclick="addCondition('two')"><span class="glyphicon glyphicon-plus"></span></button></th>
		            </tr>
		            <tbody class="two-conditions"></tbody>
		          </table>
		        </div>
		     </div>
		      <div class="form-group">
		        <label class="col-sm-2 control-label">表关联关系：</label>
		        <div class="col-sm-10">
		        	<table class="table table-hover table-bordered table-striped">
			            <tr>
			              <th>表1项目名</th>
			              <th>表2项目名</th>
			          	</tr>
			            <tbody class="twoTab_conditions">
			            	<tr>
			            	<td>
			            		<select class="form-control colName" name = "relation.colName1" id="twoTab_selects1">
			            		</select>
			            		 <input type="hidden" id="dbTableName1" name="relation.dbTableName1">
			            	</td>
			            	<td>
			            		<select class="form-control colName" name = "relation.colName2" id="twoTab_selects2">
			            		</select>
			            		<input type="hidden" id="dbTableName2" name="relation.dbTableName2">
			            	</td>
			            	</tr>
			            </tbody>
		          </table>
		        </div>
		      </div>
		      
		      
		      <div class="form-group">
		      	 <button onclick="generateSql()" type="button" class="btn btn-xs btn-primary" style="margin-bottom:1em; float:right;">采集SQL脚本生成</button>
		      </div>
   		</div>
   		<div class="tab-pane fade in" id="moreTab">
			<div class="form-group">
		        <label class="col-sm-2 control-label">采集源数据库表结构：</label>

		        <div class="col-sm-10">
		          <table class="table more-table table-hover table-bordered table-striped">
		            <tr>
		              <th>序号</th>
		              <th>项目名</th>
		              <th>数据类型</th>
		            </tr>
		            <tbody class="more-columns"></tbody>
		          </table>
		        </div>
		     </div>
   		</div>
   		
      </div>
      
      
      
      <div class="form-group">
        <label class="col-sm-2 control-label">采集SQL脚本：</label>
        <div class="col-sm-10">
          <textarea name="sql" rows="5" class="form-control" required data-message="请先生成采集SQL脚本！"></textarea>
        </div>
      </div>
      <input type="hidden" name="id">
      <input type="hidden" id="dbTableCount" name="dbTableCount">
    </form>
  </div>
  <script>
    var tableColumns = [];
    var tables={};
    var tableNames = [];
    $(function() {
      load();
    });
    function load() {
      $('#table').table({
        url: 'gather/object/page.do',
        data: {pageSize: 10},
        columns: [{}, {
          field: 'name'
        }, {
          field: 'gatherSource.name'
        }, {
          field: 'comment'
        }, {
          field: 'id',
          align: 'center',
          format: function(column, row) {
            return '<button type="button" class="btn btn-xs btn-primary" onclick="toModify('+column+')"><i class="glyphicon glyphicon-edit"></i></button> ' +
                    '<button type="button" class="btn btn-xs btn-danger" onclick="remove('+column+')"><i class="glyphicon glyphicon-trash"></i></button>';
          }
        }],
        add: function(callback) {
          con_count = 0;
          var modal = $('#devaeye-table-modal');
          modal.showModal({
            title: '添加采集对象',
            content: $('#form-wrapper').html(),
            contentInit: function() {
              tableColumns = [];
              tables={};
              tableNames = [];
              $.get('gather/source/list.do', function(data) {
            	  
            	  $("#tabs li").each(function(index){
              		$(this).removeClass ("active") ;
              		if(index==0){
              			$(this).addClass("active");
              		};
                   }); 
                var html = '';
                for(var i in data) {
                  var item = data[i];
                  html += '<option value="'+item.id+'" data-dbsid="'+item.dbSid+'">'+item.name+'</option>';
                }
                $('select[name="gatherSource.id"]', modal).html(html);
              });
            },
            buttons: [{
              text: '提交',
              class: 'btn btn-primary',
              click: function () {
                if(formCheck($('form', '#devaeye-table-modal'))) {
     	          $('#dbTableCount').val(getULActiveIndex());
                  $.post('gather/object/add.do',$('form', '#devaeye-table-modal').serialize() , function(data) {
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
        $.post('gather/object/remove.do', {id: id}, function(data) {
          $('#table').trigger('reload');
          alert(data.message);
        });
      }
    }
    function toModify(id) {
      $('#devaeye-table-modal').showModal({
        title: '修改采集对象',
        content: $('#form-wrapper').html(),
        contentInit: function() {
          con_count = 0;
          tableColumns = [];
          tables={};
          tableNames = [];
          var form = $('form', '#devaeye-table-modal');
          form[0].reset();
          $.post('gather/object/get.do', {id: id}, function(data) {
            $('input[name="id"]', form).val(data.id);
            $('input[name="name"]', form).val(data.name);
            $('textarea[name="comment"]', form).val(data.comment);
            $('input[name="dbTableName"]', form).val(data.dbTableName);
            $('textarea[name="sql"]', form).val(data.sql);
            var gatherSourceId = data.gatherSource.id;
            tables.table1 =data.columns ;
			tableNames.push(data.relation.dbTableName1);
			$('#dbTableName1').val(data.relation.dbTableName1);
            var tabCount = data.dbTableCount ;    	
        	$("#tabs li").each(function(index){
        		$(this).removeClass ("active") ;
        		if(index==(tabCount-1)){
        			$(this).addClass("active");
        		};
             }); 
        	$("#myTabContent .tab-pane").each(function(index){
        		$(this).removeClass ("active") ;
        		if(index==(tabCount-1)){
        			$(this).addClass("active");
        		};
             }); 
            $.get('gather/source/list.do', function(sources) {
              var html = '';
              for(var i in sources) {
                var item = sources[i];
                html += '<option value="'+item.id+'" data-dbsid="'+item.dbSid+'">'+item.name+'</option>';
              }
              $('select[name="gatherSource.id"]', form).html(html).val(gatherSourceId);
				
				var html = '';
				for (var i in data.tblColumns) {
				  var item = data.tblColumns[i];
				  html += '<tr><td>' + (parseInt(i) + 1) + '</td><td>' + item.colName + '</td><td>' + item.type + '</td></tr>';
				}
				$('.one-columns', form).html(html);
			
                var conditions1 = data.condition1;
                var conditions_html1 = '';
				tables.table1 =data.tblColumns;
                for(var i in conditions1) {
                  var c = conditions1[i];
                  var cond = c.condition.toLowerCase();
                  var rela = c.relation.toLowerCase();
                  conditions_html1 += '<tr>' +
                          '<td><select class="form-control colName" name="condition[' + con_count + '].colName">' + getColumnSelectorExt(c.colName) + '</select></td>' +
                          '<input class="form-control" type="hidden" name="condition[' + con_count + '].tableName" value="' + c.tableName + '">' +
                          '<td><select class="form-control condition" name="condition[' + con_count + '].condition">' +
                            '<option value="=" ' + (cond == '=' ? 'selected' : '') + '>=</option>' +
                            '<option value=">" ' + (cond == '>' ? 'selected' : '') + '>></option>' +
                            '<option value=">=" ' + (cond == '>=' ? 'selected' : '') + '>>=</option>' +
                            '<option value="<" ' + (cond == '<' ? 'selected' : '') + '><</option>' +
                            '<option value="<=" ' + (cond == '<=' ? 'selected' : '') + '><=</option>' +
                            '<option value="like" ' + (cond == 'like' ? 'selected' : '') + '>like</option>' +
                          '</select></td>' +
                          '<td><input class="form-control value" type="text" name="condition[' + con_count + '].value" value="' + c.value + '"></td>' +
                          '<td><select class="form-control relation" name="condition[' + con_count + '].relation">' +
                            '<option value="AND" ' + (rela == 'and' ? 'selected' : '') + '>AND</option>' +
                            '<option value="OR" ' + (rela == 'or' ? 'selected' : '') + '>OR</option>' +
                          '</select></td>' +
                          '<td><button class="btn btn-xs btn-primary" type="button" onclick="removeCondition(this)"><span class="glyphicon glyphicon-minus"></span></button></td>' +
                          '</tr>';
                  con_count ++;
                }
                $('.one-conditions', form).html(conditions_html1);
               if(tabCount==2){
					tableNames.push(data.relation.dbTableName2);
					$('#dbTableName2').val(data.relation.dbTableName2);
					tables.table2 = data.tblColumns2;
					var conditions2 = data.condition2;
					var conditions_html2 = '';
					var con_count2 = 0;
					for(var i in conditions2) {
					  var c = conditions2[i];
					  var cond = c.condition.toLowerCase();
					  var rela = c.relation.toLowerCase();
					  conditions_html2 += '<tr>' +
							  '<td><select class="form-control colName" name="condition[' + con_count2 + '].colName">' + getColumnSelector(c.colName) + '</select></td>' +
							  '<input class="form-control" type="hidden" name="condition[' + con_count2 + '].tableName" value="' + c.tableName + '">' +
							  '<td><select class="form-control condition" name="condition[' + con_count2 + '].condition">' +
								'<option value="=" ' + (cond == '=' ? 'selected' : '') + '>=</option>' +
								'<option value=">" ' + (cond == '>' ? 'selected' : '') + '>></option>' +
								'<option value=">=" ' + (cond == '>=' ? 'selected' : '') + '>>=</option>' +
								'<option value="<" ' + (cond == '<' ? 'selected' : '') + '><</option>' +
								'<option value="<=" ' + (cond == '<=' ? 'selected' : '') + '><=</option>' +
								'<option value="like" ' + (cond == 'like' ? 'selected' : '') + '>like</option>' +
							  '</select></td>' +
							  '<td><input class="form-control value" type="text" name="condition[' + con_count2 + '].value" value="' + c.value + '"></td>' +
							  '<td><select class="form-control relation" name="condition[' + con_count2 + '].relation">' +
								'<option value="AND" ' + (rela == 'and' ? 'selected' : '') + '>AND</option>' +
								'<option value="OR" ' + (rela == 'or' ? 'selected' : '') + '>OR</option>' +
							  '</select></td>' +
							  '<td><button class="btn btn-xs btn-primary" type="button" onclick="removeCondition(this)"><span class="glyphicon glyphicon-minus"></span></button></td>' +
							  '</tr>';
					  con_count2 ++;
					}
                	$('.two-conditions', form).html(conditions_html2);
					generateOption('twoTab_selects1',data.tblColumns,data.relation.colName1);
					generateOption('twoTab_selects2',data.tblColumns2,data.relation.colName2);
					var html2 = '';
					for (var i in data.tblColumns2) {
					  var item = data.tblColumns2[i];
					  html2 += '<tr><td>' + (parseInt(i) + 1) + '</td><td>' + item.colName + '</td><td>' + item.type + '</td></tr>';
					}
					$('.two-columns', form).html(html2);
                }else{
                	//$('.more-conditions', form).html(conditions_html);
                }
                
           
            });
          });
        },
        buttons: [{
          text: '提交',
          class: 'btn btn-primary',
          click: function () {
        	  var flag = 1;
	          	$('#tabs').find('li').each(function(){
	          		 if(this.className == "active"){ 
	          			 flag = $(this).index() +1;
	                   } 
	          	});
        	  
	          	$('#dbTableCount').val(flag);
            if(formCheck($('form', '#devaeye-table-modal'))) {
              $.post('gather/object/modify.do', $('form', '#devaeye-table-modal').serialize(), function(data) {
                $('#table').trigger('reload');
                alert(data.message);
                $('#devaeye-table-modal').modal('hide');
              });
            }
          }
        }]
      });
    }

    function query() {
      var form = '#form-query';
      var name = $('#name', form).val();
      var gatherSourceId = $('#gatherSourceId', form).val();
      $('#table').trigger('query', {'filter_LIKES_name': name, 'filter_EQL_gatherSource.id': gatherSourceId});
    }

    function columns(callback) {
    	var form = $('form', '#devaeye-table-modal');
    	//表示当前第几张表
    	var flag = getULActiveIndex();
    	//如果不是1判断表是否重复加载
    	 if(flag==3){
    		 
    	 }
		if($.inArray( $('input[name="dbTableName"]', form).val(), tableNames)>=0){
			 alert('该表已经加载完成！');
			 return;
		}
  
      $.post('gather/source/columns.do', {
        id: $('select[name="gatherSource.id"]', form).val(),
        tableName: $('input[name="dbTableName"]', form).val()
      }, function (data) {
        if(!data || data.length == 0) {
          alert('未加载到该表数据！');
          return;
        }
        
        if(flag == 1){
			if(tableNames.length==0){
				tableNames.push($('input[name="dbTableName"]', form).val());
			}else{
				tableNames[0] = $('input[name="dbTableName"]', form).val();
			}
			
            $('.one-conditions', form).html('');
            tables.table1 = data;
            generateOption('twoTab_selects1',data);
            $('#dbTableName1').val($('input[name="dbTableName"]', form).val());
        }else if(flag==2){
			if(tableNames.length<2){
				tableNames.push($('input[name="dbTableName"]', form).val());
			}else{
				tableNames[1] = $('input[name="dbTableName"]', form).val();
			}
			$('.two-conditions', form).html('');
        	tables.table2 = data;
        	generateOption('twoTab_selects2',data);
        	$('#dbTableName2').val($('input[name="dbTableName"]', form).val());
        }
        tableColumns = data;
        var html = '';
        for (var i in data) {
          var item = data[i];
          html += '<tr><td>' + (parseInt(i) + 1) + '</td><td>' + item.colName + '</td><td>' + item.type + '</td></tr>';
        }
        if(flag == 1){
        	$('.one-columns', form).html(html);
        }else if(flag ==2){
        	$('.two-columns', form).html(html);
        }else if(flag ==3){
        	$('.more-columns', form).append( html);
        }
        if($.isFunction(callback)) {
          callback();
        }
      });
    }

    var con_count = 0;
    function addCondition(position) {
      var form = $('form', '#devaeye-table-modal');
      $('.'+ position+'-conditions', form).append('<tr>' +
              '<td><select class="form-control colName" name="condition[' + con_count + '].colName">' + getColumnSelector() + '</select></td>' +
              '<input class="form-control" type="hidden" name="condition[' + con_count + '].tableName" value="' +$('input[name="dbTableName"]', form).val()+ '">' +
              '<td><select class="form-control condition" name="condition[' + con_count + '].condition"><option value="=">=</option><option value=">">></option><option value=">=">>=</option><option value="<"><</option><option value="<="><=</option><option value="like">like</option></select></td>' +
              '<td><input class="form-control value" type="text" name="condition[' + con_count + '].value"></td>' +
              '<td><select class="form-control relation" name="condition[' + con_count + '].relation"><option value="AND">AND</option><option value="OR">OR</option></select></td>' +
              '<td><button class="btn btn-xs btn-primary" type="button" onclick="removeCondition(this)"><span class="glyphicon glyphicon-minus"></span></button></td>' +
              '</tr>');
      con_count ++;
    }
    function removeCondition(btn) {
      $(btn).parents('tr').remove();
    }
    function getColumnSelector(colName) {
      var html = '';
      var flag = 1;
	  	$('#tabs').find('li').each(function(){
	  		 if(this.className == "active"){ 
	  			 flag = $(this).index() +1;
	           } 
	  	});
	  	var tableColumns = [];
      if(flag == 1){
          tableColumns = tables.table1 ;
      }else if(flag==2){
    	  tableColumns = tables.table2 ;
      }
      
      for (var i in tableColumns) {
        var item = tableColumns[i];
        html += '<option value="' + item.colName + '" ' + (item.colName === colName ? 'selected' : '') + '>' + item.colName + '</option>';
      }
      return html;
    }
    function getColumnSelectorExt(colName) {
        var html = '';
       
  	  	var tableColumns = [];
            tableColumns = tables.table1 ;
       
        
        for (var i in tableColumns) {
          var item = tableColumns[i];
          html += '<option value="' + item.colName + '" ' + (item.colName === colName ? 'selected' : '') + '>' + item.colName + '</option>';
        }
        return html;
      }
   
    function generateSql() {
    	var flag = 1;
	  	$('#tabs').find('li').each(function(){
	  		 if(this.className == "active"){ 
	  			 flag = $(this).index() +1;
	           } 
	  	});
	  	 var sql ='';
	  	var modal = $('#devaeye-table-modal');
      if(flag == 1){
    	  sql = 'SELECT * FROM `' + $('select[name="gatherSource.id"] option:selected', modal).data('dbsid') + '`.`' + $('input[name="dbTableName"]', modal).val() + '` WHERE 1=1 ';
          $('.one-conditions tr', modal).each(function(i, item) {
            var relation = $('.relation', item).val();
            var colName = $('.colName', item).val();
            var condition = $('.condition', item).val();
            var value = $('.value', item).val();
            sql += relation + ' `' + colName + '` ' + condition + ' \'' + value + '\' ';
          });
      }
      if(flag==2&&tableNames.length>1){
    	  sql = 'SELECT t1.*,t2.* FROM `' + $('select[name="gatherSource.id"] option:selected', modal).data('dbsid') + '`.`' + tableNames[0] + ' t1,`'+ $('select[name="gatherSource.id"] option:selected', modal).data('dbsid') + '`.`' + tableNames[1] + '` t2'+ ' WHERE 1=1 ';
          $('.one-conditions tr', modal).each(function(i, item) {
            var relation = $('.relation', item).val();
            var colName = $('.colName', item).val();
            var condition = $('.condition', item).val();
            var value = $('.value', item).val();
            sql += relation + ' t1.`' + colName + '` ' + condition + ' \'' + value + '\' ';
          });
          $('.two-conditions tr', modal).each(function(i, item) {
              var relation = $('.relation', item).val();
              var colName = $('.colName', item).val();
              var condition = $('.condition', item).val();
              var value = $('.value', item).val();
              sql += relation + ' t2.`' + colName + '` ' + condition + ' \'' + value + '\' ';
            });
          sql += 'AND t1.' +$('#twoTab_selects1').val()+ '=' + ' t2.' +$('#twoTab_selects2').val()+ '' ;
      }
      
     
      $('textarea[name="sql"]', modal).val(sql);
    }
    function generateOption(id,columns,colName ){
    	var html = '';
    	for (var i in columns) {
            var item = columns[i];
            html += '<option value="' + item.colName + '" ' + (item.colName === colName ? 'selected' : '') + '>' + item.colName + '</option>';
          }
    	$('#'+id).html(html);
    }
    
    function getULActiveIndex(){
    	var flag = 1;
    	$('#tabs').find('li').each(function(){
      		 if(this.className == "active"){ 
      			 flag = $(this).index() +1;
               } 
      	});
    	return flag;	
    }
  </script>
</div>
</body>
</html>
