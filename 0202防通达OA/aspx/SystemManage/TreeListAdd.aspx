<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeListAdd.aspx.cs" Inherits="OA.aspx.SystemManage.TreeListAdd" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">    
    <style type="text/css"> 
        .firstMenuItem i {
            position:relative;
        }
    </style>
    <script language="javascript">
        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }

        function menuIconSel(obj) {
            var sel = obj.className;
            sel = sel.substring(9, sel.length);
            setSelectChecked('SelClass', sel);

            var icons = document.getElementsByClassName("iconfont");
            for (var i = 0; i < icons.length; i++) {
                icons[i].style.color = "#4ccfe1";
            }

            obj.style.color = "#ef6191";
        }

        function setSelectChecked(selectId, checkValue) {
            var select = document.getElementById(selectId);
            for (var i = 0; i < select.options.length; i++) {
                if (select.options[i].innerHTML == checkValue) {
                    select.options[i].selected = true;
                    break;
                }
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" style=" height: 30px;">
                    &nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                    <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;菜单管理&nbsp;>>&nbsp;添加信息
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    
<asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交" OnClick="iButton1_Click" />
                    
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button>
                </td>
            </tr>
            <tr>
                <td height="3px" colspan="2" style="background-color: #ffffff">
                </td>
            </tr>
        </table>
        <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    显示文字：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtTextStr" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=TextStr&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtTextStr').value=wName;}"
                        src="../../images/Button/search.gif" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTextStr"
                        ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    所用图片：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtImageUrlStr" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=ImageUrlStr&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtImageUrlStr').value=wName;}"
                        src="../../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    主菜单样式：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:DropDownList runat="server" ID="SelClass" Width="150px">
                        <asp:ListItem Value="" Text="icon-yangshengqi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-cuowu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-cuowu1"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xiala"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-qing"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-duoyun"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-yun"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wuqi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-yu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xiaoyu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-leidian"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-feng"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-nongyun"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wanshang"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wuyun"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-lieri"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shachen"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-dongyu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-fuchen"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-yujiaxue"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-daxue"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zhongxue"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xiaoxue"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-dayu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-fujian"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-weixin"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-fanhui"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-duochuangkou"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xiangyou"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-likaiim"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-mangluim"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zaixianim"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-tixing"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-group"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gengduo"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-29"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-pinglunhuifu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-fasong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huihua"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-ren"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zuzhi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-lishixiaoxi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-lianjie"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-naozhong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-quanbu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shuaxin"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-yiyue"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shezhi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-qingkongshanchu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-yun01"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zhanghao"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-iconfontquanbuxiaoxizhengchang"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xiaoxitixingchuangkoudanchufangshi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shouye"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-4"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-1"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-2"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-3"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-notifications"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huanfu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-banlixuanzhong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-daojishipai"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-hulve"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-hulvexuanzhong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huiqianxuanzhong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huiqian"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-jijianxiang"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-jinqi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-tuichiweixuan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-tuichixuanzhong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wancheng"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wanchengxuanzhong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-yituichi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zhongyaoxiaoxi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-banli"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-tixingshixiang"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-bianji"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-bianjiweixuan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huifu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huifuweixuan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shanchu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shanchuweixuan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-weiwancheng"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-weiwanchengweixuan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gerenshoucang"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-hulianwangyingyong2"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-qiyeshequ"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gerenshiwu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gongzuoliu2"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gongzuorizhi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gonggaotongzhi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gonggongwenjiangui"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-crm"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-baobiaoxitong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-cheliangshenqing"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-dianziyoujian"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-fujianchengxu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gerenwenjiangui"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gongzishangbao"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gongzuojihua"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-kaohe"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-kaoqinpishi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-renliziyuan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-richenganpai"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shangxiantixing"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-shoujiduanxin"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-tongxunbu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-toupiao"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-hulianhudongpingtai"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-huiyishenqing"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xinwen"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zhishiguanli"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zhinengkaifapingtai"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zhinengmenhu"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-zichanguanli"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wangluohuiyi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wangluoyingpan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-weixun"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-weijibaike"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-wodegongzuo"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xitongshezhi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xitongtixing"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xiangmuguanli"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-t10"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-danganguanli"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-gongwenguanli"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-xingzhengbangong"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-jiaoliuyuandi"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-guanlizhongxin"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-kuaijiecaidan"></asp:ListItem>
                        <asp:ListItem Value="" Text="icon-caidan1"></asp:ListItem>
                        </asp:DropDownList>
                    <div class="firstMenuItem" style="padding:10px 10px 10px 10px; overflow:hidden;">
                        <i class="iconfont icon-yangshengqi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-cuowu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-cuowu1" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xiala" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-qing" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-duoyun" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-yun" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wuqi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-yu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xiaoyu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-leidian" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-feng" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-nongyun" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wanshang" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wuyun" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-lieri" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shachen" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-dongyu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-fuchen" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-yujiaxue" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-daxue" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zhongxue" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xiaoxue" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-dayu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-fujian" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-weixin" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-fanhui" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-duochuangkou" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xiangyou" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-likaiim" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-mangluim" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zaixianim" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-tixing" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-group" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gengduo" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-29" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-pinglunhuifu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-fasong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huihua" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-ren" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zuzhi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-lishixiaoxi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-lianjie" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-naozhong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-quanbu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shuaxin" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-yiyue" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shezhi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-qingkongshanchu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-yun01" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zhanghao" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-iconfontquanbuxiaoxizhengchang" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xiaoxitixingchuangkoudanchufangshi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shouye" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-4" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-1" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-2" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-3" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-notifications" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huanfu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-banlixuanzhong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-daojishipai" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-hulve" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-hulvexuanzhong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huiqianxuanzhong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huiqian" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-jijianxiang" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-jinqi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-tuichiweixuan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-tuichixuanzhong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wancheng" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wanchengxuanzhong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-yituichi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zhongyaoxiaoxi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-banli" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-tixingshixiang" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-bianji" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-bianjiweixuan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huifu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huifuweixuan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shanchu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shanchuweixuan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-weiwancheng" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-weiwanchengweixuan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gerenshoucang" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-hulianwangyingyong2" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-qiyeshequ" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gerenshiwu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gongzuoliu2" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gongzuorizhi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gonggaotongzhi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gonggongwenjiangui" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-crm" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-baobiaoxitong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-cheliangshenqing" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-dianziyoujian" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-fujianchengxu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gerenwenjiangui" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gongzishangbao" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gongzuojihua" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-kaohe" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-kaoqinpishi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-renliziyuan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-richenganpai" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shangxiantixing" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-shoujiduanxin" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-tongxunbu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-toupiao" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-hulianhudongpingtai" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-huiyishenqing" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xinwen" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zhishiguanli" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zhinengkaifapingtai" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zhinengmenhu" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-zichanguanli" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wangluohuiyi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wangluoyingpan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-weixun" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-weijibaike" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-wodegongzuo" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xitongshezhi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xitongtixing" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xiangmuguanli" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-t10" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-danganguanli" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-gongwenguanli" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-xingzhengbangong" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-jiaoliuyuandi" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-guanlizhongxin" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-kuaijiecaidan" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                        <i class="iconfont icon-caidan1" style="color:#4ccfe1" onclick="menuIconSel(this)"></i>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    后台数值：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtValueStr" runat="server" Width="350px"></asp:TextBox>
                    当前最后一项为：<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>&nbsp;
                    子节点为数值，父节点可设置为和显示文字相同。
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    链接地址：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtNavigateUrlStr" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=NavigateUrlStr&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtNavigateUrlStr').value=wName;}"
                        src="../../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    目标框架：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtTarget" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=Target&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtTarget').value=wName;}"
                        src="../../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    父节点：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtParentID" runat="server" Width="350px"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtParentID"
                        Display="Dynamic" ErrorMessage="*该项必须输入数字" MaximumValue="10000" MinimumValue="0"
                        Type="Integer"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="txtParentID" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    权限：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtQuanXianList" runat="server" Width="350px">A_添加|M_修改|D_删除|E_导出</asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectCondition.aspx?TableName=ERPTreeList&LieName=QuanXianList&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('txtQuanXianList').value=wName;}"
                        src="../../images/Button/search.gif" />
                </td>
            </tr>
            <tr>
                <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">
                    排序：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="txtPaiXuStr" runat="server" Width="350px"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPaiXuStr"
                        Display="Dynamic" ErrorMessage="*该项必须输入数字" MaximumValue="10000" MinimumValue="0"
                        Type="Integer"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="txtPaiXuStr" ErrorMessage="*该项不可为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
