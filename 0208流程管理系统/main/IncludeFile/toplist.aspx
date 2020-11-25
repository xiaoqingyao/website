<%@ Import Namespace="AllPower.FrontPublic" %>

    <script runat="server" language="C#">
        //以下是读取数据库，需要专业人员修改
        private void TopListInit()
        {
            if (!Page.IsPostBack)
            {
                Common commObj = new Common();
                string nodeCode = commObj.SqlCheck(Request.QueryString["c"]);
                string sql = "Select Top 10 * from K_U_Article where NodeCode='" + nodeCode + "' AND FlowState=99 AND IsDel=0 Order By Id DESC";
                rptData.DataSource = commObj.GetRecord(sql);
                rptData.DataBind();
            }
        }
    </script>
    <% TopListInit();%>
    <div>
    <asp:Repeater ID="rptData" runat ="server">
            <ItemTemplate>
                <div class="title" style="float:left"><%#Eval("Title") %></div>
                <div class="data" style="float:right"><%#Eval("UpdateDate","{0:yyyy-MM-dd}") %></div>
                <br />
            </ItemTemplate>
        </asp:Repeater>    
    </div>
