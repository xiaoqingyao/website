<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectAdd.aspx.cs" Inherits="FTD.Web.UI.aspx.ProjectM.ProjectAdd" %>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <script src="../../JS/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

    
    <script src="../../UEditor/editor_config.js" type="text/javascript"></script>
    <script src="../../UEditor/editor_all.js" type="text/javascript"></script>


    <script language="javascript">
        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" style="height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;项目管理&nbsp;>>&nbsp;添加项目信息
                    </td>
                    <td align="right" valign="middle" style="height: 30px;">

                        <asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="提交"  />

                        &nbsp;
                        <button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">返回</button></td>
                </tr>
                <tr>
                    <td height="3px" colspan="2" style="background-color: #ffffff"></td>
                </tr>
            </table>
            <!--******************************增加页面代码********************************-->

            <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1">
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">项目编号：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtProjectSerils" runat="server" Width="350px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">项目名称：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtProjectName" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">建设起止年限：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">从
                        <asp:DropDownList runat="server">
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                        </asp:DropDownList>
                        到
                        <asp:DropDownList runat="server">
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">项目区划：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:DropDownList runat="server">
                            <asp:ListItem>--请选择省份--</asp:ListItem>
                            <asp:ListItem>山东省</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList runat="server">
                            <asp:ListItem>--请选择城市--</asp:ListItem>
                            <asp:ListItem>济南市</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">建设地点：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:DropDownList runat="server">
                            <asp:ListItem>--请选择区县--</asp:ListItem>
                            <asp:ListItem>高新区</asp:ListItem>
                            <asp:ListItem>天桥区</asp:ListItem>
                            <asp:ListItem>槐荫区</asp:ListItem>
                            <asp:ListItem>市中区</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">项目单位：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:DropDownList runat="server">
                            <asp:ListItem>--请选择项目单位--</asp:ListItem>
                            <asp:ListItem>泰开集团有限公司</asp:ListItem>
                            <asp:ListItem>河北重型汽车制造有限公司</asp:ListItem>
                            <asp:ListItem>山东蓝海可燃冰勘探开发研究院有限公司</asp:ListItem>
                            <asp:ListItem>山东通洋氢能科技有限公司</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>


                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">项目类别：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">

                        <asp:DropDownList runat="server">
                            <asp:ListItem>新能源</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>


                

                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">所属领域：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">

                        <asp:DropDownList runat="server">
                            <asp:ListItem>新能源汽车</asp:ListItem>
                            <asp:ListItem>氢能</asp:ListItem>
                            <asp:ListItem>核电</asp:ListItem>
                            <asp:ListItem>可燃冰</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>

                
                
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">实施阶段：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">

                        <asp:DropDownList runat="server">
                            <asp:ListItem>先期开工</asp:ListItem>
                            <asp:ListItem>储备谋划</asp:ListItem>
                            <asp:ListItem>新开工</asp:ListItem>
                            <asp:ListItem>竣工</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">合作方式：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">

                        <asp:DropDownList runat="server">
                            <asp:ListItem>合资合作</asp:ListItem>
                            <asp:ListItem>园区招商</asp:ListItem>
                            <asp:ListItem>技术合作</asp:ListItem>
                            <asp:ListItem>独资</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">省里推荐指数：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">

                        <asp:DropDownList runat="server">
                            <asp:ListItem>1（推荐签约）</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">是否为重点项目：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">

                        <asp:DropDownList runat="server">
                            <asp:ListItem>是</asp:ListItem>
                            <asp:ListItem>否</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">主要建设内容：
                    </td>

                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="TxtContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <script type="text/javascript">
                        var editor = new baidu.editor.ui.Editor({ id: 'editor', minFrameHeight: 300 }); editor.render("TxtContent");
                    </script>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                </td>

               
                </tr>


                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">联系人：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">联系电话：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">邮箱：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox3" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">单位地址：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox4" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">项目金额：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox5" runat="server" Width="350px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">合同以及附件：</td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>&nbsp;
                        <asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" />
                        &nbsp; &nbsp;
            
                        <asp:ImageButton ID="iButton4" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/ReadFile.gif"/>
                        &nbsp; &nbsp;
            
                        <asp:ImageButton ID="iButton5" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/EditFile.gif" /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">上传附件：</td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />

                        <asp:Button ID="iButton2" runat="server" CausesValidation="False" CssClass="btn btn-blue" Text="上传" /></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">备注说明：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtBackInfo" runat="server" Width="350px" Height="90px" TextMode="MultiLine"></asp:TextBox>&nbsp;
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
