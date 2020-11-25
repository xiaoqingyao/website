<%@ Import Namespace="AllPower.FrontPublic" %>

    <script runat ="server" language="C#">
        //以下是读取数据库，需要专业人员修改
        
        protected void OneRecordInIt()
        {
            Common commObj = new Common();
            string id = commObj.SqlCheck(Request.QueryString["id"]);
            string sql = "Select * from K_U_Article where ID='" + id + "'";
            rptData.DataSource = commObj.GetRecord(sql);
            rptData.DataBind();
        }
    </script>
    <%OneRecordInIt(); %>
    <div>
        <asp:Repeater ID="rptData" runat ="server">
            <ItemTemplate>
                <div class="title"><%#Eval("Title") %></div>
                <div class="title"><%#Eval("Content") %></div>
            </ItemTemplate>
        </asp:Repeater>    
    </div>

