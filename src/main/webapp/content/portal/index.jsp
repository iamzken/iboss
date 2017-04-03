<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <link href="s/fullcalendar/fullcalendar.min.css" rel="stylesheet">
  <title>工作台</title>
  <style>
    #content {
      background-color: rgba(242, 242, 242, 1);
    }
    .list-group-item span {
      margin-right: 4em;
    }
    .list-group-item span:last-child {
      margin-right: 0;
    }
  </style>
</head>
<body>
<div class="row">
  <div class="col-sm-6 col-md-3">
    <div class="panel panel-info">
      <div class="panel-heading">
        <a href="javascript:void(0)" class="pull-right"><span class="glyphicon glyphicon-cog"></span></a>
        <h3 class="panel-title"><span class="glyphicon glyphicon-circle-arrow-right"></span> 快速入口</h3>
      </div>
      <ul class="list-group">
        <li class="list-group-item">工单查询</li>
        <li class="list-group-item">投诉管理</li>
        <li class="list-group-item">告警管理</li>
        <li class="list-group-item">短信群发</li>
        <li class="list-group-item">我的维护计划</li>
        <li class="list-group-item">知识库高级搜索</li>
      </ul>
    </div>
    <div class="panel panel-info">
      <div class="panel-heading">
        <a href="javascript:void(0)" class="pull-right"><span class="glyphicon glyphicon-align-justify"></span></a>
        <h3 class="panel-title"><span class="glyphicon glyphicon-list-alt"></span> 公告栏</h3>
      </div>
      <ul class="list-group">
        <li class="list-group-item">2013/12招生总结结果已出台</li>
        <li class="list-group-item">2013/12招生总结结果已出台</li>
        <li class="list-group-item">2013/12招生总结结果已出台</li>
        <li class="list-group-item">2013/12招生总结结果已出台</li>
        <li class="list-group-item">2013/12招生总结结果已出台</li>
      </ul>
    </div>
  </div>
  <div class="col-sm-12 col-md-6">
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title"><span class="glyphicon glyphicon-tasks"></span> 我的待处理任务</h3>
      </div>
      <div class="panel-body">
        <h5 style="font-weight: bold;"><span class="glyphicon glyphicon-th-large"></span> 学籍系统</h5>
        <ul class="list-group">
          <li class="list-group-item">
            告警计划：
            <span><label style="color: #ff0000;">紧急</label><a href="#">1件</a></span>
            <span><label>重要</label><a href="#">12件</a></span>
            <span><label>次要</label><a href="#">13件</a></span>
            <span><label>提示</label><a href="#">14件</a></span>
          </li>
          <li class="list-group-item">维护计划：
            <span><label>今天</label><a href="#">12件</a></span>
            <span><label>明天</label><a href="#">13件</a></span>
            <span><label>后天</label><a href="#">14件</a></span>
          </li>
          <li class="list-group-item">工单处理：
            <span><label>执行中</label><a href="#">14件</a></span>
          </li>
        </ul>
        <h5 style="font-weight: bold;"><span class="glyphicon glyphicon-th-large"></span> 招生系统</h5>
        <ul class="list-group">
          <li class="list-group-item">
            告警计划：
            <span><label style="color: #ff0000;">紧急</label><a href="#">1件</a></span>
            <span><label>重要</label><a href="#">12件</a></span>
            <span><label>次要</label><a href="#">13件</a></span>
            <span><label>提示</label><a href="#">14件</a></span>
          </li>
          <li class="list-group-item">维护计划：
            <span><label>今天</label><a href="#">12件</a></span>
            <span><label>明天</label><a href="#">13件</a></span>
            <span><label>后天</label><a href="#">14件</a></span>
          </li>
          <li class="list-group-item">工单处理：
            <span><label>执行中</label><a href="#">14件</a></span>
          </li>
        </ul>
      </div>
    </div>
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title"><span class="glyphicon glyphicon-signal"></span> 绩效统计</h3>
      </div>
      <div id="statistics" style="height: 300px">
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">我的日程（12月）</h3>
      </div>
      <div id="calendar">
      </div>
    </div>
    <div class="panel panel-info">
      <div class="panel-heading">
        <a href="javascript:void(0)" class="pull-right"><span class="glyphicon glyphicon-align-justify"></span></a>
        <h3 class="panel-title"><span class="glyphicon glyphicon-book"></span> 用户指导</h3>
      </div>
      <ul class="list-group">
        <li class="list-group-item">关于学籍系统运维措施的实施方案总结</li>
        <li class="list-group-item">关于学籍系统运维措施的实施方案总结</li>
        <li class="list-group-item">关于学籍系统运维措施的实施方案总结</li>
      </ul>
    </div>
  </div>
</div>
<script src="s/fullcalendar/moment.min.js"></script>
<script src="s/fullcalendar/fullcalendar.min.js"></script>
<script src="s/fullcalendar/zh-CN.js"></script>
<script src="s/echarts/echarts.min.js"></script>
<script>
  $(function() {
    $('#calendar').fullCalendar({
      header: false/*{
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      }*/,
      defaultDate: '2017-01-01',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: '',
          start: '2017-01-01'
        },
        {
          title: 'Long Event',
          start: '2016-12-07',
          end: '2016-12-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2016-12-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2016-12-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2016-12-11',
          end: '2016-12-13'
        },
        {
          title: 'Meeting',
          start: '2016-12-12T10:30:00',
          end: '2016-12-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2016-12-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2016-12-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2016-12-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2016-12-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2016-12-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2016-12-28'
        }
      ]
    });

    // 绩效统计柱状图
    var myChart = echarts.init(document.getElementById('statistics'));
    myChart.setOption({
      color: ['#3398DB'],
      tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
          type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis : [
        {
          type : 'category',
          data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          axisTick: {
            alignWithLabel: true
          }
        }
      ],
      yAxis : [
        {
          type : 'value'
        }
      ],
      series : [
        {
          name:'直接访问',
          type:'bar',
          barWidth: '60%',
          data:[10, 52, 200, 334, 390, 330, 220]
        }
      ]
    });
  });
</script>
</body>
</html>
<%--
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "dashboard");%>
<%pageContext.setAttribute("currentMenu", "dashboard");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>portal</title>
	<%@include file="/common/s3.jsp"%>

    <script src='${tenantPrefix}/widgets/portal/dashboard.js' type='text/javascript'></script>
    <link rel='stylesheet' href='${tenantPrefix}/widgets/portal/dashboard.css' type='text/css' media='screen' />
    <script type="text/javascript" src="${tenantPrefix}/widgets/portal/portal.js"></script>

  </head>

  <body>
    <%@include file="/header/portal.jsp"%>
  
    <div data-height="300" class="container-fluid dashboard dashboard-draggable" id="dashboard" style="margin-top:70px;">
      <header></header>
      <section class="row">
<c:forEach items="${map}" var="entry">
        <div class="portal-col col-md-4 col-sm-6" data-id="${entry.key}" data-order="${entry.key}">
  <c:forEach items="${entry.value}" var="item">
		<div data-id="${item.id}" class="portlet" data-order="${item.rowIndex}">
          <div data-url="${tenantPrefix}${item.portalWidget.url}" class="panel panel-default" id="panel${item.id}" data-id="${item.id}">
            <div class="panel-heading">
              <div class="panel-actions">
                <button class="btn btn-sm refresh-panel"><i class="glyphicon glyphicon-refresh"></i></button>
                <div class="dropdown">
                  <button data-toggle="dropdown" class="btn btn-sm" role="button"><span class="caret"></span></button>
                  <ul aria-labelledby="dropdownMenu1" role="menu" class="dropdown-menu">
                    <li><a href="javascript:void(0);updateWidget(${item.id}, ${item.portalWidget.id}, '${item.name}')"><i class="glyphicon glyphicon-pencil"></i> 编辑</a></li>
                    <li><a class="remove-panel" href="#"><i class="glyphicon glyphicon-remove"></i> 移除</a></li>
                  </ul>
                </div>
              </div>
		      <i class="glyphicon glyphicon-list"></i> ${item.name}
            </div>
            <div class="panel-body">
		      <table class="table table-hover">
			    <thead>
			      <tr>
				    <th>编号</th>
				    <th>名称</th>
				    <th>创建时间</th>
				    <th>&nbsp;</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach items="${personalTasks.result}" var="item">
			      <tr>
				    <td>${item.id}</td>
				    <td>${item.name}</td>
				    <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				    <td>
				      <a href="${tenantPrefix}/operation/task-operation-viewTaskForm.do?humanTaskId=${item.id}" class="btn btn-xs btn-primary">处理</a>
				    </td>
			      </tr>
			    </c:forEach>
			    </tbody>
		      </table>
            </div>
          </div>
        </div>
  </c:forEach>
		</div>
</c:forEach>

      </section>
    </div>

<div id="widgetModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑组件</h4>
      </div>
      <div class="modal-body">
	    <form id="widgetForm" action="save.do" method="post">
		  <input id="portalItemId" type="hidden" name="id" value="">
		  <div class="form-group">
			<label for="portalWidgetId">组件</label>
		    <select id="portalWidgetId" class="form-control" name="portalWidgetId">
		      <c:forEach items="${portalWidgets}" var="item">
			  <option value="${item.id}">${item.name}</option>
			  </c:forEach>
		    </select>
		  </div>
		  <div class="form-group">
			<label for="portalItemName">标题</label>
		    <input id="portalItemName" class="form-control" type="text" value="" name="portalItemName">
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="$('#widgetForm').submit();">保存</button>
      </div>
    </div>
  </div>
</div>

    <div class="text-center">
	  &copy;Devaeye
    </div>
  </body>

</html>
--%>
