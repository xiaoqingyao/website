<%@ Page Language="C#" AutoEventWireup="true" CodeFile="treeMenuSys.aspx.cs" Inherits="menu_treeViewMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="../CSS/CSS.css" />
</head>
<body style="margin-left: 30px; background-image: url(../image/登录左侧框加长.gif); margin-top: 10px;">
    <form id="form1" runat="server">
        <table style="width: 150px" id="ig" class="css">
            <tr>
                <td colspan="3" rowspan="3">
                    <asp:TreeView ID="TreeView1" runat="server" Font-Size="Small" Height="427px" LineImagesFolder="~/icon"
                        ShowLines="True" Width="150px" BackColor="#E1E8FF" CssClass="css" ForeColor="#072EAB" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                        <Nodes>
                            <asp:TreeNode Text="审批管理" Value="审批管理">
                                <asp:TreeNode Text="发起申请" Value="发起申请" NavigateUrl="~/WorkFlow/Create.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="我的申请" Value="我的申请" NavigateUrl="~/WorkFlow/MyApplication.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="待审批工作" Value="待审批工作" NavigateUrl="~/WorkFlow/CheckingBills.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="添加事务类型" Value="添加事务类型" NavigateUrl="~/WorkFlow/addWorkFlowType.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="编辑事务类型" Value="编辑事务类型" NavigateUrl="~/WorkFlow/EditWorkFlowType.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="审批节点设置" Value="审批节点设置" NavigateUrl="~/WorkFlow/Setup.aspx" Target="rightFrame"></asp:TreeNode>
                                 <asp:TreeNode Text="审批通过汇总" Value="审批通过汇总" NavigateUrl="~/WorkFlow/allApprove.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="系统工具" Value="系统工具">
                                <asp:TreeNode Text="记事本" Value="记事本" NavigateUrl="~/BaseInfo/noteBook.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Checked="True" Text="班级管理" Value="班级管理">
                                <asp:TreeNode Text="新建班级" Value="新建班级" NavigateUrl="~/BaseInfo/adddept.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="编辑班级信息" Value="编辑班级信息" NavigateUrl="~/BaseInfo/EditDept.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="查看班级信息" Value="查看班级信息" NavigateUrl="~/BaseInfo/EditDept.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="学生管理" Value="学生管理">
                                <asp:TreeNode Text="添加学生信息" Value="添加学生信息" NavigateUrl="~/BaseInfo/addEmployee.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="编辑学生信息" Value="编辑学生信息" NavigateUrl="~/BaseInfo/editEmployee.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="查看学生信息" Value="查看学生信息" NavigateUrl="~/BaseInfo/editEmployee.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="文件管理" Value="文件管理">
                                <asp:TreeNode Text="传送文件" Value="传送文件" NavigateUrl="~/fileManage/sendFile.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="接收文件" Value="接收文件" NavigateUrl="~/fileManage/inceptFile.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="删除文件" Value="删除文件" NavigateUrl="~/fileManage/fileList.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="公告管理" Value="公告管理">
                                <asp:TreeNode Text="查看公告" Value="查看公告" NavigateUrl="../BaseInfo/noticeList.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="发布公告" Value="发布公告" NavigateUrl="~/BaseInfo/notice.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <%--<asp:TreeNode Text="交流管理" Value="交流管理">
                                <asp:TreeNode NavigateUrl="~/communion/setVote.aspx" Target="rightFrame" Text="设置投票活动"
                                    Value="设置投票活动"></asp:TreeNode>
                                <asp:TreeNode Text="活动投票" Value="活动投票" NavigateUrl="~/communion/vote.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode NavigateUrl="~/communion/voteResult.aspx" Target="rightFrame" Text="查看投票结果"
                                    Value="查看投票结果"></asp:TreeNode>
                            </asp:TreeNode>--%>
                            <%--<asp:TreeNode Text="考勤管理" Value="考勤管理">
                                <asp:TreeNode Text="上下课时间设置" Value="上下课时间设置" NavigateUrl="~/communion/checkAttendance/setTime.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="学生上课签到" Value="学生上课签到" NavigateUrl="~/communion/checkAttendance/lateOrleave.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="学生下课签退" Value="学生下课签退" NavigateUrl="~/communion/checkAttendance/lateOrleave.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>--%>
                            <asp:TreeNode Text="系统管理" Value="系统管理">
                                <asp:TreeNode Text="个人密码设置" Value="个人密码设置" NavigateUrl="~/system/updatePwd.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="系统操作员设置" Value="系统操作员设置" NavigateUrl="~/system/setSysName.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="规章制度管理" Value="规章制度管理">
                                <asp:TreeNode Text="编辑规章制度" Value="编辑规章制度" NavigateUrl="~/rule/editRule.aspx" Target="rightFrame"></asp:TreeNode>
                                <asp:TreeNode Text="规章制度" Value="规章制度" NavigateUrl="~/rule/rule.aspx" Target="rightFrame"></asp:TreeNode>
                            </asp:TreeNode>
                        </Nodes>
                    </asp:TreeView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
