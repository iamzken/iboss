<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "bpm-console");%>
<%pageContext.setAttribute("currentMenu", "bpm-category");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.bpm-category.list.title" text="列表"/></title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'bpm-categoryGrid',
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
	gridFormId: 'bpm-categoryGridForm',
	exportUrl: 'bpm/bpm-category-export.do',
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
    <%@include file="/header/bpm-console.jsp"%>

    <div class="row-fluid" style="padding-top: 2em">
	  <%@include file="/menu/bpm-console.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="col-md-10">

          <form name="bpm-categoryForm" method="post" action="bpm/bpm-category-list.do#config&workflow" class="form-inline" style="margin-bottom:2em;">
              <div class="input-group input-group-sm">
                  <span class="input-group-addon"><spring:message code='bpm-category.bpm-category.list.search.name' text='名称'/>:</span>
                  <input type="text" id="bpm-category_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}" class="form-control">
              </div>
              <div class="input-group input-group-sm"><button class="btn btn-sm btn-primary" onclick="document.bpm-categoryForm.submit()">查询</button></div>
          </form>
      <%--<div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <button class="btn btn-default a-insert" onclick="location.href='bpm/bpm-category-input.do'">新建</button>
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

<form id="bpm-categoryGridForm" name="bpm-categoryGridForm" method='post' action="bpm/bpm-category-remove.do" class="m-form-blank">
      <div class="panel panel-default">
    <table id="bpmCategoryGrid" class="table table-hover">
      <thead>
        <tr class="info">
          <th width="10" style="text-indent:0px;text-align:center;"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
          <th class="sorting" name="id"><spring:message code="user.bpmCategory.list.id" text="编号"/></th>
          <th class="sorting" name="name"><spring:message code="user.bpmCategory.list.name" text="名称"/></th>
          <th class="sorting" name="priority">排序</th>
          <th width="100">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${page.result}" var="item">
        <tr>
          <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
          <td>${item.id}</td>
          <td>${item.name}</td>
          <td>${item.priority}</td>
          <td>
			<region:region-permission permission="bpmCategory:write">
            <a href="bpm/bpm-category-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
			</region:region-permission>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
      </div>
</form>

	  <div>
          <div class="pull-left" style="margin-right:5em;">
              <button class="btn btn-xs btn-primary a-insert" onclick="location.href='bpm/bpm-category-input.do#config&workflow'"><span class="glyphicon glyphicon-plus"></span></button>
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

