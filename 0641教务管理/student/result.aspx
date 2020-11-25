<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="student_result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <br />
            <fieldset style="width: 583px; height: 326px; text-align: left">
                <legend class="mailTitle"><strong>学生成绩</strong></legend>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                    DataKeyNames="id" Font-Size="Small" ForeColor="Black" GridLines="None" Height="297px"
                    OnPageIndexChanging="GridView1_PageIndexChanging"
                    Width="543px">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="stuID" HeaderText="学号" />
                        <asp:BoundField DataField="stuName" HeaderText="姓名" />
                        <asp:BoundField DataField="courseName" HeaderText="考试科目" />
                        <asp:BoundField DataField="score" HeaderText="考试成绩" />
                        <asp:BoundField DataField="scoreMode" HeaderText="考试状态" />
                    </Columns>
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
            </fieldset>
        </div>
    
    </div>
    </form>
</body>
</html>
