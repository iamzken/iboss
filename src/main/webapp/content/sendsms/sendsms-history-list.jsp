<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sendsms");%>
<%pageContext.setAttribute("currentMenu", "sendsms");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'smsHistoryGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_mobile': '${param.filter_LIKES_mobile}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'smsHistoryGridForm',
	exportUrl: 'sendsms-history-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});
    </script>
  </head>

  <body>
    <%--<%@include file="/header/sendsms.jsp"%>--%>

    <div class="row-fluid" style="padding-top:2em;">
	  <%--<%@include file="/menu/sendsms.jsp"%>--%>

	  <!-- start of main -->
      <section id="m-main" class="col-md-12">

          <form name="sendsms-configForm" method="post" action="sendsms-history-list.do" class="form-inline" style="margin-bottom: 2em">
              <div class="input-group input-group-sm">
                  <span class="input-group-addon"><spring:message code='sendsms-config.sendsms-config.list.search.name' text='名称'/>:</span>
                  <input type="text" id="sendsms-config_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}" class="form-control">
              </div>
              <div class="input-group input-group-sm"><button class="btn btn-sm btn-primary a-search" onclick="document.sendsms-configForm.submit()">查询</button>&nbsp;</div>
          </form>

      <%--<div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <!--
		  <button class="btn btn-default a-insert" onclick="location.href='sendsms-history-input.do'">新建</button>
		  <button class="btn btn-default a-remove" onclick="table.removeAll()">删除</button>
		  <button class="btn btn-default a-export" onclick="table.exportExcel()">导出</button>
		  -->
		</div>

		<div class="pull-right">
		  每页显示
		  <select class="m-page-size form-control" style="display:inline;width:auto;">
		    <option value="10">10</option>
		    <option value="20">20</option>
		    <option value="50">50</option>
		  </select>
		  条
        </div>

	    <div class="clearfix"></div>
	  </div>--%>

<form id="sendsms-configGridForm" name="sendsms-configGridForm" method='post' action="sendsms-history-remove.do" class="m-form-blank">
      <div class="panel panel-default">
<form id="smsHistoryGridForm" name="smsHistoryGridForm" method='post' action="sendsms-history-remove.do" class="m-form-blank">
  <table id="smsHistoryGrid" class="table table-hover">
    <thead>
      <tr class="info">
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th>编号</th>
        <th>创建时间</th>
        <th>手机</th>
        <th>信息</th>
        <th>状态</th>
        <th width="90">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
        <td>${item.id}</td>
        <td>${item.createTime}</td>
        <td>${item.mobile}</td>
        <td>${item.message}</td>
        <td>${item.status}</td>
        <td>
		  <a href="sendsms-history-view.do?id=${item.id}">查看</a>
		  &nbsp;
          <a href="sendsms-history-send.do?id=${item.id}">重发</a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>

      </div>
	  <div>
          <div class="pull-left" style="margin-right:5em;">
              <button class="btn btn-xs btn-primary a-insert" onclick="location.href='sendsms/sendsms-history-input.do#config&message'"><span class="glyphicon glyphicon-plus"></span></button>
              <button class="btn btn-xs btn-danger a-remove" onclick="table.removeAll()"><span class="glyphicon glyphicon-trash"></span></button>
          </div>
	    <div class="m-page-info pull-left">
		  共100条记录 显示1到10条记录
		</div>

		<div class="btn-group m-pagination pull-right">
		  <button class="btn btn-default">&lt;</button>
		  <button class="btn btn-default">1</button>
		  <button class="btn btn-default">&gt;</button>
		</div>

	    <div class="clearfix"></div>
      </div>

      <div class="m-spacer"></div>

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>

