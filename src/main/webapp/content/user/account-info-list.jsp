<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "user");%>
<%pageContext.setAttribute("currentMenu", "user");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="user.user.list.title" text="用户列表"/></title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'userGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_username': '${param.filter_LIKES_username}',
        'filter_EQS_status': '${param.filter_EQS_status}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'pimRemindGridForm',
	exportUrl: 'account-info-export.do',
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
    

    <div class="row-fluid" style="padding-top: 2em">
	  <%--<%@include file="/menu/user.jsp"%>--%>

	<!-- start of main -->
      <section id="m-main" class="col-md-12">

      <form name="userForm" method="post" action="${tenantPrefix}/user/account-info-list.do#config&user" class="form-inline">
          <div class="input-group input-group-sm">
              <span class="input-group-addon"><spring:message code='user.user.list.search.username' text='用户ID'/>:</span>
              <input type="text" id="user_username" name="filter_LIKES_username" value="${param.filter_LIKES_username}" class="form-control">
          </div>
          <div class="input-group input-group-sm">
              <span class="input-group-addon"><spring:message code='user.user.list.search.displayName' text='用户姓名'/>:</span>
              <input type="text" id="user_displayName" name="filter_LIKES_displayName" value="${param.filter_LIKES_displayName}" class="form-control">
          </div>
          <div class="input-group input-group-sm">
              <span class="input-group-addon"><spring:message code='user.user.list.search.status' text='状态'/>:</span>
              <select id="user_enabled" name="filter_EQS_status" class="form-control">
                  <option value="">全部</option>
                  <option value="active" ${param.filter_EQS_status == 'active' ? 'selected' : ''}><spring:message code='user.user.list.search.enabled.true' text='启用'/></option>
                  <option value="disabled" ${param.filter_EQS_status == 'disabled' ? 'selected' : ''}><spring:message code='user.user.list.search.enabled.false' text='禁用'/></option>
              </select>
          </div>
          <div class="input-group input-group-sm"><button class="btn btn-sm btn-primary" onclick="document.userForm.submit()">查询</button></div>
      </form>

      <div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <!--
		  <button class="btn btn-default a-remove" onclick="table.removeAll()">删除</button>
		  <button class="btn btn-default a-export" onclick="table.exportExcel()">导出</button>
		  -->
		</div>

		<%--<div class="pull-right">
		  每页显示
		  <select class="m-page-size form-control" style="display:inline;width:auto;">
		    <option value="10">10</option>
		    <option value="20">20</option>
		    <option value="50">50</option>
		  </select>
		  条
        </div>--%>

	    <div class="clearfix"></div>
	  </div>
	  
<form id="pimRemindGridForm" name="pimRemindGridForm" method='post' action="${tenantPrefix}/user/account-info-remove.do" class="m-form-blank">
      <div class="panel panel-default">
  <table id="userGrid" class="table table-hover">
    <thead>
    <tr class="info">
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th class="sorting" name="username"><spring:message code="user.user.list.username" text="用户ID"/></th>
        <th class="sorting" name="displayName">用户姓名</th>
        <%--<th class="sorting" name="createTime">类型</th>--%>
        <th class="sorting" name="status"><spring:message code="user.user.list.status" text="状态"/></th>
        <th class="sorting" name="gender">性别</th>
        <th class="sorting" name="extension">分机</th>
        <th class="sorting" name="deptTel">部门电话</th>
        <th class="sorting" name="mobilePhone">移动电话</th>
        <th class="sorting" name="email">电子邮箱</th>
        <th>角色</th>
        <th>&nbsp;</th>
    </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
        <td>${item.username}</td>
        <td>${item.displayName}</td>
        <%--<td>${item.type}</td>--%>
        <td>
		  <c:if test="${item.status=='active'}">
		    <span style="color:green;">启用</span>(<a href="${tenantPrefix}/user/account-info-disable.do?id=${item.id}#config&user">禁用</a>)
		  </c:if>
		  <c:if test="${item.status=='disabled'}">
		    <span style="color:red;">禁用</span>(<a href="${tenantPrefix}/user/account-info-active.do?id=${item.id}#config&user">启用</a>)
		  </c:if>
		</td>
        <%--<td><fmt:formatDate value="${item.createTime}" type="both"/></td>--%>
          <td>${item.info.gender}</td>
          <td>${item.info.im}</td>
          <td>${item.info.telephone}</td>
          <td>${item.info.cellphone}</td>
          <td>${item.info.email}</td>
          <td>${item.authorities}</td>
        <td>
          <a href="${tenantPrefix}/user/account-info-input.do?id=${item.id}#config&user" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
          <%--<a href="${tenantPrefix}/user/person-info-account-input.do?code=${item.id}#config&user">详细信息</a>--%>
            <tags:hasPerm value="user:auth">
                <a href="auth/user-connector-configRole.do?ref=${item.id}#config&user" class="a-update"><spring:message code="user.user.list.role" text="设置权限"/></a>
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
              <button class="btn btn-xs btn-primary a-insert" onclick="location.href='${tenantPrefix}/user/account-info-input.do#config&user'"><span class="glyphicon glyphicon-plus"></span></button>
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

    </section>
	<!-- end of main -->
	</div>

  </body>

</html>
