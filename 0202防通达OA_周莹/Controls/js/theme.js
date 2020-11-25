    //生成皮肤
    function makeCookie()
    {
        var themes = 
        [
            ['default', '默认'],
            ['gray', '灰色'],
            ['green', '绿色'],
            ['pink', '粉色'],
            ['purple', '紫色'],
            ['olive', '橄榄绿'],
            ['slate', '暗蓝色']
        ];
        this.cbThemes = new Ext.form.ComboBox
        ({
            id: 'cbThemes',
            store: themes,
            width: 80,
            typeAhead: true,
            triggerAction: 'all',
            emptyText:'界面主题',
            selectOnFocus:true
        });
        this.cbThemes.on
        ({
            "select":function(field,newValue,oldValue)
                    {
                       var css = newValue.data.value;                       
                       var date=new Date();
                       date.setTime(date.getTime()+30*24*3066*1000);
                       document.getElementsByTagName("link")[1].href="/Controls/ExtJS/resources/css/xtheme-"+css+".css";
                       document.cookie="css="+css+";expires="+date.toGMTString();
                    }
        }); 
        document.body.onload = function()
        {
              var cookiesArr=document.cookie.split(";");
              var css;
              for(var i=0;i<cookiesArr.length;i++)
              {
                   var arr=cookiesArr[i].split("=");
                   if(arr[0]=="css")
                   {
                      css=arr[1];
                      break;
                   }
              }
              document.getElementsByTagName("link")[1].href = "/Controls/ExtJS/resources/css/xtheme-" + css + ".css";
        };
    }    