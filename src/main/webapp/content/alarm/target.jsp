<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>告警指标对象管理</title>
</head>
<body>
<div class="page-header">
    <h3><span class="glyphicon glyphicon-th-large"></span> 告警指标对象管理</h3>
</div>
<div class="row" style="margin-bottom: 2em;">
    <div class="col-sm-12 col-md-12">
        <form id="form-query" class="form-inline" style="margin-bottom: 2em;">
            <div class="input-group input-group-sm">
                <span class="input-group-addon">告警指标对象</span>
                <input type="text" class="form-control" id="name"/>
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
                        <th>告警指标对象</th>
                        <th>抽出SQL文描述</th>
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
    <div id="gather-source-form" class="hidden">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-4 control-label">告警指标对象：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="name" required data-message="请输入告警指标对象名称！">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label">目标库表名：</label>
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
		                <label class="col-sm-2 control-label">目标库表结构：</label>
		                <div class="col-sm-10">
		                    <table class="table table-hover table-bordered table-striped">
		                        <tr>
		                            <th>序号</th>
		                            <th>项目名</th>
		                            <th>数据类型</th>
		                            <th>指标列</th>
		                        </tr>
		                        <tbody class="one-columns"></tbody>
		                    </table>
		                </div>
		            </div>
		            <div class="form-group">
		                <label class="col-sm-2 control-label">检索条件：</label>
		                <div class="col-sm-10">
		                    <table class="table table-hover table-bordered table-striped">
		                        <tr>
		                            <th>项目名</th>
		                            <th width="25%">条件</th>
		                            <th width="20%">条件值</th>
		                            <th width="25%">提交关系</th>
		                            <th width="10%">
		                                <button class="btn btn-xs btn-primary" type="button" onclick="addCondition()"><span
		                                        class="glyphicon glyphicon-plus"></span></button>
		                            </th>
		                        </tr>
		                        <tbody class="one-conditions"></tbody>
		                    </table>
		                </div>
		            </div>
		            <div class="form-group">
			            <button onclick="generateSql()" type="button" class="btn btn-xs btn-primary"
	                            style="margin-bottom:1em; float:right;">抽出SQL脚本生成
	                    </button>
		            </div>
				</div>
				
				<div class="tab-pane fade in" id="twoTab">
					<div class="form-group">
		                <label class="col-sm-2 control-label">目标库表结构：</label>
		                <div class="col-sm-10">
		                    <table class="table table-hover table-bordered table-striped">
		                        <tr>
		                            <th>序号</th>
		                            <th>项目名</th>
		                            <th>数据类型</th>
		                            <th>指标列</th>
		                        </tr>
		                        <tbody class="two-columns"></tbody>
		                    </table>
		                </div>
		            </div>
		            <div class="form-group">
		                <label class="col-sm-2 control-label">检索条件：</label>
		                <div class="col-sm-10">
		                    <table class="table table-hover table-bordered table-striped">
		                        <tr>
		                            <th>项目名</th>
		                            <th width="25%">条件</th>
		                            <th width="20%">条件值</th>
		                            <th width="25%">提交关系</th>
		                            <th width="10%">
		                                <button class="btn btn-xs btn-primary" type="button" onclick="addCondition()"><span
		                                        class="glyphicon glyphicon-plus"></span></button>
		                            </th>
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
			            <button onclick="generateSql()" type="button" class="btn btn-xs btn-primary"
	                            style="margin-bottom:1em; float:right;">抽出SQL脚本生成
	                    </button>
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
		                            <th>指标列</th>
				            </tr>
				            <tbody class="more-columns"></tbody>
				          </table>
				        </div>
				     </div>
		   		</div>
			</div>
          		
            
            
            <div class="form-group">
                <label class="col-sm-2 control-label">抽出SQL文描述：</label>
                <div class="col-sm-10">
                   
                    <textarea class="form-control" rows="3" name="sql"></textarea>
                </div>
            </div>
            <input type="hidden" name="id">
        </form>
    </div>
    <script>
        $(function () {
            load();
        });
        //存放多张表是的所有列
        var tableColumns = [];
        //存放多张表
        var tableNames = [];
        //存放表对应的字段
        var tables = {};
        //表示ul中的激活li索引
        var index =1;
        function load() {
            $('#table').table({
                url: 'alarm/target/page.do',
                data: {pageSize: 10},
                columns: [{}, {
                    field: 'name'
                }, {
                    field: 'sql'
                }, {
                    field: 'id',
                    align: 'center',
                    format: function (column, row) {
                        return '<button type="button" class="btn btn-xs btn-primary" onclick="toModify(' + column + ')"><i class="glyphicon glyphicon-edit"></i></button> ' +
                            '<button type="button" class="btn btn-xs btn-danger" onclick="remove(' + column + ')"><i class="glyphicon glyphicon-trash"></i></button> ';
                    }
                }],
                add: function (callback) {
                    $('#devaeye-table-modal').showModal({
                        title: '添加告警指标对象',
                        content: $('#gather-source-form').html(),
                        buttons: [{
                            text: '连接测试',
                            class: 'btn btn-info',
                            click: function () {
                                $.post('alarm/target/test.do', $('form', '#devaeye-table-modal').serialize(), function (data) {
                                    alert(data.message);
                                });
                            }
                        }, {
                            text: '提交',
                            class: 'btn btn-primary',
                            click: function () {
                                if (formCheck($('form', '#devaeye-table-modal'))) {
                                    $.post('alarm/target/add.do',  $('form', '#devaeye-table-modal').serialize(), function (data) {
                                        alert(data.message);
                                        $('#devaeye-table-modal').modal('hide');
                                        callback();
                                    });
                                }
                            }
                        }]
                    });
                }
            });
        }
        function remove(id) {
            if (confirm('确定删除？')) {
                $.post('alarm/target/remove.do', {id: id}, function (data) {
                    $('#table').trigger('reload');
                    alert(data.message);
                });
            }
        }
        function toModify(id) {
            $('#devaeye-table-modal').showModal({
                title: '修改告警指标对象',
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
                    text: '连接测试',
                    class: 'btn btn-info',
                    click: function () {
                        $.post('alarm/target/test.do', $('form', '#devaeye-table-modal').serialize(), function (data) {
                            alert(data.message);
                        });
                    }
                }, {
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

        function toggle(id) {
            if (confirm('确定执行？')) {
                $.post('alarm/target/toggle.do', {id: id}, function (data) {
                    $('#table-tr-' + id + '-status').text(data.status);
                    alert(data.message);
                });
            }
        }

        function query() {
            var name = $('#form-query #name').val();
            $('#table').trigger('query', {filter_LIKES_name: name});
        }

		
        function columns(callback) {
            var form = $('form', '#devaeye-table-modal');
            var tableName = $('input[name="dbTableName"]', form).val();
            $.post('alarm/target/columns.do', {
                tableName: tableName.toUpperCase()
            }, function (data) {
                if(data.length == 0){
                    alert("表'" + tableName + "'不存在，或服务异常，请稍后再试。")
                }
                index = getULActiveIndex();
                if(index==1){
                	//表名集合处理
                	if(tableNames.length==0){
                		tableNames.push($('input[name="dbTableName"]', form).val());
                	}else{
                		tableNames[0] = $('input[name="dbTableName"]', form).val();
                	}
                	tables.table1 = data;
                	generateOption('twoTab_selects1',data);
                }else if(index ==2){
                	//表名集合处理
                	if(tableNames.length==0){
                		tableNames.push('');
                		tableNames.push($('input[name="dbTableName"]', form).val());
                	}else if(tableNames.length==1){
                		tableNames.push($('input[name="dbTableName"]', form).val());
                	}else if(tableNames.length==2) {
                		tableNames[1] = $('input[name="dbTableName"]', form).val();
                	}
                	generateOption('twoTab_selects2',data);
                	tables.table2 = data;
                }else {
                	tableNames.push($('input[name="dbTableName"]', form).val());
                	tableColumns.push(data);	
                }
                var html = '';
                for (var i in data) {
                    var item = data[i];
                    html += '<tr><td>' + (parseInt(i) + 1) + '</td><td>' + item.colName + '</td><td>' + item.type + '</td><td><input type="checkbox" id="' + tableName + '" value="' + item.colName + '"></td></tr>';
                }
                if(index==1){
                	 $('.one-columns', form).html(html);
                }else if(index ==2){
                	 $('.two-columns', form).html(html);
                }else{
                	 $('.more-columns', form).append(html);
                }
               
                if ($.isFunction(callback)) {
                    callback();
                }
            });
        }

        var con_count = 0;
        function addCondition() {
            var form = $('form', '#devaeye-table-modal');
            
            index = getULActiveIndex();
        	var ob ;
            if(index==1){
            	ob = $('.one-conditions', form);
            }else if(index ==2){
            	ob=	$('.two-conditions', form)
            }else{
            	return;
            }
            ob.append('<tr>' +
                '<td><select class="form-control colName" name="condition[' + con_count + '].colName">' + getColumnSelector() + '</select></td>' +
                '<td><select class="form-control condition" name="condition[' + con_count + '].condition"><option value="=">=</option><option value=">">></option><option value=">=">>=</option><option value="<"><</option><option value="<="><=</option><option value="like">like</option></select></td>' +
                '<td><input class="form-control value" type="text" name="condition[' + con_count + '].value"></td>' +
                '<td><select class="form-control relation" name="condition[' + con_count + '].relation"><option value="AND">AND</option><option value="OR">OR</option></select></td>' +
                '<td><button class="btn btn-xs btn-primary" type="button" onclick="removeCondition(this)"><span class="glyphicon glyphicon-minus"></span></button></td>' +
                '</tr>');
            con_count++;
        }

        function removeCondition(btn) {
            $(btn).parents('tr').remove();
        }
        function getColumnSelector(colName) {
        	index = getULActiveIndex();
        	var columns = [];
            if(index==1){
            	
            	columns = tables.table1;
            }else if(index ==2){
            	columns = tables.table2;
            }else {
            	
            	columns = tableColumns;
            }
            var html = '';
            for (var i in columns) {
                var item = columns[i];
                html += '<option value="' + item.colName + '" ' + (item.colName === colName ? 'selected' : '') + '>' + item.colName + '</option>';
            }
            return html;
        }

        function generateSql() {
            var modal = $('#devaeye-table-modal');
            var target_column ='';
            var rads ;
            index = getULActiveIndex();
            if(index==1){
            	rads = $('.one-columns input[type=checkbox]:checked').length;
            	if (rads==0) {
                    alert("请选择指标列!");
                    return;
                }
            	$(".one-columns input[type=checkbox]:checked").each(function(index){
            		if(index != rads-1){
            			target_column += $(this).val() + ',';
            		}else{
            			target_column += $(this).val() ;
            		} 
                }); 
            	
            	var sql = 'SELECT ' + target_column + ' FROM ' +$('input[name="dbTableName"]', modal).val().toUpperCase()  + ' WHERE 1=1 ';
                $('.one-conditions tr', modal).each(function (i, item) {
                    var relation = $('.relation', item).val();
                    var colName = $('.colName', item).val();
                    var condition = $('.condition', item).val();
                    var value = $('.value', item).val();
                    sql += relation + ' ' + colName + ' ' + condition + ' \'' + value + '\' ';
                });
                

            }else if(index ==2){
            	var rad1= $('.one-columns input[type=checkbox]:checked').length;
            	rads = $('.two-columns input[type=checkbox]:checked').length;
            	if ((rads.length==0)&&(rad1.length==0)) {
                    alert("请选择指标列!");
                    return;
                }
            	$(".one-columns input[type=checkbox]:checked").each(function(index){
	  				target_column +='t1.'+ $(this).val() + ',';
                }); 
            	
            	$(".two-columns input[type=checkbox]:checked").each(function(index){
            		if(index != rads-1){
            			target_column +='t2.'+ $(this).val() + ',';
            		}else{
            			target_column +='t2.'+ $(this).val() ;
            		} 
                }); 
            	var sql = 'SELECT ' + target_column + ' FROM ' + tableNames[0].toUpperCase() +' t1,'+ tableNames[1].toUpperCase() +' t2' + ' WHERE 1=1 ';
                $('.one-conditions tr', modal).each(function (i, item) {
                    var relation = $('.relation', item).val();
                    var colName = 't1.' +$('.colName', item).val();
                    var condition = $('.condition', item).val();
                    var value = $('.value', item).val();
                    sql += relation + ' ' + colName + ' ' + condition + ' \'' + value + '\' ';
                });
                $('.two-conditions tr', modal).each(function (i, item) {
                    var relation = $('.relation', item).val();
                    var colName = 't2.' +$('.colName', item).val();
                    var condition = $('.condition', item).val();
                    var value = $('.value', item).val();
                    sql += relation + ' ' + colName + ' ' + condition + ' \'' + value + '\' ';
                });
                sql += 'AND t1.' +$('#twoTab_selects1').val()+ '=' + ' t2.' +$('#twoTab_selects2').val()+ '' 
            }else {
            	return;
            }
            $('textarea[name="sql"]', modal).val(sql);
            
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
        function generateOption(id,columns,colName ){
        	var html = '';
        	for (var i in columns) {
                var item = columns[i];
                html += '<option value="' + item.colName + '" ' + (item.colName === colName ? 'selected' : '') + '>' + item.colName + '</option>';
              }
        	$('#'+id).html(html);
        }
        function initModefy(){
        	$("#tabs li").each(function(index){
        		$(this).removeClass ("active") ;
        		if(index==tabCount){
        			$(this).addClass("active");
        		}
                
              })   ; 
        }
    </script>
</div>
</body>
</html>
