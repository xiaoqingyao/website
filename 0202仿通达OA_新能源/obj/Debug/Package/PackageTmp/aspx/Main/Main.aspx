<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="OA.aspx.Main.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="cache-control" content="no-cache, must-revalidate" />
    <meta http-equiv="expires" content="0" />
     <link rel = "Shortcut Icon" href="../../Content/icon.ico"/> 
    <link rel="Stylesheet" type="text/css" href="../../Controls/ExtJS/resources/css/ext-all.css"
        charset="gb2312" />
         <link href="../../Controls/ExtJS/resources/css/xtheme-olive.css" rel="stylesheet" />
    <link href="../../Controls/ExtJS/Css/menu.css" rel="stylesheet" type="text/css" />
    <link href="../../Controls/AzureCalendar/Theme/Default/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Controls/ExtJS/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../../Controls/ExtJS/ext-all.js"></script>
    <script src="../../JS/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Controls/js/bottom.js"></script>
    <script type="text/javascript" src="../../Controls/js/rightKeyTabPanel.js"></script>
    <script src="../../Controls/js/centerGrid.js" type="text/javascript"></script>
    <script src="../../Controls/ext-ux/statusbar/StatusBar.js" type="text/javascript"></script>
    <script src="../../Controls/js/Changepwd.js" type="text/javascript"></script>
    <script src="../../Controls/js/JsHelper.js" type="text/javascript"></script>
    <script src="../../JS/jquery.timers-1.2.js" type="text/javascript"></script>
    <style type="text/css">
        .x-panel-body p
        {
            margin: 5px;
        }
        .x-column-layout-ct .x-panel
        {
            margin-bottom: 5px;
        }
        .x-column-layout-ct .x-panel-dd-spacer
        {
            margin-bottom: 5px;
        }
        .settings
        {
            background-image: url(../shared/icons/fam/folder_wrench.png) !important;
        }
        .nav
        {
            background-image: url(../shared/icons/fam/folder_go.png) !important;
        }
        .panel_icon
        {
            background-image: url(../../Controls/images/first.gif);
        }
        .my_icon
        {
            background-image: url(../../Controls/images/plugin.gif);
        }
        .x-tree-node div.menu-node
        {
            background: #eee url(cmp-bg.gif) repeat-x;
            margin-top: 1px;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ccc;
            padding-top: 2px;
            padding-bottom: 1px;
            font-weight: bold;
        }
        .menu-node .x-tree-node-icon
        {
        }
        .menu-node2
        {
            border: 1px solid #fff;
            background-image: url(../../Content/icons/bullet_green.png);
            background-repeat: no-repeat;
            padding-right: 20px;
            background-position: 1px 1px;
        }
        .no-node-icon
        {
            display: none;
        }
        .menu-node2 .x-tree-ec-icon
        {
        }
        .error
        {
            background-image: url(../../Content/icons/exclamation.gif);
        }
        .information
        {
            background-image: url(../../Content/icons/calendar_view_month.png) !important;
        }
    </style>
</head>
<body>
    <div>
        <script type="text/javascript">
            function BuildTree() {
                //上面
                var toolbar = new Ext.Toolbar
        ({
            border: false, x: 0, y: 0, id: "toolbars",
            items:
             [
                         {
                             xtype: 'tbbutton',
                             text: "<%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%>",
                             cls: 'x-btn-text-icon',
                             icon: '../../Content/icon.ico',
                             disabled: false,
                             disabledClass: ''
                         }, "->", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "系统组件 ",
                             cls: "x-btn-text-icon",
                             icon: "../../Controls/images/plugin_add.gif",
                             handler: function (btn, e) {
                                 var tabs = tabpanels;
                                 for (var i = 0; i < tabs.items.length; i++) {
                                     if (tabs.items.items[i].title == "系统组件") {
                                         tabs.activate(tabs.items.items[i]);
                                         return;
                                     }
                                 }
                                 tabs.add({
                                     title: '系统组件',
                                     id: "PanelArticleViewID_102",
                                     html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='About.aspx'></iframe>",
                                     closable: true
                                 });
                                 tabs.activate('PanelArticleViewID_102');
                             }
                         }, "->", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "工作台 ",
                             cls: "x-btn-text-icon",
                             icon: "../../Controls/images/first.gif",
                             handler: function (btn, e) {
                                 var tabs = tabpanels;
                                 for (var i = 0; i < tabs.items.length; i++) {
                                     if (tabs.items.items[i].title == "工作台") {
                                         tabs.activate(tabs.items.items[i]);
                                         return;
                                     }
                                 }
                                 tabs.add({
                                     title: '工作台',
                                     id: "PanelArticleViewID_101",
                                     html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='MyDesk.aspx'></iframe>",
                                     closable: true
                                 });
                                 tabs.activate('PanelArticleViewID_101');
                             }
                         }, "-", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "内部邮件  [<span style=\"color: red\" id=\"mailcount\">0</span>]",
                             cls: "x-btn-text-icon",
                             icon: "../../Content/icons/email.png",
                             handler: function (btn, e) {
                                 var tabs = tabpanels;
                                 for (var i = 0; i < tabs.items.length; i++) {
                                     if (tabs.items.items[i].title == "内部邮件") {
                                         tabs.activate(tabs.items.items[i]);
                                         return;
                                     }
                                 }
                                 tabs.add({
                                     title: '内部邮件',
                                     id: "PanelArticleViewID_01",
                                     html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='../LanEmail/LanEmailShou.aspx'></iframe>",
                                     closable: true
                                 });
                                 tabs.activate('PanelArticleViewID_01');
                             }
                         }, "-", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "日程安排",
                             cls: "x-btn-text-icon",
                             icon: "../../Content/icons/calendar.png",
                             handler: function (btn, e) {
                                 var tabs = tabpanels;
                                 for (var i = 0; i < tabs.items.length; i++) {
                                     if (tabs.items.items[i].title == "日程安排") {
                                         tabs.activate(tabs.items.items[i]);
                                         return;
                                     }
                                 }
                                 tabs.add({
                                     title: '日程安排',
                                     id: "PanelArticleViewID_02",
                                     html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='../Work/RiCheng.aspx'></iframe>",
                                     closable: true
                                 });
                                 tabs.activate('PanelArticleViewID_02');
                             }
                         }, "-", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "在线用户  [<span style=\"color: red\" id=\"spnOnLineUserCount\">0</span>]",
                             cls: "x-btn-text-icon",
                             icon: "../../Content/icons/user.png",
                             handler: function (btn, e) {
                                 var tabs = tabpanels;
                                 for (var i = 0; i < tabs.items.length; i++) {
                                     if (tabs.items.items[i].title == "在线用户") {
                                         tabs.activate(tabs.items.items[i]);
                                         return;
                                     }
                                 }
                                 tabs.add({
                                     title: '在线用户',
                                     id: "PanelArticleViewID_03",
                                     html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='../Main/OnlineUser.aspx'></iframe>",
                                     closable: true
                                 });
                                 tabs.activate('PanelArticleViewID_03');
                             }
                         }, "-", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "修改密码",
                             cls: "x-btn-text-icon",
                             icon: "../../Content/icons/key.png",
                             handler: function (btn, e) {
                                 var tabs = tabpanels;
                                 for (var i = 0; i < tabs.items.length; i++) {
                                     if (tabs.items.items[i].title == "修改密码") {
                                         tabs.activate(tabs.items.items[i]);
                                         return;
                                     }
                                 }
                                 tabs.add({
                                     title: '在线用户',
                                     id: "PanelArticleViewID_04",
                                     html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='../Personal/ChangPwd.aspx'></iframe>",
                                     closable: true
                                 });
                                 tabs.activate('PanelArticleViewID_04');
                             }
                         }, "-", {
                             xtype: "tbbutton",
                             minWidth: 80,
                             text: "注销",
                             cls: "x-btn-text-icon",
                             icon: "../../Content/icons/lock_go.png",
                             handler: function (btn, e) {
                                 JsHelper.Confirm("确定要注销当前用户并回到登录页吗？", function (btn) {
                                     if (btn == 'yes') {
                                         window.location.href = '../Login.aspx';
                                     }
                                 });
                             }
                         }]
        });

                     var toolbar1 = new Ext.Toolbar
             ({
                 border: false, x: 0, y: 0, id: "toolbars1",
                 items:
                  [
                  {
                      xtype: 'tbbutton',
                      text: '当前用户： <font color="black"><%= FTD.Unit.PublicMethod.GetSessionValue("TrueName")%>(<%= FTD.Unit.PublicMethod.GetSessionValue("JiaoSe")%>)</font>',
                 cls: 'x-btn-text-icon',
                 icon: '../../Content/icons/layers.png',
                 disabled: false,
                 disabledClass: ''
             }, "->", {
             }]
        });

         var panel_toolbar = new Ext.Panel
 ({
     border: false, x: 0, y: 0,
     items: [toolbar]
 });


         var panel_north = new Ext.Panel({
             id: "panel_north", region: "north",
             title: "",
             border: false,
             html: '',
             height: 25,
             buttonAlign: 'right',
             margin: '0 0 0 0',
             tbar: toolbar,
             bbar: toolbar1
         });

                //中间
         var tabpanel = new Ext.TabPanel
 ({
     activeTab: 0, autoWidth: true, autoScroll: true, border: true, frame: true, id: "TabPanelID", enableTabScroll: true,
     items:
     [
         {
             xtype: "panel", layout: 'fit', title: "工作台", border: false, frame: false, iconCls: 'panel_icon',
             html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='MyDesk.aspx'></iframe>"
         }
     ]
 });
         var panel_center = new Ext.Panel
 ({
     id: 'panleCenter', frame: false, border: false,
     region: 'center',
     split: true,
     items: [tabpanel],
     layout: 'fit'

 });


                //左面
         var panel_west = new Ext.Panel
         ({
             id: 'panWestMenu',
             region: 'west',
             title: '功能菜单',
             iconCls: 'system_icon',
             width: 180,
             split: true,
             minSize: 180,
             maxSize: 250,
             collapsed: false,
             collapsible: true,
             margins: '0 0 0 0',
             layout: 'accordion',
             layoutConfig: { animate: true }
         });
                //&&底部
         var panel_south = new Ext.TabPanel
            ({
                id: "panel_south",
                region: "south",
                title: "",
                border: false,
                html: '强大通用的OA软件，各种功能集合体',
                height: 25,
                margin: '0 0 0 0',
                bodyStyle: 'background:#f9f9f7;font-size:12px;text-align:center;'
            });
         var viewport = new Ext.Viewport
             ({
                 id: 'vpMain',
                 layout: 'border',
                 items:
                 [
                     panel_north,
                     panel_center,
                     panel_west,
                     panel_south
                 ]
             });
                //加载左面的数据
         var loadPanelWest = function (init) {
             Ext.Ajax.request
      ({
          url: 'Main.aspx?method=GetData',
          success: function (response, options) {
              try {
                  var panWestMenu = Ext.getCmp("panWestMenu");
                  if (panWestMenu) {
                      var children = panWestMenu.findByType('panel');
                      if (children) {
                          for (var i = 0, len = children.length; i < len; i++) {
                              panWestMenu.remove(children[i], true);
                          }
                      }
                  }
                  var toolBars1 = Ext.getCmp("toolbars1");
                  var toolBars = Ext.getCmp("toolbars");
                  var menusArray = Ext.util.JSON.decode(response.responseText);

                  for (var j = 0; j < menusArray.length; j++) {
                      var mp = CreateMenuPanel(menusArray[j].TypeTitle, menusArray[j].TypeID, menusArray[j].icon, menusArray[j].iconCls);
                      panWestMenu.add(mp);
                      if (init == "load") {
                          var tempBtn = CreteButton(menusArray[j].TypeTitle, menusArray[j].TypeID, menusArray[j].icon);
                          toolBars1.addItem(tempBtn);
                      }
                  }
                  panWestMenu.doLayout();

              }
              catch (e) {

              }
          }
      });
         };
         loadPanelWest("load");
                //创建单个treePanel
         var CreateMenuPanel = function (title, TypeID, icons, iconcls) {
             return new Ext.Panel
           ({
               title: title, layout: 'fit', border: false, iconCls: iconcls,
               items:
               [{
                   xtype: 'treepanel', singleExpand: true, animate: true, autoScroll: true, containerScroll: true,
                   border: false, layout: 'fit', rootVisible: false, autoHeight: false, lines: true, iconCls: icons, spilt: true, // 美化界面
                   width: 180, height: 370, enableDD: false, dropConfig: { appendOnly: true },
                   loader: new Ext.tree.TreeLoader({ dataUrl: "Main.aspx" }),
                   root: new Ext.tree.AsyncTreeNode
                   ({
                       id: TypeID,
                       text: title,
                       draggable: false,
                       scope: this,
                       scripts: true,
                       expanded: true

                   })
                   , listeners: {
                       "click": function (node, e) {
                           if (node.attributes.action == "") {
                               //Ext.Msg.alert("提示消息","不可以对根节点执行右键操作！");
                               return;
                           }
                           var _Id = node.attributes.id;
                           var _TypeID = node.attributes.TypeID;
                           var _TypeTitle = node.attributes.TypeTitle;
                           var _TypeEName = node.attributes.TypeEName;
                           var action = node.attributes.action;
                           var tabs = Ext.getCmp("TabPanelID");
                           var title = _TypeTitle;
                           for (var i = 0; i < tabs.items.length; i++) {
                               if (tabs.items.items[i].title == title) {
                                   //Ext.Msg.alert("消息","该菜单项[ " + node.attributes.text + " ]已经存在Tab里面！");
                                   tabs.activate(tabs.items.items[i]);
                                   return;
                               }
                           }
                           var pnl = new BuildGridView(_Id, title, action).gridView;
                           tabs.add(pnl);
                           tabs.activate(pnl);
                       }
                   }
               }]
           });
         };
                //创建单个按钮
         var CreteButton = function (MenuTitle, MenuID, icons) {
             return new Ext.Toolbar.Button
         ({
             id: MenuID, text: MenuTitle, cls: 'x-btn-text-icon', icon: icons,
             tooltip: MenuTitle,
             listeners:
               {
                   "click": function (o, e) {

                       var panWestMenu = Ext.getCmp('panWestMenu');

                       var toolbars = Ext.getCmp('toolbars1');
                       var panel_north = Ext.getCmp('panel_north');
                       if (toolbars && toolbars.items.length > 0) {
                           for (var i = 0; i < toolbars.items.length; i++) {
                               if (toolbars.items.items[i].id == o.id) {
                                   toolbars.items.items[i].pressed = true;
                               }
                               else {
                                   toolbars.items.items[i].pressed = false;
                               }
                           }
                       }
                       if (panWestMenu) {
                           var children = panWestMenu.findByType('panel');
                           if (children) {
                               for (var i = 0, len = children.length; i < len; i++) {
                                   panWestMenu.remove(children[i], true);
                               }
                           }
                           var mp = CreateMenuPanel(o.tooltip, o.id, o.iconCls);
                           panWestMenu.add(mp);
                           panWestMenu.doLayout();
                       }
                   }
               }
         });
         };

     }

     //今日日程提醒窗口
     Ext.ux.ToastWindowMgr = {
         positions: []
     };

     Ext.ux.ToastWindow = Ext.extend(Ext.Window, {
         initComponent: function () {
             Ext.apply(this, {
                 iconCls: this.iconCls || 'information',
                 width: 400,
                 height: 280,
                 autoScroll: true,
                 autoDestroy: true,
                 plain: false
             });
             this.task = new Ext.util.DelayedTask(this.hide, this);
             Ext.ux.ToastWindow.superclass.initComponent.call(this);
         },
         setMessage: function (msg) {
             this.body.update(msg);
         },
         setTitle: function (title, iconCls) {
             Ext.ux.ToastWindow.superclass.setTitle.call(this, title, iconCls || this.iconCls);
         },
         onRender: function (ct, position) {
             Ext.ux.ToastWindow.superclass.onRender.call(this, ct, position);
         },
         onDestroy: function () {
             Ext.ux.ToastWindowMgr.positions.remove(this.pos);
             Ext.ux.ToastWindow.superclass.onDestroy.call(this);
         },
         afterShow: function () {
             Ext.ux.ToastWindow.superclass.afterShow.call(this);
             this.on('move', function () {
                 Ext.ux.ToastWindowMgr.positions.remove(this.pos);
                 this.task.cancel();
             }
 , this);
             this.task.delay(10000);
         },
         animShow: function () {
             this.pos = 0;
             while (Ext.ux.ToastWindowMgr.positions.indexOf(this.pos) > -1)
                 this.pos++;
             Ext.ux.ToastWindowMgr.positions.push(this.pos);
             this.setSize(400, 280);
             this.el.alignTo(document, "br-br", [-20, -20 - ((this.getSize().height + 10) * this.pos)]);
             this.el.slideIn('b', {
                 duration: 1,
                 callback: this.afterShow,
                 scope: this
             });
         },
         animHide: function () {
             Ext.ux.ToastWindowMgr.positions.remove(this.pos);
             this.el.ghost("b", {
                 duration: 1,
                 remove: true,
                 scope: this,
                 callback: this.destroy
             });
         }
     });
        </script>
        <script type="text/javascript">
            var tabpanels;
            var Txtime = 0.0; var ttime; var aa;
            var coun = 1;
            function SendTX() {
                if (coun > 0) {
                    var num = Math.random();
                    new Ext.ux.ToastWindow({
                        title: '今日提醒',
                        html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='SmsShow.aspx?rad=\" + num + \"'></iframe>",
                        iconCls: 'information'
                    }).show(document);
                }

            }

            function sendRequest() {
                $.ajax({
                    type: "POST",
                    url: "OnlineCount.aspx?Online=on",
                    async: false,
                    success: function (mes) {
                        if (mes != "null") {
                            $("#spnOnLineUserCount").html(mes.toString().split(',')[0]);
                            $("#mailcount").html(mes.toString().split(',')[1]);
                            coun = mes.toString().split(',')[1];
                            ttime = mes.toString().split(',')[2];

                            var iftix = mes.toString().split(',')[3];
                            var t;
                            if (iftix == '否') {
                                $(document).stopTime('C');
                            } else {
                                if (parseFloat(ttime) != parseFloat(Txtime)) {

                                    $(document).stopTime('C');
                                    $(document).everyTime(parseFloat(ttime), 'C', function () { SendTX(); });

                                    Txtime = ttime;
                                }
                            }
                        } else {
                            alert("帐号过期，请重新登陆！");
                            location.href = "../Default.aspx";
                        }
                    }
                });
            }
            function ready() {
                BuildBottomPanel();
                BuildTree();
                RightKeyTabPanel();
                tabpanels = Ext.getCmp("TabPanelID");
                sendRequest();
                SendTX();
                //                sendRequest();
                //                console.info(Txtime);
                $(document).everyTime(61100, 'A', function (i) { sendRequest(); });

            }
            function sett() {
                $(document).everyTime(parseFloat(ttime), 'C', function () { SendTX(); });
            }
            document.onready = ready();
            //   Ext.onReady(ready);
        </script>
    </div>
    <asp:TreeView ID="ListTreeView" runat="server" ExpandDepth="0" ForeColor="Black"
        Visible="false" Width="100%" ShowLines="True">
        <ParentNodeStyle HorizontalPadding="2px" />
        <RootNodeStyle HorizontalPadding="2px" Height="30px" Width="100%" />
        <LeafNodeStyle HorizontalPadding="2px" />
    </asp:TreeView>
</body>
</html>
