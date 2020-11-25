<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NowWorkFlow.ascx.cs" Inherits="OA.aspx.Moa.NWorkFlow.NowWorkFlow" %>
 <div>
        <%
            foreach (var item in EmailList)
            {
        %>
        <ul class="pageitem">
            <li class="textbox"><span class="header">
               <%=item.WorkName %> </span><%=item.JieDianName %></li>
            <li class="menu"><a href="NWorkFlow/DoWork.aspx?DoType=putong&ID=<%=item.ID %>">
                <img alt="Description" src="Style/Mobile/thumbs/safari.png" />
                <span class="name">处理</span> <span class="comment">
                    <%=item.TimeStr.Value.ToString("yyyy-M-dd")%></span> <span class="arrow"></span>
            </a></li>
        </ul>
        <% } %>
    </div>