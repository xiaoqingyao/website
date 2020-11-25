<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateDetails.aspx.cs" Inherits="UpdateDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>更新资料</title>
        <script type="text/javascript" language="javascript">
		    function getImage()
            {
	            var s=document.all("filePhoto").value;
	            document.Form1.imgPhoto.src=s;
            }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 573px">
            <tr>
                <td colspan="3" style="height: 21px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 259px">
                    用户名：</td>
                <td style="width: 28px">
                    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
                <td style="width: 530px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 259px; height: 26px;">
                    电子邮箱：</td>
                <td style="width: 28px; height: 26px;">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                <td style="width: 530px; height: 26px;">
                </td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 259px; height: 26px;">
                    电话号码：</td>
                <td style="width: 28px; height: 26px;">
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                <td style="width: 530px; height: 26px;">
                </td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 259px; height: 26px;">
                    地址：</td>
                <td style="width: 28px; height: 26px;">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
                <td style="width: 530px; height: 26px;">
                </td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 259px; height: 26px">
                    MSN：</td>
                <td style="width: 28px; height: 26px">
                    <asp:TextBox ID="txtMSN" runat="server"></asp:TextBox></td>
                <td rowspan="3" style="width: 530px">
                    <asp:Image ID="imgPhoto" runat="server" ImageUrl="~/Image/yulan.jpg" Width="115px" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 259px">
                    QQ：</td>
                <td style="width: 28px">
                    <asp:TextBox ID="txtQQ" runat="server"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 259px">
                    照片：</td>
                <td style="width: 28px">
                      <input id="filePhoto" type="file" onchange="getImage()" runat="server" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 259px">
                </td>
                <td style="width: 28px">
                </td>
                <td style="width: 530px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 259px">
                </td>
                <td style="width: 28px">
                    <asp:Button ID="btnOk" runat="server" Text="确定" OnClick="btnOk_Click" Width="58px" /></td>
                <td style="width: 530px">
                </td>
                <td>
                </td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>