//**************底部部分*************************
function BuildBottomPanel()
{    
    var winMessages;
    var readyMessages = function()
    {
        if(!winMessages)
        {
            winMessages = new Ext.Window
            ({
                title: '系统消息',layout: 'absolute',closeAction:'hide',width: 330,height: 220,iconCls:"win_icon",
                resizable: false,plain: true, animCollapse:true,
                items: fomMessages = new Ext.FormPanel
                ({
                      frame: true,width: 320,height: 150,bodyStyle:'padding: 0',defaults: {width: 175},defaultType: 'textarea',
                      items:[{id: 'taMessage',hideLabel: true,readOnly: true,anchor: '100%, 100%',value:'系统正在建设中...'}]
                }),
                buttons:[{text: '关闭',id: 'sm_btnClose',disabled: false,handler: function(){winMessages.hide();}}]
            });
        }
    };
    readyMessages();
    var showMessage = function()
    {
        if(Ext.getCmp('sb_btnMessage').text != '公告(0)')
        {
            Ext.getCmp('sb_btnMessage').setText('公告(0)');
            winMessages.x = Ext.getBody().getWidth() - 332;
            winMessages.y = Ext.getBody().getHeight() - 252;
            winMessages.show();
        }
        else
        {
            Ext.getCmp('sb_btnMessage').setText('公告(0)');
            winMessages.x = Ext.getBody().getWidth() - 332;
            winMessages.y = Ext.getBody().getHeight() - 252;
            winMessages.show();
        }
    }
    
    var clock = new Ext.Toolbar.TextItem('');
    var BottomPanel = new Ext.Panel
    ({
        layout:"fit", collapsible: true,height:20,border:"false",id:"BottomPanelID",
        region:"south",
        tbar: 
        new Ext.StatusBar
        ({
            defaultText: '状态',id: 'basic-statusbar',defaultIconCls: '',border:false,frame:false,
            items: 
            [
                  '','-',
                 {xtype: 'label',text: '推荐分辨率:1024*768以上'}, '-',
                 //{id: 'sb_btnMessage',width:100,text:'公告(0)',handler:showMessage }, '-',
                 //{id: 'basic-button',text: '刷新',handler:function(){} }, '-', 
                 clock, ' ', ' '
            ],
            listeners: 
            {
                'render': 
                {
                    fn: function()
                    {
		                Ext.TaskMgr.start
		                ({
		                    run: function(){Ext.fly(clock.getEl()).update(new Date().format('G:i:s A'));},interval: 1000
		                });
                    }
                }
            }
         })    
     });
    
}