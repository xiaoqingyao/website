<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuTemp.aspx.cs" Inherits="Main_MenuTemp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="导入UpLoadFile下的个人签名文件" /><br />
        <br />
        <br />
    <asp:TreeView id="ListTreeView" runat="server" ExpandDepth="0" ShowLines="True" ForeColor="Black">
                                            <ParentNodeStyle HorizontalPadding="2px" />
                                            <RootNodeStyle HorizontalPadding="2px" />
                                            <LeafNodeStyle HorizontalPadding="2px" />
                                            <Nodes>                   
                                            
                                            
                                            <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户管理" Value="客户管理" SelectAction="Expand">            
                                                                
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="会员管理" Value="会员管理" SelectAction="Expand">                                                         
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="我的会员" Value="HY001" NavigateUrl="../HY/HuiYuan.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="会员管理" Value="HY002" NavigateUrl="../HY/HYManage.aspx" Target="rform"></asp:TreeNode>
                                                                </asp:TreeNode> 
                                                                                                                    
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="我的客户" Value="我的客户" SelectAction="Expand">                                                         
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户信息" Value="C001" NavigateUrl="../CRM/MyCustom.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户联系人" Value="C002" NavigateUrl="../CRM/MyCustomLinkMan.aspx?CustomName=" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="联系记录" Value="C003" NavigateUrl="../CRM/MyCustomLinkLog.aspx?CustomName=" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="需求记录" Value="C004" NavigateUrl="../CRM/MyCustomNeed.aspx?CustomName=" Target="rform"></asp:TreeNode>                                                                    
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="报价记录" Value="C005" NavigateUrl="../CRM/MyCustomPrice.aspx?CustomName=" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="服务记录" Value="C006" NavigateUrl="../CRM/MyCustomService.aspx?CustomName=" Target="rform"></asp:TreeNode>  
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="回访记录" Value="C007" NavigateUrl="../CRM/MyCustomBack.aspx?CustomName=" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="投诉记录" Value="C008" NavigateUrl="../CRM/MyCustomHate.aspx?CustomName=" Target="rform"></asp:TreeNode> 
                                                                    
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="送样记录" Value="C018" NavigateUrl="../CRM/MySongYang.aspx?CustomName=" Target="rform"></asp:TreeNode> 
                                                                </asp:TreeNode> 
                                                                 <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户管理" Value="客户管理" SelectAction="Expand">                                                         
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户信息管理" Value="C009" NavigateUrl="../CRM/CustomInfo.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="联系人管理" Value="C010" NavigateUrl="../CRM/CustomLinkMan.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="联系记录管理" Value="C011" NavigateUrl="../CRM/CustomLinkLog.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="需求记录管理" Value="C012" NavigateUrl="../CRM/CustomNeed.aspx" Target="rform"></asp:TreeNode>                                                                    
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="报价记录管理" Value="C013" NavigateUrl="../CRM/CustomPrice.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="服务记录管理" Value="C014" NavigateUrl="../CRM/CustomService.aspx" Target="rform"></asp:TreeNode>  
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="回访记录管理" Value="C015" NavigateUrl="../CRM/CustomBack.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="投诉记录管理" Value="C016" NavigateUrl="../CRM/CustomHate.aspx" Target="rform"></asp:TreeNode> 
                                                                    
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="送样记录管理" Value="C019" NavigateUrl="../CRM/SongYang.aspx" Target="rform"></asp:TreeNode>
                                                                                                                                     
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="邮件信息群发" Value="C017" NavigateUrl="../CRM/CustomMsg.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="客户信息统计" Value="C020" NavigateUrl="../CRM/CustomSum.aspx" Target="rform"></asp:TreeNode>   
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/training.gif" Text="客户参数设置" Value="C021" NavigateUrl="../CRM/CustomSetting.aspx" Target="rform"></asp:TreeNode>                                            
                                                                </asp:TreeNode>  
                                                                </asp:TreeNode>
                                                                
                                                                                                
                                                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="进销存类" Value="进销存类" SelectAction="Expand">    
                                                                                                
                                                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="产品管理" Value="A009" NavigateUrl="../Sell/Product.aspx" Target="rform"></asp:TreeNode>
                                                                                                                                                
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="销售管理" Value="销售管理" SelectAction="Expand">
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="销售合同登记" Value="A010" NavigateUrl="../Sell/ContractDengJi.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="销售合同管理" Value="A011" NavigateUrl="../Sell/Contract.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="合同产品记录" Value="A012" NavigateUrl="../Sell/SellLog.aspx?HeTongName=" Target="rform"></asp:TreeNode>

                                                                    
                                                                </asp:TreeNode>  
                                                                
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="采购管理" Value="采购管理" SelectAction="Expand">
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="采购订单登记" Value="A015" NavigateUrl="../Supply/BuyDengJi.aspx" Target="rform"></asp:TreeNode>       
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="采购订单管理" Value="A016" NavigateUrl="../Supply/BuyOrder.aspx" Target="rform"></asp:TreeNode>      
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="订单产品记录" Value="A017" NavigateUrl="../Supply/BuyLog.aspx?OrderName=" Target="rform"></asp:TreeNode>                                                                   
                                                                </asp:TreeNode>  
                                                                
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="供应商管理" Value="供应商管理" SelectAction="Expand">                                                         
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="供应商管理" Value="A013" NavigateUrl="../Supply/Supplys.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="供应商联系人" Value="A014" NavigateUrl="../Supply/SupplysLink.aspx?GongYingShang=" Target="rform"></asp:TreeNode>                                                   
                                                                </asp:TreeNode>  
                                                                
                                                                </asp:TreeNode>  
                                                                
                                                                
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="项目管理" Value="项目管理" SelectAction="Expand">                                                         
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="项目信息" Value="X001" NavigateUrl="../Project/ProjectManage.aspx?ProjectName=" Target="rform"></asp:TreeNode>                                                                                                                                                            
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="评审信息" Value="X002" NavigateUrl="../Project/PingShen.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="项目进度" Value="X003" NavigateUrl="../Project/ProjectJinDu.aspx?ProjectName=" Target="rform"></asp:TreeNode> 
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="收款信息" Value="X004" NavigateUrl="../Project/ShouKuan.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="项目实施" Value="X005" NavigateUrl="../Project/ShiShiRiZhi.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="报销申请" Value="X006" NavigateUrl="../Project/BaoXiaoShenQing.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="报销管理" Value="X007" NavigateUrl="../Project/BaoXiaoGuanLi.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="项目利润" Value="X008" NavigateUrl="../Project/LiRuiGuanLi.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/roll_manage.gif" Text="数据统计" Value="X009" NavigateUrl="../Project/ShuJuTongJi.aspx?ProjectName=" Target="rform"></asp:TreeNode>
                                                           </asp:TreeNode>
                                            </Nodes>
                                        </asp:TreeView>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="将树形菜单中写入TreeList" />
        <img src="../images/1.jpg" /><br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="导入用户表" />
        <br />
    </div>
    </form>
</body>
</html>
