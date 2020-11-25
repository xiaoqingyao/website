<%@ Import Namespace="AllPower.FrontPublic" %>
<%@ Import Namespace="System.Data" %>
<script runat="server" language="c#">
    private int CurrentPage = 1;
    private int PageSize = 10;
    private int prevPage = 0;
    private int nextPage = 0;
    Common commObj = new Common();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string nodeCode = commObj.SqlCheck(Request.QueryString["c"]);
        string keyWord = commObj.SqlCheck(Request["k"]);  //查询条件
        string OrderStr = " ID DESC";
        string sql = "Select Id,Title,UpdateDate from K_U_Article where NodeCode='" + nodeCode + "' AND Title Like '%" + keyWord + "%' AND FlowState=99 AND IsDel=0";
        CurrentPage = commObj.ParseInt(Request.QueryString["p"], 1);  //当前页数

        DataTable dt = commObj.SplitDataBind(sql, CurrentPage, PageSize, OrderStr);
        rptData.DataSource = dt;
        rptData.DataBind();
        if (CurrentPage < 2)
            prevPage = 1;
        else
            prevPage = CurrentPage - 1;

        if (CurrentPage >= commObj.TotalPageCount)
            nextPage = commObj.TotalPageCount;
        else
            nextPage = CurrentPage + 1;
    }
    </script>
    
    <script type="text/javascript">
        function OnSearch() {
        var k=encodeURI(document.getElementById("keyWord").value);
        location.href = "?p=1&k=" + k + "&c=<%=Request.QueryString["c"] %>";
    }
    function OnGo() {
        var p = document.getElementById("page").value;
        location.href = "?p="+p+"&k=<%=Server.UrlEncode(Request["k"]) %>&c=<%=Request.QueryString["c"] %>";
    }
    </script>
    <div class="search"><input type="text" id="keyWord" name="keyWord" maxlength="20" /> <input type="button" name="btnSearch" onclick="OnSearch()" value="搜索"/></div>
    <div>
    <asp:Repeater ID="rptData" runat ="server">
            <ItemTemplate>
                <div class="title" style="float:left"><%#Eval("Title") %></div>
                <div class="title" style="float:right"><%#Eval("UpdateDate","{0:yyyy-MM-dd}") %></div>
                <br />
            </ItemTemplate>
        </asp:Repeater>    
    </div>
    <div class="page" align="center">
        <div style="padding-right:20px;float:left">总记录数：<%=commObj.TotalRecordCount%></div>
        <div style="padding-right:20px;float:left">总页数：<%=commObj.TotalPageCount%></div>
        <div style="padding-right:20px;float:left">当前第：<%=CurrentPage %> 页</div>
        <div style="padding-right:30px;float:left">每页：<%=PageSize %> 条</div>
        <div style="padding-right:10px;float:left"><a href="?p=1&k=<%=Server.UrlEncode(Request["k"]) %>&c=<%=Request.QueryString["c"] %>">首页</a> </div>
        <div style="padding-right:10px;float:left"><a href="?p=<%=prevPage %>&k=<%=Server.UrlEncode(Request["k"]) %>&c=<%=Request.QueryString["c"] %>">上页</a> </div>
        <div style="padding-right:10px;float:left"><a href="?p=<%=nextPage %>&k=<%=Server.UrlEncode(Request["k"]) %>&c=<%=Request.QueryString["c"] %>">下页</a> </div>
        <div style="padding-right:10px;float:left"><a href="?p=<%=commObj.TotalPageCount %>&k=<%=Server.UrlEncode(Request["k"]) %>&c=<%=Request.QueryString["c"] %>">尾页</a> </div>
        
        <div style="padding-right:10px;float:left">转到：<input type="text" name="page" id="page" maxlength="5" size="2"/> <input type="button" id="btnGo" name="btnGo" value="Go" onclick ="OnGo()" /></div>
    </div>
