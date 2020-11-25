function RightKeyTabPanel()
{
    var tabs = Ext.getCmp("TabPanelID");
    tabs.on("contextmenu",function(_tabs,_tab,e)
    {
        //右键
        if(_tab.title&&_tab.title=="首页")
        {
            return;
        }
        var menus;
        if(!menus)
        {
            menus = new Ext.menu.Menu
            ([
                { xtype: "button", text: "关闭", cls: 'x-btn-text-icon', icon: "../Controls/images/user_green.png", pressed: true, listeners: { "click": function() { _tabs.remove(_tab); } } },
                {
                    xtype: "button", text: "关闭其它", cls: 'x-btn-text-icon', icon: "../Controls/images/user_red.png", pressed: true, id: "CloseOtherPanel",
                    listeners:{"click":function()
                    {
                        if(_tabs.items.items.length==1)
                        {
                            _tabs.remove(_tab);
                        }
                        else
                        {
                            for(var i=0;i<_tabs.items.items.length;i++)
                            {
                                if(_tabs.items.items[i].id!=_tab.id)
                                {
                                    if(_tabs.items.items[i].title&&_tabs.items.items[i].title=="首页")
                                    {
                                        continue;
                                    }
                                    _tabs.remove(_tabs.items.items[i]);
                                    i = i -1;
                                }
                            }
                        }
                   }}  
                }
            ]);
        }
        if(_tabs.items.items.length==2)
        {
            Ext.getCmp("CloseOtherPanel").disabled = true;
        }        
        menus.showAt(e.getPoint());
    });  
}