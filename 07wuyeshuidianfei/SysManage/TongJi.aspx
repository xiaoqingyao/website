<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="TongJi.aspx.cs" Inherits="SysManage_TongJi" %>

<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="images/tab_05.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="middle">
                                        <img src="images/tb.gif" width="16" height="16" align="absmiddle" />
                                        当前位置：用电/用水统计分析
                                    </td>
                                    
                                </tr>
                            </table>
                        </td>
                        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="8"></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td style="padding:3px 0;">
                                    
                                </td>
                              </tr>
                            </table>
                        </td>
                        <td width="8"></td>
                    </tr>
                    <tr>
                        <td width="100%" colspan="3">
                        <br /><b>用电统计分析：</b><br />

<dotnet:Chart ID="Chart1" runat="server" Height="300px" PaletteName="Random">
                                        <DefaultTitleBox Visible="True">
                                        </DefaultTitleBox>
                                        <TitleBox Position="Left">
                                        </TitleBox>
                                        <DefaultLegendBox CornerBottomRight="Cut" Visible="True">
                                            <HeaderEntry Name="Name" SortOrder="-1" Value="Value" Visible="False">
                                                <DividerLine Color="Gray" />
                                                <LabelStyle Font="Arial, 8pt, style=Bold" />
                                            </HeaderEntry>
                                        </DefaultLegendBox>
                                        <DefaultSeries Type="Column">
                                        </DefaultSeries>
                                    </dotnet:Chart>
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td width="100%" colspan="3">
                        <br /><b>用水统计分析：</b><br />

<dotnet:Chart ID="Chart2" runat="server" Height="300px" PaletteName="Random">
                                        <DefaultTitleBox Visible="True">
                                        </DefaultTitleBox>
                                        <TitleBox Position="Left">
                                        </TitleBox>
                                        <DefaultLegendBox CornerBottomRight="Cut" Visible="True">
                                            <HeaderEntry Name="Name" SortOrder="-1" Value="Value" Visible="False">
                                                <DividerLine Color="Gray" />
                                                <LabelStyle Font="Arial, 8pt, style=Bold" />
                                            </HeaderEntry>
                                        </DefaultLegendBox>
                                        <DefaultSeries Type="Column">
                                        </DefaultSeries>
                                    </dotnet:Chart>
                        </td>
                    </tr>
                    
                    
                    
                </table>
            </td>
        </tr>
        
    </table>
</asp:Content>