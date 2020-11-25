
//在线解答的相关验证
function OnlineInfoValidator()
{
$(document).ready(function(){
//    $.formValidator.initConfig({formid:"form1",onerror:function(){alert("提交失败，请查看原因!");}});
    $.formValidator.initConfig({formid:"form1",onerror:function(){ymPrompt.errorInfo({message:'提交失败，请查看原因!',title:'提示信息'});}});
    $("#txtUser").formValidator({onshow:"请输入",onfocus:"必填",oncorrect:"正确"}).regexValidator({regexp:"notempty",datatype:"enum",onerror:"必填"});
    $("#txtTel").formValidator({onshow:"请输入",onfocus:"请输入",oncorrect:"格式正确"}).regexValidator({regexp:"^[[0-9]{3}-|\[0-9]{4}-]?([0-9]{8}|[0-9]{7})?$",onerror:"格式不正确"});  
    $("#txtTitle").formValidator({onshow:"请输入",onfocus:"必填",oncorrect:"正确"}).regexValidator({regexp:"notempty",datatype:"enum",onerror:"必填"});
});
}


//人才招聘的相关验证
function RecruitInfoValidator()
{
    $(document).ready(function() {
        //    $.formValidator.initConfig({formid:"form1",onerror:function(){alert("提交失败，请查看原因!");}});
        //alert(msg);
        $.formValidator.initConfig({ formid: "form1", autotip: true, tidymode: true, onerror: function(msg) { alert(msg) } });
        $("#txtUserName").formValidator({ onshow: "请输入姓名", onfocus: "姓名必填", oncorrect: "输入正确" }).regexValidator({ regexp: "notempty", datatype: "enum", onerror: "姓名必填" });
        $("#txtBirthDate").formValidator({ onshow: "请输入出生日期", onfocus: "出生日期必填", oncorrect: "输入正确" }).regexValidator({ regexp: "notempty", datatype: "enum", onerror: "出生日期必填" });
        $("#txtSpecialty").formValidator({ onshow: "请输入专业", onfocus: "专业必填", oncorrect: "输入正确" }).regexValidator({ regexp: "notempty", datatype: "enum", onerror: "专业必填" });
        $("#txtTel").formValidator({ onshow: "格式：020-61088288", onfocus: "格式：020-61088288", oncorrect: "输入正确" }).regexValidator({ regexp: "^[[0-9]{3}-|\[0-9]{4}-]?([0-9]{8}|[0-9]{7})?$", onerror: "格式：020-61088288" });
        $("#txtEMail").formValidator({ onshow: "请输入邮箱", onfocus: "邮箱必填", oncorrect: "输入正确" }).regexValidator({ regexp: "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", onerror: "邮箱格式不正确" });

        $("#txtGraduated").formValidator({ empty: true, onshow: "请输入毕业院校,可以不填", onfocus: "请输入正确", oncorrect: "谢谢您的合作", onempty: "输入正确以便更详细了解您的信息。" }).inputValidator({ max: 100, onerror: "内容过长，请精简" }); ;
        $("#txtEducation").formValidator({ empty: true, onshow: "请输入学历,可以不填", onfocus: "请输入正确", oncorrect: "谢谢您的合作", onempty: "输入正确以便更详细了解您的信息。" }).inputValidator({ max: 100, onerror: "内容过长，请精简" }); ;
        $("#txtGraduationTime").formValidator({ empty: true, onshow: "请输入毕业时间,可以不填", onfocus: "请输入正确", oncorrect: "谢谢您的合作", onempty: "输入正确以便更详细了解您的信息。" }).inputValidator({ max: 50, onerror: "内容过长，请精简" }); ;
        $("#txtAddress").formValidator({ empty: true, onshow: "请输入联系地址,可以不填", onfocus: "请输入正确", oncorrect: "谢谢您的合作", onempty: "输入正确以便更详细了解您的信息。" }).inputValidator({ max: 500, onerror: "内容过长，请精简" }); ;
        $("#txtSkill").formValidator({ empty: true, onshow: "请输入专业技能,可以不填", onfocus: "请输入正确", oncorrect: "谢谢您的合作", onempty: "输入正确以便更详细了解您的信息。" }).inputValidator({ max: 500, onerror: "内容过长，请精简" }); ;
        $("#txtIntro").formValidator({ empty: true, onshow: "请输入个人简历,可以不填", onfocus: "请输入正确", oncorrect: "谢谢您的合作", onempty: "输入正确以便更详细了解您的信息。" }).inputValidator({ max: 500, onerror: "内容过长，请精简" }); ;
    });
}

