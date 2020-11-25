<%@ Page Language="C#" MasterPageFile="~/JXC.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="某进销存管理系统" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        
    <div style=" margin-top:30px; WIDTH: 720px; HEIGHT: 400px; background-image: url(images/df.jpg); text-align: left;">
    <table>
    <tr>
    <th style="width: 363px; height: 390px;" colspan=""> 
    <div style=" margin-top:20px; WIDTH: 350px; HEIGHT: 350px; ">
    命名规则 1.项目中命名规则项目中各个子项均以子项功能名称的各个汉字的第一个字母，并且都要大写，他们对应的三层中的类均以他们的名称
    </div>
    </th>
    <th style="width: 347px; height: 390px;">
    <div style=" margin-top:20px; WIDTH: 345px; HEIGHT: 350px; ">
    加上相应的后缀命名（例如：进货项，项目名JH，对应数据层中的类是JHService），类中的方法依据功能而定，项目中的页面命名是项目名为前缀加上相应功能名。
        2.数据库命名规则数据库名称与项目名称相同，数据库中表命名规则是表名称各个汉字的第一个字母，表中字段命名与表相同。
    </div>
    </th>
    </tr>
    </table>
   
    
    </div>	
</asp:Content>