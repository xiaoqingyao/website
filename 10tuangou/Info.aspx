<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="Info" %>

<%@ Register Src="UserContral/DetailControl.ascx" TagName="DetailControl" TagPrefix="uc3" %>

<%@ Register Src="UserContral/Bootom.ascx" TagName="Bootom" TagPrefix="uc2" %>

<%@ Register Src="UserContral/top.ascx" TagName="top" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>产品详细信息</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; text-align:left; vertical-align: top; border-right: darkgray 1px solid; border-top: darkgray 1px solid; border-left: darkgray 1px solid; width: 100%; border-bottom: darkgray 1px solid; text-align:center;">
    <form id="form1" runat="server">
    <center>
       <table width="788" style="background-color: olive;" cellpadding="0" cellspacing="0">
    <tr>
    <td style="width: 788px">
        <table width="780px" style="background-color: white;">
            <tr>
                <td style="height: 165px" colspan="2">
                  <uc1:top ID="Top2" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align: top; text-align: left">
                    <uc3:DetailControl ID="DetailControl2" runat="server" />
                </td>
            </tr>
              <tr>
                  <td colspan="2">
                     <uc2:Bootom ID="Bootom1" runat="server" />
                  </td>
            </tr>
        </table>
          </td>
            </tr>
        </table>
    
    </center>
    </form>
</body>
</html>