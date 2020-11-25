<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tHead.ascx.cs" Inherits="tHead" %>
<ul class="mininav">
    <li class="of-ot-oznt-01">欢迎来到影院在线订票系统&nbsp; &nbsp;销售热线：<img src="images/icon-003.gif" alt="400-678-1128" /></li>
</ul>
<!-- /end mininav -->
<div class="header">
    <h1 class="logo"><a href="/">
        <img src="images/logo.jpg" alt="影院在线订票系统" style="height: 78px;" /></a></h1>
    <!-- /end logo -->
    <%--<ul class="SearchForm">
  <li class="pf-th-otz">关键字：</li>
  <li class="textarea1"><input name="txtKeyword" id="txtKeyword" class="textarea" type="text" /></li>
  <li class="pf-th-otz">价格从</li>
  <li class="textarea2"><input name="txtMaxPrice" id="txtMaxPrice" class="textarea" type="text" /></li>
  <li class="pf-th-otz">到</li>
  <li class="textarea2"><input name="txtMinPrice" id="txtMinPrice" class="textarea" type="text" /></li>
  <li class="textarea3"><input name="btnSearch" id="btnSearch" class="butarea" type="button" value="搜索" /></li>
  <li class="pf-th-otz"><a href="#"></a></li>
 </ul>--%>
    <!-- /end SearchForm -->
    <ul class="navigation">
        <li><a href="index.aspx"><span>首页</span></a></li>
        <li><a href="news.aspx?lb=1"><span>站内新闻</span></a></li>
        <li><a href="yingpianlist.aspx"><span>影片咨询</span></a></li>
        <li><a href="userreg.aspx"><span>用户注册</span></a></li>
        <li><a href="dingdanlist.aspx"><span>我的订单</span></a></li>
        <li><a href="login.aspx?"><span>后台管理</span></a></li>

    </ul>
    <!-- /end navigation -->
    <ul class="navigationde">
        <li>欢迎光临</li>
        <%--  <li><a href="../p_show.aspx?productId=28"  target="_blank">台盆</a></li>
  <li><a href="../p_show.aspx?productId=19" target="_blank">玉兰墙纸</a></li>
  <li><a href="../p_show.aspx?productId=16" target="_blank">永高壁纸</a></li>--%>
    </ul>
    <!-- /end navigationde -->
</div>
<!-- /end header -->
<script src="js/common.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#btnSearch').bind('click', function () {
            var keyword = $.trim($('#txtKeyword').val());
            var maxPrice = $.trim($('#txtMaxPrice').val());
            var minPrice = $.trim($('#txtMinPrice').val());
            var query = [];
            var queryUrl = "";
            if (keyword.length > 0)
                query.push("keyword=" + keyword);
            var numberReg = /^\d+$/;
            if (maxPrice.length > 0) {
                if (!numberReg.test(maxPrice)) {
                    alert("最高价格必须为数字");
                    return false;
                } else {
                    query.push("maxPrice=" + maxPrice);
                }
            }
            if (minPrice.length > 0) {
                if (!numberReg.test(minPrice)) {
                    alert("最低价格必须为数字");
                    return false;
                } else {
                    query.push("minPrice=" + minPrice);
                }
            }
            queryUrl = query.join('&');
            window.location.href = '../p_list.aspx?' + queryUrl;
        });
        var username = getCookie('tmjcshop_userName');
        if (username != null) {
            $('#member_username').html(username);
            $('#member_username').show();
        } else {
            $('#member_username').hide();
        }
        var isLogin = getCookie('tmjcshop_isLogin');
        if (isLogin != null && isLogin == "yes") {
            $('#logout').show();
            $('#login').hide();
            $('#registe').hide();
            $('#logout').bind('click', function () {
                delCookie('tmjcshop_isLogin');
                $(this).hide();
                window.location.href = 'login.aspx';
            });
        } else {
            $('#logout').hide();
            $('#login').show();
            $('#registe').show();
        }


    });

</script>
