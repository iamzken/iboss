var menu = [{
    text: '首页',
    code: 'home',
    icon: 'theme/default/images/home.png',
    url: 'portal/index.do#home'
}, {
    text: '用户服务',
    code: 'user',
    icon: 'theme/default/images/user.png',
    url: '',
    children: [{
        text: '在线答疑',
        code: 'online-chat',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: 'FAQ',
        code: 'faq',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '问卷管理',
        code: 'questionnaire',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '投诉管理',
        code: 'complain',
        icon: 'theme/default/images/home.png',
        url: ''
    }]
}, {
    text: '监控中心',
    code: 'monitor',
    icon: 'theme/default/images/monitor.png',
    url: 'alarm/target.do#monitor&alarm-target',
    children: [{
        text: '告警管理',
        code: 'alarm-manage',
        icon: 'theme/default/images/alarm-manage.png',
        url: 'alarm/manage.do#monitor&alarm-manage'
    }, {
        text: '告警配置',
        code: 'alarm-config',
        icon: 'theme/default/images/alarm-config.png',
        url: 'alarm/config.do#monitor&alarm-config'
    }, {
        text: '告警指标',
        code: 'alarm-target',
        icon: 'theme/default/images/alarm-target.png',
        url: 'alarm/target.do#monitor&alarm-target'
    }, {
        text: '绩效指标',
        code: 'performance-quota',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '模版配置',
        code: 'performance-template',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '绩效报告',
        code: 'performance',
        icon: 'theme/default/images/home.png',
        url: ''
    }]
}, {
    text: '运维管理',
    code: 'operation',
    icon: 'theme/default/images/operation.png',
    url: 'work/order.do#operation&work-order',
    children: [{
        text: '维护计划',
        code: 'plan',
        icon: 'theme/default/images/operation-plan.png',
        url: ''
    }, {
        text: '当日维护',
        code: 'today',
        icon: 'theme/default/images/operation-today.png',
        url: ''
    }, {
        text: '我的维护',
        code: 'mine',
        icon: 'theme/default/images/operation-mine.png',
        url: ''
    }, {
        text: '分配班组',
        code: 'team',
        icon: 'theme/default/images/operation-team.png',
        url: ''
    }, {
        text: '排班值班',
        code: 'duty',
        icon: 'theme/default/images/operation-duty.png',
        url: ''
    }, {
        text: '我的值班',
        code: 'myduty',
        icon: 'theme/default/images/operation-myduty.png',
        url: ''
    }, {
        text: '工单管理',
        code: 'work-order',
        icon: 'theme/default/images/work-order.png',
        url: 'work/order.do#operation&work-order'
    }]
}, {
    text: '网元管理',
    code: 'ne',
    icon: 'theme/default/images/ne.png',
    url: 'ne/index.do#ne&ne',
    children: [{
        text: '网元管理',
        code: 'ne',
        icon: 'theme/default/images/ne.png',
        url: ''
    }]
}, {
    text: '运维资产',
    code: 'asset',
    icon: 'theme/default/images/asset.png',
    url: '',
    children: [{
        text: '进度管理',
        code: 'schedule',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '文档管理',
        code: 'doc',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '会议管理',
        code: 'meeting',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '通知公告',
        code: 'notice',
        icon: 'theme/default/images/home.png',
        url: ''
    }, {
        text: '知识库',
        code: 'knowledge',
        icon: 'theme/default/images/home.png',
        url: ''
    }]
}, {
    text: '通用配置',
    code: 'config',
    icon: 'theme/default/images/config.png',
    url: 'bpm/bpm-category-list.do#config&workflow',
    children: [{
        text: '用户管理',
        code: 'user',
        icon: 'theme/default/images/config-user.png',
        //url: 'auth/user-connector-list.do#config&user'
        url: 'user/account-info-list.do#config&user'
    }, {
        text: '角色管理',
        code: 'role',
        icon: 'theme/default/images/config-role.png',
        url: 'auth/role-viewList.do#config&role'
    }, {
        text: '组织机构管理',
        code: 'org',
        icon: 'theme/default/images/operation-team.png',
        url: 'org/org-company-list.do#config&org'
    }, {
        text: '短信群发',
        code: 'message',
        icon: 'theme/default/images/config-message.png',
        url: 'sendsms/sendsms-history-list.do#config&message'
    }, {
        text: '工作流',
        code: 'workflow',
        icon: 'theme/default/images/config-workflow.png',
        url: 'bpm/bpm-category-list.do#config&workflow'
    }]
}, {
    text: '数据采集',
    code: 'gather',
    icon: 'theme/default/images/collection.png',
    url: 'gather/source.do#gather&source',
    children: [{
        text: '采集源',
        code: 'source',
        icon: 'theme/default/images/collection-source.png',
        url: 'gather/source.do#gather&source'
    }, {
        text: '采集对象',
        code: 'object',
        icon: 'theme/default/images/collection-object.png',
        url: 'gather/object.do#gather&object'
    }, {
        text: '目标库',
        code: 'target',
        icon: 'theme/default/images/collection-target.png',
        url: 'gather/target.do#gather&target'
    }, {
        text: '采集计划',
        code: 'plan',
        icon: 'theme/default/images/collection-plan.png',
        url: 'gather/plan.do#gather&plan'
    }, {
        text: '采集结果',
        code: 'result',
        icon: 'theme/default/images/collection-result.png',
        url: 'gather/result.do#gather&result'
    }]
}, {
    text: '指挥中心',
    code: 'control',
    icon: 'theme/default/images/monitor.png',
    url: 'control/workOrder.do#control&work-order',
    children: [{
        text: '工单服务监控视图',
        code: 'work-order',
        icon: 'theme/default/images/collection-source.png',
        url: 'control/workOrder.do#control&work-order'
    }]
}];

$(function() {
  initMenu();
});

function initMenu() {
    var menu_html = '', submenu_html = '';
    var hash = (window.location.hash || '').replace('#', '');
    if(!hash) {
        $('#sidebar').remove();
        $('#content').removeClass('col-sm-11 col-md-11').addClass('col-sm-12 col-md-12');
        return;
    }
    var _array = hash.split('&');
    var category = _array[0];
    var subcategory = '';
    if(_array.length > 1) {
        subcategory = _array[1];
    }
    for (var i in menu) {
        var item = menu[i];
        menu_html += '<div class="col-sm-1 col-md-1 ' + (item.code || '') + '"><div class="thumbnail"><a href="' + item.url + '"><div class="caption"><img src="' + item.icon + '"/></div><div class="caption">' + item.text + '</div></a></div></div>';
        if (item.code === category) {
            var children = item.children || [];
            if (children.length == 0) {
                $('#sidebar').remove();
                $('#content').removeClass('col-sm-11 col-md-11').addClass('col-sm-12 col-md-12');
            } else {
                for (var j in children) {
                    var subitem = children[j];
                    submenu_html += '<div class="col-sm-12 col-md-12 ' + (subitem.code || '') + '"><div class="thumbnail"><a href="' + subitem.url + '"><img src="' + subitem.icon + '"/><div class="caption">' + subitem.text + '</div></a></div></div>';
                }
            }
        }
    }
    $('#menu').html(menu_html).find('.' + category).addClass('active');
    $('#submenu').html(submenu_html).find('.' + subcategory).addClass('active');
}
