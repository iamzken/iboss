<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "auth");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.role-viewList.list.title" text="列表"/></title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'role-viewListGrid',
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
	gridFormId: 'role-viewListGridForm',
	exportUrl: 'role-viewList-export.do',
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

  <form name="role-viewListForm" method="post" action="auth/role-viewList.do#config&role" class="form-inline" style="margin-bottom: 2em;">
      <div class="input-group input-group-sm">
          <span class="input-group-addon"><spring:message code='role-viewList.role-viewList.list.search.name' text='名称'/>:</span>
          <input type="text" id="role-viewList_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}" class="form-control">
      </div>
      <div class="input-group input-group-sm"><button class="btn btn-sm btn-primary" onclick="document.role-viewListForm.submit()">查询</button></div>
  </form>
      <%--<div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <button class="btn btn-default a-insert" onclick="location.href='role-viewInput.do'">新建</button>
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

<form id="role-viewListGridForm" name="role-viewListGridForm" method='post' action="auth/role-remove.do" class="m-form-blank">
      <div class="panel panel-default">
    <table id="roleGrid" class="table table-hover">
      <thead>
        <tr class="info">
          <th width="10" class="table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
          <th class="sorting" name="id"><spring:message code="auth.role.list.id" text="角色ID"/></th>
          <th class="sorting" name="name"><spring:message code="auth.role.list.name" text="角色名"/></th>
            <th>所属分类</th>
            <th>状态</th>
          <th width="150">操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${page.result}" var="item">
        <tr>
          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
            <td>${item.code}</td>
          <td>${item.name}</td>
            <td>
                <c:if test="${item.category eq 1}">管理</c:if>
                <c:if test="${item.category eq 2}">运维</c:if>
                <c:if test="${item.category eq 3}">服务对象</c:if>
            </td>
            <td>${item.state eq 1 ? '有效' : '无效'}</td>
          <td>
			<tags:hasPerm value="role:write">
            <a href="auth/role-viewInput.do?id=${item.id}#config&role" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
			</tags:hasPerm>
			<%--<tags:hasPerm value="role:auth">
            <a href="auth/role-perm-input.do?id=${item.id}#config&role" class="a-config"><spring:message code="auth.roleDef.list.perm" text="设置权限"/></a>
			</tags:hasPerm>--%>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>


      </div>
</form>

	  <div>
      <div class="pull-left" style="margin-right:5em;">
          <button class="btn btn-xs btn-primary a-insert" onclick="location.href='auth/role-viewInput.do#config&role'"><span class="glyphicon glyphicon-plus"></span></button>
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

