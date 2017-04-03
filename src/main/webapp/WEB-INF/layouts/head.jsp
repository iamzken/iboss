<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!--head begin-->
    	<div class="w-head clearfix">
<%--     		<div class="w-h-l">
    			<img src="${ctx}/static/res/resource/style/css/images/logo.png" class="logo">
    		</div> --%>
    		<div class="w-h-c">
    			<span class="swipmenuleft" id="swipmenuleft"></span>
				<div class="menuTotalWidth">
					<ul id="headMenu" class="headMenu">
						<shiro:hasRole name="角色1">
							<li id="workMenu"  title="工作台"  onclick="toDisplay('workMenu')" >
								<a><i class="tz"></i><span>工作台</span></a>
							</li>
						</shiro:hasRole>
						<shiro:hasPermission name="/department/index">
							<li id="departmentMenu"  title="部门信息" onclick="toDisplay('departmentMenu')">
								<a ><i class="tz"></i><span>部门信息</span></a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="/users/index">
							<li id="userMenu" title="人员信息" onclick="toDisplay('userMenu')">
								<a href="#"><i class="tz"></i><span>人员信息</span></a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="/jobs/index">
							<li id="jobMenu" title="任务管理" onclick="toDisplay('jobMenu')">
								<a href="#"><i class="tz"></i><span>任务管理</span></a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="/examples/index">
							<li id="examplesMenu" title="功能点"  onclick="toDisplay('examplesMenu')" >
								<a href="#"><i class="tz"></i><span>功能点</span></a>
							</li>
						</shiro:hasPermission>
							<li id="mxgl" title="流程模型管理" 	onclick="toDisplay('module')">
								<a href="#"><i class="tz"></i><span>流程模型管理</span></a>
							</li>
							<!-- <li id="answerOfQuestionMenu" title="业务解决方案"  onclick="toDisplay('answerOfQuestionMenu')">
								<a href="#"><i class="tz"></i><span>业务解决方案</span></a>
							</li> -->
							<%--<li id="businessManagerMenu" title="业务方案管理"  	onclick="toDisplay('businessManagerMenu')">
								<a href="#"><i class="tz"></i><span>业务方案管理</span></a>
							</li>--%>
							<!--
							<li id="processTraceMenu" title="流程跟踪" onclick="toDisplay('processTraceMenu')">
								<a href="#"><i class="tz"></i><span>流程跟踪</span> </a>
							</li>
							-->
							<li id="mytaskMenu" title="我的列表"  	onclick="toDisplay('mytaskMenu')" >
								<a href="#"><i class="tz"></i><span>我的任务</span></a>
							</li>							
							<li id="processManagerMenu" title="流程管理" onclick="toDisplay('processManagerMenu')">
								<a href="#"><i class="tz"></i><span>流程管理</span></a>
							</li>
							<li id="processStartManagerMenu" title="流程启动" onclick="toDisplay('processStartManagerMenu')">
								<a href="#"><i class="tz"></i><span>流程启动</span></a>
							</li>
							<li id="draftBox" title="草稿箱" onclick="toDisplay('draftBox')">
								<a href="#"><i class="tz"></i><span>草稿箱</span></a>
							</li>
							<li id="auth4Menu" 	title="系统管理平台功能点"  onclick="toDisplay('auth4Menu')" >
								<a href="#"><i class="tz"></i><span>系统管理平台</span></a>
							</li>
							<li id="calendarManagerMenu" title="日历管理" onclick="toDisplay('calendarManagerMenu')">
								<a href="#"><i class="tz"></i><span>日历管理</span></a>
							</li>
							<!-- <li id="formManagerMenu" title="表单示例" onclick="toDisplay('formManagerMenu')">
								<a href="#"><i class="tz"></i><span>表单示例</span></a>
							</li> -->
					</ul>
				</div>
				<span class="swipmenuright" id="swipmenuright"></span>
	    	</div>
    		<div class="w-h-r">

    			<div class="userboxShow">
    				<div class="usernameShow">
    					<span class="userIconspan"></span>
    					<span class="userlengh">
    				<shiro:user><shiro:principal property="userName"/></shiro:user></span>
    					<span class="dropIconspan down" id="c_drop"></span>
    				</div>
    				<div class="topicBox">
    					<ul>
    						<li id="headEditPwd" onclick="changePwd();">修改密码</li>
    						<li id="c_logout" onclick="logout();">退出系统</li>
    					</ul>
    				</div>
    			</div>

    			<div class="dropsel">
    				
    			</div>


    		</div>
    	</div>
	
    	<!--head end-->
	<cui:dialog id="changePwdDialog"  width="400" height="500" maximizable="false" autoOpen="false" closable="false">
		
</cui:dialog>
<script type="text/javascript">

	
function changePwd(){
	$("#changePwdDialog").dialog("option", {
		title : "查看",
		subTitle : "部门信息",
		asyncType : "get",
		url : "${ctx}/users/changePwdPage"
	});
	$("#changePwdDialog").dialog("open");
}


	//页面加载完毕后获取下拉框的value值
	$(function(){
		$('.dropsel .coral-combo-arrow').click(function(){
			//选择下拉框样式
			$('#combobox_i1_0').parents('.coral-combo-panel').css('border','0');
		})

		//退出系统
		$('.userboxShow').mouseover(function(e){
			e.stopPropagation();
			$('.dropIconspan').addClass('up').removeClass('down');
			$('.topicBox').show();
		}).mouseleave(function(){
			$('.dropIconspan').addClass('down').removeClass('up');
			$('.topicBox').hide();
		})

		//菜单 多余
		$('.siteMaintenance').mouseover(function(){
			$(this).children('.droparrow').addClass('up2').removeClass('down2');
			$('.moremenudrop').show();
		}).mouseleave(function(){
			$(this).children('.droparrow').addClass('down2').removeClass('up2');
			$('.moremenudrop').hide();
		})

	});

	function logout(){
		$.confirm("确定要退出系统吗？", function(r) {
			if (r) {
				window.location.href="${ctx}/logout";
			}
		});
	}
	
	
	
	//菜单做有切换
	$(function(){
		//$('#headMenu').css('margin-left','-520px');
		//根据current的位置计算出 marginLeft 的值
		
		setTimeout(function(){
			
			marginLeft();
			swipmenu();
		},200);
		
		function marginLeft(){
			//获取当前对象的索引值 从0开始 +1
			var currentLi = $('#headMenu li.current').index() + 1;
			var currentLiWidth = currentLi * $('#headMenu li').width();
			var menuTotalWidth  = parseInt($('.menuTotalWidth').width());
			var ml;
			/*if(currentLiWidth <= menuTotalWidth){
				ml = 50;
			}*/
			if(currentLiWidth > menuTotalWidth){
				if (currentLiWidth - menuTotalWidth <= menuTotalWidth){
					ml = menuTotalWidth;
				}else {
					ml = currentLiWidth - menuTotalWidth;
				}
				
			}
			$('#headMenu').css('margin-left', - ml);
		}
		
	})
	var swipmenu = function(){
		
		var headmenulength,headMenu,headMenuRegionWidth,leftOffset;
		globalwidth();
		function globalwidth(){
			headmenulength = $('.headMenu').find('li').length;
			headMenu = parseInt($('#headMenu li').width()) * headmenulength; // 整个工具条总宽度
			$('#headMenu').width(headMenu);
			headMenuRegionWidth = parseInt($('.menuTotalWidth').width() ); //外边框宽度
		}
		
		
		var canMoveRight = false; // 是否可以向右移动
		var canMoveLeft = false; // 是否可以向左移动
		var isMoving = false;

		var speed = 300; //移动速度
		
		var moveDis; //移动距离


		/**
		 * 检查图片缩略图边界.
		 */
		 function checkToolRange2(){
		//var checkToolRange2 = function(){
			leftOffset = parseInt($('#headMenu').css('margin-left')); // 偏移量
			//console.log(leftOffset);
			if (leftOffset + headMenu <= headMenuRegionWidth) {
				// 右边界超出
				leftOffset = headMenuRegionWidth - headMenu;
				canMoveRight = false;

				// 图片缩略图已经在最右侧，不能再向右移了
				$('#swipmenuright').hide();
			} else {
				canMoveRight = true;

				$('#swipmenuright').show();
			}

			if (leftOffset >= 0) {

				// 左边界超出
				leftOffset = 0;
				canMoveLeft = false;

				// 图片缩略图已经在最左侧，不能再向左移了
				$('#swipmenuleft').hide();
			} else {
				canMoveLeft = true;

				$('#swipmenuleft').show();
			}

			$('#headMenu').css('marginLeft',leftOffset+'px');

			isMoving = false;
		};


		checkToolRange2();
		

		/**
		 * 右箭头点击事件处理函数
		 */
		$('body').on('click','#swipmenuright',function(){

			if (!canMoveRight || isMoving) return;
			
			if($('#swipmenuright').hasClass('swipmenurightGrey')){
				return;
			}
			isMoving = true;
			var leftOffset = parseInt($('#headMenu').css('margin-left')); // 偏移量
			var temp = leftOffset + headMenu - headMenuRegionWidth;
			if( temp < headMenuRegionWidth){
				moveDis =  temp;
			}else{
				moveDis = headMenuRegionWidth;
			}

			$('#headMenu').animate({marginLeft:'-=' + moveDis + 'px'},speed,function(){
				checkToolRange2();
			});
			
		});

		/**
		 * 左箭头点击事件处理函数
		 */
		$('body').on('click','#swipmenuleft',function(){
			if (!canMoveLeft || isMoving) return;
			
			if($('#swipmenuleft').hasClass('swipmenuleftGrey')){
				return;
			}

			isMoving = true;
			var leftOffset = parseInt($('#headMenu').css('margin-left')); // 偏移量
			var temp = Math.abs(leftOffset);
			if( temp < headMenuRegionWidth){
				moveDis =  temp;
			}else{
				moveDis = headMenuRegionWidth;
			}

			$('#headMenu').animate({marginLeft:'+=' + moveDis + 'px'},speed,function(){checkToolRange2();});
		});


		$(window).resize(function(){
			setTimeout(function(){
				globalwidth();
				checkToolRange2();
			},200);
			
		});
	}

	//滚轮事件
	//mousewheel ie chrome
	//DOMMouseScroll firefox
	$('.menuTotalWidth').bind("mousewheel DOMMouseScroll", function (e) {
	//$('body').bind("mousewheel DOMMouseScroll",'#pic-sign-img', function (e) {
	    
	    var delta = (e.originalEvent.wheelDelta && (e.originalEvent.wheelDelta > 0 ? 1 : -1)) ||  // chrome & ie
	                (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));              // firefox
	
	    if (delta > 0) {
	        // 向上滚
	        //console.log("wheelup");
	    	$('#swipmenuleft').click();
	    } else if (delta < 0) {
	        // 向下滚
	        //console.log("wheeldown");
	    	$('#swipmenuright').click();
	    }
	});

	
	
	function toDisplay(name){
		var panel = $("#coralui-layout").layout("panel","center");
		
		if(name == "module"){
			panel.panel("refresh", "${ctx}/cesModeler/index");
		}
		else if(name == "workMenu"){
			panel.panel("refresh", "${ctx}/work/index");
		}
		else if(name == "departmentMenu"){
			panel.panel("refresh", "${ctx}/department/index");
		}
		else if(name == "userMenu"){
			panel.panel("refresh", "${ctx}/users/index");
		}
		else if(name == "jobMenu"){
			panel.panel("refresh", "${ctx}/jobs/index");
		}
		else if(name == "examplesMenu"){
			panel.panel("refresh", "${ctx}/examples/index");
		}
		else if(name == "auth4Menu"){
			panel.panel("refresh", "${ctx}/auth4/index");
		}else  if(name == "mytaskMenu"){
			panel.panel("refresh","${ctx}/ces-humantask/index");
		}
		//else if(name == "answerOfQuestionMenu"){
		//	panel.panel("refresh","${ctx}/answer/index");
		//}
		//else if(name == "businessManagerMenu"){
		//	panel.panel("refresh","${ctx}/ces-business/index");
		//}
		//else if(name == "processTraceMenu"){
		//	panel.panel("refresh","${ctx}/ces-process-trace/index");
		//}
		else if(name == "draftBox"){
			panel.panel("refresh","${ctx}/draftBox/index");
		}
		else if(name == "processManagerMenu"){
			panel.panel("refresh","${ctx}/ces-process-manage/index");
		}else if(name == "calendarManagerMenu"){
			panel.panel("refresh","${ctx}/pimSchedule/index");
		}/* else if(name == "formManagerMenu"){
			panel.panel("refresh","${ctx}/formDemo/index");
		} */else if(name == "processStartManagerMenu"){
			panel.panel("refresh","${ctx}/processStartup/index");
		}
	}
	
</script>
