DATA = {
    menu: [{//一级菜单
        menuid: 'm001',
        name: '工作管理',
        code: 'm001',
        icon: 'images/Menu1.png'
    }, {
        menuid: 'm002',
        name: 'OA管理',
        code: 'm002',
        icon: 'images/Menu2.png'
    }, {
        menuid: 'm003',
        name: 'CRM管理',
        code: 'm003',
        icon: 'images/Menu3.png'
    }, {
        menuid: 'm004',
        name: 'ERP管理',
        code: 'm004',
        icon: 'images/Menu4.png'
    }, {
        menuid: 'm005',
        name: '系统管理',
        code: 'm005',
        icon: 'images/Menu5.png'
    }],
    app: {//桌面1
        'readGod': {
            appid: '108005',
            icon: 'roll_manage.png',
            name: '工作台',
            url: '../console/Main.aspx?NodeCode=108005&IsFirst=1',
            sonMenu: "[]",
            asc: 1
        },
        'sosomap': {
            appid: '108001',
            icon: 'password.png',
            name: '修改密码',
            url: '../SysManage/SysUserChangePassword.aspx?NodeCode=108001&IsFirst=1',
            sonMenu: "[]",
            asc: 2
        },
        'jinshan': {
            appid: '108004',
            icon: 'notify.png',
            name: '公告',
            url: '../Model/Messagelist.aspx?NodeCode=108004&IsFirst=1',
            sonMenu: "[]",
            asc: 3
        },
        'douban': {
            appid: '108003',
            icon: 'sms.png',
            name: '内部消息',
            url: '../SysManage/MsgReceiveList.aspx?NodeCode=108003&IsFirst=1',
            sonMenu: "[]",
            asc: 4
        },
        'Pixlr': {
            appid: '64',
            icon: 'pixlr.png',
            name: 'Pixlr',
            url: 'msg.html',
            sonMenu: "[]",
            asc: 5
        },
        'weather': {
            appid: '18',
            icon: '5.png',
            name: '天气',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 6
        },
        'Clock': {
            appid: '20',
            icon: 'time.png',
            name: '时钟',
            url: 'http://www.jq-school.com/',
            asc: 7
        },
        'yule': {
            appid: '514',
            icon: 'folder_o.png',
            name: '娱乐',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 8
        },
        'mangguo': {
            appid: '105021001',
            icon: 'untitled.png',
            name: '流程管理',
            url: '../Model/Articlelist.aspx?NodeCode=105021001&IsFirst=1',
            sonMenu: "[]",
            asc: 1
        },
        'tuanmap': {
            appid: '105021002',
            icon: 'project.png',
            name: '新建流程',
            url: '../Model/Flow.aspx?NodeCode=105021002&IsFirst=1',
            sonMenu: "[]",
            asc: 2
        },
        'fastsearch': {
            appid: '105021003',
            icon: 'work_plan.png',
            name: '我的工作',
            url: '../Model/Calendar.aspx?NodeCode=105021003&IsFirst=1',
            sonMenu: "[]",
            asc: 3
        },
        'bianqian': {
            appid: '105021004',
            icon: 'bianqian.png',
            name: '工作查询',
            url: '../Model/Articlelist.aspx?NodeCode=105021004&IsFirst=1',
            sonMenu: "[]",
            asc: 4
        },
        'wangdesk': {
            appid: '105021005',
            icon: 'hr.png',
            name: '工作委托',
            url: '../Model/Articlelist.aspx?NodeCode=105021005&IsFirst=1',
            sonMenu: "[]",
            asc: 5
        },
        'kehufenlei': {
            appid: '112001',
            icon: 'crm.png',
            name: '客户分类',
            url: '../Model/typeclasslist.aspx?NodeCode=112001&IsFirst=1',
            sonMenu: "[]",
            asc: 1
        },
        'hetongdingdan': {
            appid: '112002',
            icon: 'work_plan.png',
            name: '合同/订单分类',
            url: '../Model/Articlelist.aspx?NodeCode=112002&IsFirst=1',
            sonMenu: "[]",
            asc: 2
        },
        'huikuan': {
            appid: '112003',
            icon: 'workflow.png',
            name: '回款记录',
            url: '../Model/Timeaxis.aspx?NodeCode=112003&IsFirst=1',
            sonMenu: "[]",
            asc: 3
        },
        'kaipiao': {
            appid: '112004',
            icon: 'diary.png',
            name: '开票记录',
            url: '../Model/Calendar.aspx?NodeCode=112004&IsFirst=1',
            sonMenu: "[]",
            asc: 4
        },
        'dingdan': {
            appid: '112005',
            icon: 'info.png',
            name: '订单管理',
            url: '../Model/Albumlist.aspx?NodeCode=112005&IsFirst=1',
            sonMenu: "[]",
            asc: 5
        },
        'fahuodan': {
            appid: '112006',
            icon: 'work_plan.png',
            name: '发货单',
            url: '../Model/Articlelist.aspx?NodeCode=112006&IsFirst=1',
            sonMenu: "[]",
            asc: 1
        },
        'fahuo': {
            appid: '112007',
            icon: 'reportshop.png',
            name: '发货明细',
            url: '../Model/Datetablelist.aspx?NodeCode=112007&IsFirst=1',
            sonMenu: "[]",
            asc: 2
        },
        'lanke': {
            appid: '112008',
            icon: 'meeting.png',
            name: '散客管理',
            url: '../Model/Timeaxis.aspx?NodeCode=112008&IsFirst=1',
            sonMenu: "[]",
            asc: 3
        },
        'baojia': {
            appid: '112009',
            icon: 'news.png',
            name: '报价管理',
            url: '../Model/SinglePageEdit.aspx?NodeCode=112009&IsFirst=1',
            sonMenu: "[]",
            asc: 4
        },
        'caigou': {
            appid: '113001',
            icon: 'attendance.png',
            name: '采购管理',
            url: '../Model/Calendar.aspx?NodeCode=113001&IsFirst=1',
            sonMenu: "[]",
            asc: 5
        },
        'xiaoshou': {
            appid: '113002',
            icon: 'notify.png',
            name: '销售管理',
            url: '../Model/productlist.aspx?NodeCode=113002&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'kucun': {
            appid: '113003',
            icon: 'project.png',
            name: '库存管理',
            url: '../Model/Articlelist.aspx?NodeCode=113003&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'chejian': {
            appid: '113004',
            icon: 'asset.png',
            name: '车间管理',
            url: '../Model/Articlelist.aspx?NodeCode=113004&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'cunhuo': {
            appid: '113005',
            icon: 'reportshop.png',
            name: '存货核算',
            url: '../Model/ReportDetaillist.aspx?NodeCode=113005&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'chengbenkesuan': {
            appid: '113006',
            icon: 'attendance.png',
            name: '成本核算',
            url: '../Model/SinglePageEdit.aspx?NodeCode=113006&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'yingshou': {
            appid: '113007',
            icon: 'diary.png',
            name: '应收管理',
            url: '../Model/Articlelist.aspx?NodeCode=113007&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'yusuan': {
            appid: '113008',
            icon: 'untitled.png',
            name: '预算管理',
            url: '../Model/Articlelist.aspx?NodeCode=113008&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'renshidangan': {
            appid: '113009',
            icon: 'hr.png',
            name: '人事档案',
            url: '../Model/Articlelist.aspx?NodeCode=113009&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        }
        ,
        'yonghu': {
            appid: '100010001',
            icon: 'crm.png',
            name: '用户管理',
            url: '../SysManage/SysUserList.aspx?NodeCode=100010001&IsFirst=1',
            sonMenu: "[]",
            asc: 1
        },
        'jiaose': {
            appid: '100010002',
            icon: 'hr.png',
            name: '角色管理',
            url: '../SysManage/RoleList.aspx?NodeCode=100010002&IsFirst=1',
            sonMenu: "[]",
            asc: 2
        },
        'yonghuzu': {
            appid: '100010003',
            icon: 'meeting.png',
            name: '用户组管理',
            url: '../SysManage/UserGropList.aspx?NodeCode=100010003&IsFirst=1',
            sonMenu: "[]",
            asc: 3
        },
        'lajishezhi': {
            appid: '100019001',
            icon: 'lajishezhi.png',
            name: '回收站设置',
            url: '../model/RecyclingManageList.aspx?NodeCode=100019001&IsFirst=1',
            sonMenu: "[]",
            asc: 4
        },
        'laji': {
            appid: '100019002',
            icon: 'laji.png',
            name: '回收站',
            url: '../model/RecyclingList.aspx?NodeCode=100019002&IsFirst=1',
            sonMenu: "[]",
            asc: 5
        },
        'moxian': {
            appid: '100011002',
            icon: 'reportshop.png',
            name: '模型列表',
            url: '../Model/ModelManageList.aspx?NodeCode=100011002&IsFirst=1',
            sonMenu: "[]",
            asc: 6
        },
        'moxianguanli': {
            appid: '100011007',
            icon: 'project.png',
            name: '子模型管理',
            url: '../Model/ModelManageList.aspx?IsSub=1&NodeCode=100011007&IsFirst=1',
            sonMenu: "[]",
            asc: 7
        },
        'moxianfenzu': {
            appid: '100011001',
            icon: 'roll_manage.png',
            name: '模型分组',
            url: '../Model/ModelFieldGroupList.aspx?NodeCode=100011001&IsFirst=1',
            sonMenu: "[]",
            asc: 8
        },
        'jiedian': {
            appid: '100005',
            icon: 'info.png',
            name: '节点管理',
            url: '../SysManage/ModelNodeList.aspx?NodeCode=100005&IsFirst=1',
            sonMenu: "[]",
            asc: 9
        },
        'lanmu': {
            appid: '100015001',
            icon: 'info.png',
            name: '栏目管理',
            url: '../SysManage/ColumnManage.aspx?NodeCode=100015001&IsFirst=1',
            sonMenu: "[]",
            asc: 10
        },
        'lanmufuzhi': {
            appid: '100015003',
            icon: 'project.png',
            name: '栏目复制',
            url: '../SysManage/ColumnCopy.aspx?NodeCode=100015003&IsFirst=1',
            sonMenu: "[]",
            asc: 11
        },
        'lanmuyidong': {
            appid: '100015002',
            icon: 'project.png',
            name: '栏目移动',
            url: '../SysManage/ColumnMove.aspx?NodeCode=100015002&IsFirst=1',
            sonMenu: "[]",
            asc: 12
        },
        'lanmuhebing': {
            appid: '100015004',
            icon: 'project.png',
            name: '栏目合并',
            url: '../SysManage/ColumnUnite.aspx?NodeCode=100015004&IsFirst=1',
            sonMenu: "[]",
            asc: 13
        },
        'mokuai': {
            appid: '100001',
            icon: 'untitled.png',
            name: '模块管理',
            url: '../SysManage/ModelList.aspx?NodeCode=100001&IsFirst=1',
            sonMenu: "[]",
            asc: 14
        },
        'caozuo': {
            appid: '100006',
            icon: 'address.png',
            name: '操作管理',
            url: '../SysManage/ActionList.aspx?NodeCode=100006&IsFirst=1',
            sonMenu: "[]",
            asc: 15
        },
        'rizi': {
            appid: '100009',
            icon: 'diary.png',
            name: '日志管理',
            url: '../sysManage/syslog.aspx?NodeCode=100009&IsFirst=1',
            sonMenu: "[]",
            asc: 16
        },
        'zhandian': {
            appid: '100013001',
            icon: 'workflow.png',
            name: '站点信息设置',
            url: '../SysManage/SiteInfoSet.aspx?NodeCode=100013001&IsFirst=1',
            sonMenu: "[]",
            asc: 17
        },
        'zhandiancanshu': {
            appid: '100013002',
            icon: 'info.png',
            name: '站点参数设置',
            url: '../SysManage/SiteParamSet.aspx?NodeCode=100013002&IsFirst=1',
            sonMenu: "[]",
            asc: 18
        },
        'youjiancanshu': {
            appid: '100013003',
            icon: 'sms.png',
            name: '邮件参数设置',
            url: '../SysManage/PostSet.aspx?NodeCode=100013003&IsFirst=1',
            sonMenu: "[]",
            asc: 19
        },
        'suolutu': {
            appid: '100013004',
            icon: 'info.png',
            name: '上传缩略图设置',
            url: '../SysManage/UploadSet.aspx?NodeCode=100013004&IsFirst=1',
            sonMenu: "[]",
            asc: 20
        },
        'shujuku': {
            appid: '100013005',
            icon: 'info.png',
            name: '数据库管理',
            url: '../SysManage/DataBaseManageSet.aspx?NodeCode=100013005&IsFirst=1',
            sonMenu: "[]",
            asc: 21
        }

    },
    sApp: {//侧边栏应用
        'appmarket': {
            appid: '1',
            icon: 'appmarket.png',
            name: '应用市场',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 1
        },
        'qq': {
            appid: '2',
            icon: 'big.png',
            name: 'QQ',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 2
        },
        'weibo': {
            appid: '3',
            icon: 'weibo.png',
            name: '微博',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 3
        },
        'mail': {
            appid: '4',
            icon: 'mail.png',
            name: '邮箱',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 4
        },
        'zone': {
            appid: '5',
            icon: 'zone.png',
            name: '空间',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 5
        },
        'internet': {
            appid: '6',
            icon: 'internet.png',
            name: '浏览网页',
            url: 'http://www.jq-school.com/',
            sonMenu: "[]",
            asc: 6
        }

    }
};
ops = {//向桌面添加应用
    Icon1: ['readGod', 'sosomap', 'jinshan', 'douban'],
    Icon2: ['mangguo', 'tuanmap', 'fastsearch', 'bianqian', 'wangdesk'],
    Icon3: ['kehufenlei',  'huikuan', 'kaipiao', 'dingdan',  'fahuo', 'lanke', 'baojia'],
    Icon4: ['caigou', 'xiaoshou', 'kucun', 'chejian', 'cunhuo', 'chengbenkesuan', 'yingshou', 'yusuan', 'renshidangan'],
    Icon5: ['yonghu', 'yonghuzu', 'lajishezhi', 'laji', 'moxian', 'moxianguanli', 'moxianfenzu', 'jiedian', 'lanmu', 'lanmufuzhi', 'lanmuyidong', 'lanmuhebing', 'mokuai', 'caozuo', 'rizi', 'zhandian', 'zhandiancanshu', 'youjiancanshu', 'suolutu', 'shujuku']
}
//初始化左边快捷菜单
var leftMenu = new Array(['appmarket', 'qq', 'weibo', 'mail', 'internet', 'zone']);


