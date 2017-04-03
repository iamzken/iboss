<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "auth");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.user-connector.list.title" text="列表"/></title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'user-connectorGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'user-connectorGridForm',
	exportUrl: 'user-connector-export.do',
    hash: window.location.hash
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
    <%--<%@include file="/header/auth.jsp"%>--%>

    <div class="row-fluid" style="padding-top: 2em;">
	  <%--<%@include file="/menu/auth.jsp"%>--%>

	  <!-- start of main -->
      <section id="m-main" class="col-md-12">

      <form name="user-connectorForm" method="post" action="auth/user-connector-list.do#config&user" class="form-inline" style="margin-bottom: 2em;">

          <div class="input-group input-group-sm">
              <span class="input-group-addon"><spring:message code='user-connector.user-connector.list.search.name' text='名称'/>:</span>
              <input type="text" id="user-connector_name" name="filter_LIKES_username" value="${param.filter_LIKES_name}" class="form-control">
          </div>
          <div class="input-group input-group-sm"><button class="btn btn-sm btn-primary" onclick="document.user-connectorForm.submit()">查询</button></div>
      </form>

      <%--<div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <button class="btn btn-default a-insert" onclick="location.href='user-connector-input.do'">新建</button>
		  <button class="btn btn-default a-remove" onclick="table.removeAll()">删除</button>
		  <button class="btn btn-default a-export" onclick="table.exportExcel()">导出</button>
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

<form id="user-connectorGridForm" name="user-connectorGridForm" method='post' action="auth/user-connector-remove.do#config&user" class="m-form-blank">
      <div class="panel panel-default">
        <%--<div class="panel-heading">
		  <i class="glyphicon glyphicon-list"></i>
		  <spring:message code="scope-info.scope-info.list.title" text="列表"/>
		</div>--%>


  <table id="userGrid" class="table table-hover">
    <thead>
      <tr class="info">
          <th width="10" class="table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th class="sorting" name="username"><spring:message code="user.user.list.username" text="账号"/></th>
        <th name="password"><spring:message code="user.user.list.password" text="密码"/></th>
        <th class="sorting" name="status"><spring:message code="user.user.list.status" text="状态"/></th>
        <th name="description"><spring:message code="user.user.list.authorities" text="权限"/></th>
        <th width="150">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
        <td>${item.username}</td>
        <td>[protected]</td>
        <td>${item.enabled ? '启用' : '禁用'}</td>
        <td>${item.authorities}</td>
        <td>
			<tags:hasPerm value="user:auth">
            <a href="auth/user-connector-configRole.do?ref=${item.ref}#config&user" class="a-update"><spring:message code="user.user.list.role" text="设置权限"/></a>
			</tags:hasPerm>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>


      </div>
</form>

	  <div>
          <div class="pull-left" style="margin-right:5em;">
              <button class="btn btn-xs btn-primary a-insert" onclick="location.href='user/account-info-input.do#config&user'"><span class="glyphicon glyphicon-plus"></span></button>
              <button class="btn btn-xs btn-danger a-insert" onclick="table.removeAll()"><span class="glyphicon glyphicon-trash"></span></button>
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

