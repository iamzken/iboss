<%--
  Created by Chen Yujian.
  Date: 2016/7/18
  Time: 16:34
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-backdrop fade devaeye-table-backdrop">
  <div class="spinner">
    <div class="bounce1"></div>
    <div class="bounce2"></div>
    <div class="bounce3"></div>
  </div>
</div>
<div class="container-fluid devaeye-table-footer">
  <div class="col-md-4 table-footer-left">
    <button type="button" class="btn btn-primary btn-xs btn-footer-add"><span class="glyphicon glyphicon-plus"></span></button>
  </div>
  <nav class="col-md-4">
    <ul class="pagination pagination-sm">
      <li class="first"><a href="javascript:void(0);" data-event="first" title="第一页"><span aria-hidden="true" class="glyphicon glyphicon-step-backward"></span></a></li>
      <li class="previous"><a href="javascript:void(0);" data-event="previous" title="上一页"><span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span></a></li>
      <li><input type="text" class="footer-jump" data-event="jump" placeholder="第几页"></li>
      <li class="next"><a href="javascript:void(0);" data-event="next" title="下一页"><span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a></li>
      <li class="last"><a href="javascript:void(0);" data-event="last" title="最后一页"><span aria-hidden="true" class="glyphicon glyphicon-step-forward"></span></a></li>
    </ul>
  </nav>
  <div class="col-md-4 table-footer-right">
    当前第 <span class="footer-number"></span> / <span class="footer-total-pages"></span> 页，每页<span class="footer-size"></span>条记录，共<span class="footer-total-elements"></span>条记录。
  </div>
</div>

<div class="modal fade" id="devaeye-table-modal" tabindex="-1" role="dialog" aria-labelledby="devaeye-table-modal-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="devaeye-table-modal-label">Modal title</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
