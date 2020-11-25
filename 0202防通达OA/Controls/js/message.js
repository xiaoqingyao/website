function Message()
{
    //显示消息
    var winMessages;
    var readyMessages = function()
    {
        if(!winMessages)
        {
            winMessages = new Ext.Window
            ({
                layout: 'absolute',closeAction:'hide',width: 330,height: 220,resizable: false,plain: true, animCollapse:true,
                title: '系统消息',                   
                items: fomMessages = new Ext.FormPanel
                ({
                      frame: true,width: 320,height: 150,bodyStyle:'padding:5px 5px 0',
                      defaults: {width: 175},defaultType: 'textarea',
                      items:[{id: 'taMessage',hideLabel: true,readOnly: true,anchor: '100%, 100%',value:'消息内容'}]
                }),
                buttons:[{text: '关闭',id: 'sm_btnClose',disabled: false,handler: function(){winMessages.hide();}}]
            });
        }
    };
    readyMessages();
    var showMessage = function()
    {
        if(Ext.getCmp('sb_btnMessage').text != '消息(0)')
        {
            Ext.getCmp('sb_btnMessage').setText('消息(0)');
            winMessages.x = Ext.getBody().getWidth() - 332;
            winMessages.y = Ext.getBody().getHeight() - 252;
            winMessages.show();
        }
        else
        {
            Ext.getCmp('sb_btnMessage').setText('消息(0)');
            winMessages.x = Ext.getBody().getWidth() - 332;
            winMessages.y = Ext.getBody().getHeight() - 252;
            winMessages.show();
        }
    }
}