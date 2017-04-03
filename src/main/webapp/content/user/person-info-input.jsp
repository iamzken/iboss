<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "user");%>
<%pageContext.setAttribute("currentMenu", "user");%>
<!doctype html>
<html>

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="user.user.input.title" text="编辑用户"/></title>
    <%@include file="/common/s3.jsp"%>
  </head>

  <body>
    

    <div class="row-fluid" style="padding-top: 2em">
	  <%--<%@include file="/menu/user.jsp"%>--%>

	<!-- start of main -->
      <section id="m-main" class="col-md-12">

      <div class="panel panel-default">
        <div class="panel-heading">
		  <i class="glyphicon glyphicon-list"></i>
		  <spring:message code="user.user.input.title" text="编辑用户"/>
		</div>

		<div class="panel-body">

<form id="userBaseForm" method="post" action="user/person-info-save.do#config&user" class="form-horizontal">
  <c:if test="${model != null}">
  <input id="userBase_id" type="hidden" name="id" value="${model.id}">
  </c:if>

    <div class="form-group">
        <label class="control-label col-md-1" for="userBase_gender">性别</label>
        <div class="col-sm-5">
            <select name="gender" id="userBase_gender" class="form-control required">
                <option value="男" <c:if test="${model.gender eq '男'}">selected</c:if>>男</option>
                <option value="女" <c:if test="${model.gender eq '女'}">selected</c:if>>女</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-1" for="userBase_email">分机</label>
        <div class="col-sm-5">
            <input id="userBase_im" type="text" name="im" value="${model.im}" size="40" class="form-control required" minlength="2" maxlength="50">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-1" for="userBase_telephone">部门电话</label>
        <div class="col-sm-5">
            <input id="userBase_telephone" type="text" name="telephone" value="${model.telephone}" size="40" class="form-control required" minlength="2" maxlength="50">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-1" for="userBase_cellphone">移动电话</label>
        <div class="col-sm-5">
            <input id="userBase_cellphone" type="text" name="cellphone" value="${model.cellphone}" size="40" class="form-control required" minlength="2" maxlength="50">
        </div>
    </div>

  <div class="form-group">
    <label class="control-label col-md-1" for="userBase_email">电子邮箱</label>
	<div class="col-sm-5">
	  <input id="userBase_email" type="text" name="email" value="${model.email}" size="40" class="form-control required" minlength="2" maxlength="50">
    </div>
  </div>

  <div class="form-group">
    <div class="col-md-offset-1 col-md-11">
      <button id="submitButton" class="btn btn-default a-submit"><spring:message code='core.input.save' text='保存'/></button>
      <button type="button" onclick="history.back();" class="btn btn-link a-cancel"><spring:message code='core.input.back' text='返回'/></button>
    </div>
  </div>
</form>
		</div>
      </div>

    </section>
	<!-- end of main -->
	</div>

  </body>

</html>
