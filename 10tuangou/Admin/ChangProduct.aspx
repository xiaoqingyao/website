<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangProduct.aspx.cs" Inherits="Admin_ChangProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title> <base target ="_self" />  
</head>
<script type="text/javascript">
        var i=1
        function addFile()
        {
         if (i<8)
            {var str = '<BR> <input type="file" name="File" runat="server" style="width: 300px"/>'
            document.getElementById('MyFile').insertAdjacentHTML("beforeEnd",str)
            }
        else
            {
                alert("您一次最多只能上传8张图片！")
            }
            i++
        }
</script>

<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="4" style="height: 18px">
                    修改产品信息</td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    产品名字:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                </td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    产品类别:</td>
                <td style="height: 24px">
                    <asp:DropDownList ID="ddlproducttype" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="btnAddType" runat="server" OnClick="btnAddType_Click" Text="添 加" /></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    价格:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    所属公司:</td>
                <td style="height: 24px">
                    <asp:DropDownList ID="ddlcompanyname" runat="server">
                    </asp:DropDownList></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    产品图标</td>
                <td style="height: 24px">
                    <asp:FileUpload ID="fuico" runat="server" /></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    产品简介:</td>
                <td style="height: 24px">
                    <asp:TextBox ID="txtintroduct" runat="server" Height="87px" TextMode="MultiLine"
                        Width="330px"></asp:TextBox>
                </td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px; height: 24px">
                </td>
                <td style="height: 24px">
                    产品相关的图片:</td>
                <td style="height: 24px">
                    <p id="MyFile">
                        <input id="File1" runat="server" name="File" style="width: 300px" type="file" /><input
                            onclick="addFile();" type="button" value="继续添加" />
                    </p>
                </td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                </td>
                <td>
                </td>
                <td>
                    <asp:ImageButton ID="ibtnOk" runat="server" ImageUrl="~/Image/ok.jpg" OnClick="ibtnOk_Click" />
                    <asp:ImageButton ID="ibtnCancel" runat="server" CausesValidation="False" ImageUrl="~/Image/cancel.jpg"
                        OnClick="ibtnCancel_Click" /></td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
