/*
时间:2010-03-12
作者:朱存群
用途:商户模型自定义字段属性按说选类型显示隐藏相关属性
*/

var BusinessField = {
    $: jQuery,
    nextId: 1,  //中间值过渡字段

    shows: function(id, flag) {  //替换选择
        var s
        if (flag == 0) {
            s = id; 
        }
        else if(flag==1) {
            s = $('Form select[name="ddlFieldType"]').val();
        }
        if (s == 1) {  //单行文本
            $("#citems").css("display", "none");
            $("dl[id^='h']").css("display", "none");
            $("dl[id='xrows']").css("display", "none");
            $("dl[id^='x'][id!='xrows']").css("display", "block");
        }
        else if (s == 2) { //多行文本
            $("dl[id^='h']").css("display", "none");
            $("#citems").css("display", "none");
            $("dl[id='xrows']").css("display", "block");
            $("dl[id^='x']").css("display", "block");
        }
        else if (s == 3) {  //编辑器
            $("dl[id^='h']").css("display", "none");
            $("#citems").css("display", "none");
            $("dl[id^='x'][id!=xrows]").css("display", "block");
        }
        else if (s == 4 || s == 5 || s == 6 || s == 7) { //下拉、单选、多选、复选
            $("dl[id^='h']").css("display", "none");
            $("dl[id^='x']").css("display", "none");
            $("#citems").css("display", "block");
        }
        else if (s == 8) { //数字
            $("dl[id^='h']").css("display", "none");
            $("dl[id^='x']").css("display", "none");
            $("#citems").css("display", "none");
        }
        else if (s == 9) { //货币
            $("dl[id^='h']").css("display", "none");
            $("dl[id^='x']").css("display", "none");
            $("#citems").css("display", "none");
            $("dl[id^='xlength']").css("display", "block");
        }
        else if (s == 10) { //日期
            $("dl[id^='h']").css("display", "none");
            $("dl[id^='x']").css("display", "none");
            $("#citems").css("display", "none");
            $("dl[id^='hDate']").css("display", "block");
        }
        else if (s == 11) { //图片
            $("dl[id^='h']").css("display", "none");
            $("#citems").css("display", "none");
            $("#hImage").css("display", "block");
            $("#hVol").css("display", "block");
            $("dl[id^='x'][id!=xrows]").css("display", "block");
        }
        else if (s == 12) { //文件
            $("dl[id^='h']").css("display", "none");
            $("#citems").css("display", "none");
            $("#hFile").css("display", "block");
            $("#hVol").css("display", "block");
            $("dl[id^='x'][id!=xrows]").css("display", "block");
        }
        else if (s == 13) { //密码框
            $("dl[id^='h']").css("display", "none");
            $("#citems").css("display", "none");
            $("dl[id^='x'][id!='xrows']").css("display", "block");
        }
        else if (s == 14) { //超链接
            $("dl[id^='h']").css("display", "none");
            $("#citems").css("display", "none");
            $("dl[id^='hLink']").css("display", "block");
            $("dl[id^='hLinkText']").css("display", "block");
            $("dl[id^='x']").css("display", "none");
            $("dl[id^='cdefault']").css("display", "none");
        }
    }
}


