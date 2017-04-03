<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by Chen Yujian.
  Date: 2017/1/22
  Time: 14:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>大屏-工单服务监控视图</title>
</head>
<body>
<div class="page-header">
  <h3><span class="glyphicon glyphicon-th-large"></span> 大屏-工单服务监控视图</h3>
</div>
<div class="row">
  <div class="col-sm-6 col-md-6" id="system-1">
  </div>
  <div class="col-sm-6 col-md-6" id="system-2">
  </div>
</div>
<script src="s/echarts/echarts.min.js"></script>
<script>
  $(function() {
    $('#system-1, #system-2').height($(window).height() - 216);
    var myChart1 = echarts.init(document.getElementById('system-1'));
    myChart1.setOption({
      title: {
        text: '招生系统'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
          type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
      },
      legend: {data: ['总数', '未完成']},
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: [{
        type: 'category',
        data: ['硬件维护', '软件维护', '告警', '客服']
      }],
      yAxis: [{
        type: 'value'
      }],
      series: [{
        name: '总数',
        type: 'bar',
        data: [10, 62, 32, 53]
      }, {
        name: '未完成',
        type: 'bar',
        data: [8, 60, 15, 18]
      }]
    });

    var myChart2 = echarts.init(document.getElementById('system-2'));
    myChart2.setOption({
      title: {
        text: '总控平台'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
          type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
      },
      legend: {data: ['总数', '未完成']},
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: [{
        type: 'category',
        data: ['硬件维护', '软件维护', '告警', '客服']
      }],
      yAxis: [{
        type: 'value'
      }],
      series: [{
        name: '总数',
        type: 'bar',
        data: [86, 32, 45, 61]
      }, {
        name: '未完成',
        type: 'bar',
        data: [52, 18, 35, 61]
      }]
    });
  });
</script>
</body>
</html>