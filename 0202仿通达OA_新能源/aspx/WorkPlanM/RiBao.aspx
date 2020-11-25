<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiBao.aspx.cs" Inherits="FTD.Web.UI.aspx.WorkPlanM.RiBao" %>


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
                        <a class="hei" href="../Main/MyDesk.aspx">桌面</a>&nbsp;>>&nbsp;工作计划管理&nbsp;>>&nbsp;新建日报
                    </td>
                    <td align="right" valign="middle" style="height: 30px;">

                        <asp:Button ID="iButton1" runat="server" CssClass="btn btn-blue" Text="保存" />

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
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">汇报标题：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">汇报人：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox6" runat="server" Width="350px">张国龙</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">汇报日期：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="TextBox7" runat="server" Width="350px">2019-03-20</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">汇报日期从：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtProjectSerils" runat="server" Width="350px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" align="right">到：
                    </td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:TextBox ID="txtProjectName" runat="server" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProjectName"
                            ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                      <td style="width: 170px; height: 25px; background-color: #f9f9f7"  align="right">
                          工作内容
                    </td>
                    <td style="width: 170px; height: 25px; background-color: #f9f9f7" >
                        <label style="color:red">【友情提示】：您可以根据工作计划快速生成工作汇报。</label><asp:Button ID="Button2" runat="server" CssClass="btn btn-blue" Text="选择计划明细…" />
                        <table class="gridview_m" cellspacing="0" rules="all" id="GVData" style="border-width: 1px; border-style: Groove; width: 100%; border-collapse: collapse;">
                            <tbody>
                                <tr style="color: Black; background-color: #F3F3F3; font-size: 12px; height: 30px;">
                                    <th scope="col" style="width: 35px;">
                                        <input id="CheckBoxAll" onclick="CheckAll()" type="checkbox">
                                    </th>
                                    <th scope="col">序号</th>
                                    <th scope="col">工作项目</th>
                                    <th scope="col">工作内容</th>
                                    <th scope="col">完成状态</th>
                                    <th scope="col">是否专项项目</th>
                                    <th scope="col">项目名称</th>
                                    <th scope="col">备注</th> 
                                </tr>
                                <tr align="center" style="height: 25px;">
                                    <td>
                                        <input id="GVData_CheckSelect_0" type="checkbox" name="GVData$ctl02$CheckSelect">
                                    </td>
                                    <td>1
                                    </td>
                                    <td align="left">
                                        <input type="text" />
                                    </td>
                                    <td> <input type="text" /></td>
                                    <td><select><option>进行中</option><option>已完成</option></select></td>
                                    <td><select><option>否</option><option>是</option></select></td>
                                    <td><input type="text" /></td>
                                    <td> <input type="text" /></td>
                                </tr>
                                
                                 <tr align="center" style="height: 25px;">
                                    <td>
                                        <input id="GVData_CheckSelect_0" type="checkbox" name="GVData$ctl02$CheckSelect">
                                    </td>
                                    <td>2
                                    </td>
                                    <td align="left">
                                        <input type="text" />
                                    </td>
                                    <td> <input type="text" /></td>
                                    <td><select><option>进行中</option><option>已完成</option></select></td>
                                    <td><select><option>否</option><option>是</option></select></td>
                                    <td><input type="text" /></td>
                                    <td> <input type="text" /></td>
                                </tr>
                                 <tr align="center" style="height: 25px;">
                                    <td>
                                        <input id="GVData_CheckSelect_0" type="checkbox" name="GVData$ctl02$CheckSelect">
                                    </td>
                                    <td>3
                                    </td>
                                    <td align="left">
                                        <input type="text" />
                                    </td>
                                    <td> <input type="text" /></td>
                                    <td><select><option>进行中</option><option>已完成</option></select></td>
                                    <td><select><option>否</option><option>是</option></select></td>
                                    <td><input type="text" /></td>
                                    <td> <input type="text" /></td>
                                </tr>
                                 <tr align="center" style="height: 25px;">
                                    <td>
                                        <input id="GVData_CheckSelect_0" type="checkbox" name="GVData$ctl02$CheckSelect">
                                    </td>
                                    <td>4
                                    </td>
                                    <td align="left">
                                        <input type="text" />
                                    </td>
                                    <td> <input type="text" /></td>
                                    <td><select><option>进行中</option><option>已完成</option></select></td>
                                    <td><select><option>否</option><option>是</option></select></td>
                                    <td><input type="text" /></td>
                                    <td> <input type="text" /></td>
                                </tr>
                                 <tr align="center" style="height: 25px;">
                                    <td>
                                        <input id="GVData_CheckSelect_0" type="checkbox" name="GVData$ctl02$CheckSelect">
                                    </td>
                                    <td>5
                                    </td>
                                    <td align="left">
                                        <input type="text" />
                                    </td>
                                    <td> <input type="text" /></td>
                                    <td><select><option>进行中</option><option>已完成</option></select></td>
                                    <td><select><option>否</option><option>是</option></select></td>
                                    <td><input type="text" /></td>
                                    <td> <input type="text" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>

                </tr>
               <tr>
                    <td align="right" style="width: 170px; height: 25px; background-color: #f9f9f7">附件：</td>
                    <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>&nbsp;
                        <asp:ImageButton ID="iButton32" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" />
                        &nbsp; &nbsp;
            
                        <asp:ImageButton ID="iButton41" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/ReadFile.gif" />
                        &nbsp; &nbsp;
            
                        <asp:ImageButton ID="iButton512" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" ImageUrl="~/images/Button/EditFile.gif" /></td>
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
