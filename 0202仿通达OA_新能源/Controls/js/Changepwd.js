Ext.BLANK_IMAGE_URL = '../Controls/ExtJS/resources/images/default/s.gif';
Ext.QuickTips.init();
Ext.form.Field.prototype.msgTarget = 'side';
function Main_Changepwd(NAID) {
    var logoPanel = new Ext.Panel({
        baseCls: 'x-plain',
        id: 'login-logo',
        region: 'center'
    });
    var loginForm = new Ext.form.FormPanel({
        region: 'south',
        border: false,
        bodyStyle: "padding: 15px",
        baseCls: 'x-plain',
        waitMsgTarget: true,
        labelWidth: 60,
        defaults: {
            width: 200
        },
        height: 90,
        items: [{
            xtype: 'textfield',
            inputType: 'password',
            fieldLabel: '原密码',
            id: 'oldpwd',
            name: 'loginname',
            cls: 'yonghuming',
            blankText: '原密码不能为空',
            validateOnBlur: false,
            allowBlank: false
        }, {
            xtype: 'textfield',
            inputType: 'password',
            id: 'newpwd',
            name: 'pwd',
            cls: 'mima',
            blankText: '新密码不能为空',
            fieldLabel: '新密码',
            validateOnBlur: false,
            allowBlank: false
}]
        });
        var win = new Ext.Window({
            title: '修改密码',
            iconCls: 'locked',
            width: 350,
            height: 160,
            resizable: false,
            draggable: true,
            collapsible: true, //允许缩放条   
            closeAction: 'close',
            closable: true,         //弹出模态窗体   
            modal: 'true',
            layout: 'border',
            bodyStyle: 'padding:5px;',
            plain: false,
            items: [logoPanel, loginForm],
            buttonAlign: 'center',
            buttons: [{
                text: '确定',
                cls: "x-btn-text-icon",
                icon: "/Content/icons/lock_open.png",
                height: 30,
                handler: function() {
                    // if (btn == 'yes') {
                    if (loginForm.form.isValid()) {
                        $.ajax({
                            type: "POST",
                            url: "/Home/ChangePwd",
                            data: { sUserID: NAID, sOldPWD: $("#oldpwd").val(), sNewPWD: $("#newpwd").val() },
                            success: function(mes) {
                                if (mes == "") {
                                    alert("密码修改成功。");
                                    win.close();
                                } else {
                                    alert(mes);
                                }
                            },
                            error: function(mes) {
                                alert("与系统交互失败。请重试。");
                            }
                        });
                    }
                }
            }, {
                text: '重置',
                cls: "x-btn-text-icon",
                icon: "/Content/icons/arrow_redo.png",
                height: 30,
                handler: function() {
                    loginForm.form.reset();
                }

}]
            });
            win.show();
        };
