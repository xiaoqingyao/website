<%@ Page Language="C#" MasterPageFile="~/zt.master" AutoEventWireup="true" EnableViewState="false" CodeFile="Register.aspx.cs" Inherits="Register" Title="会员注册" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      /*  .style1
        {
            height: 52px;
        }*/
        .style2
        {
            width: 90px;
        }
        .style3
        {
            height: 52px;
            width: 90px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="re_zt">
        <div class="re_zt_t">会员注册</div>
        <div>
            <div class="border1_t"></div>
            <div class="border1_m">
                <table class="table_form pad_4" id="reg_fm">
                   <tbody>
                        <tr>
                          <th class="style2"><span class="must_input">*</span>Email</th>
                          <td>
                              <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
&nbsp;<span class="mess_pop_2"><span id="email_notice" class="bg_l ">Email是您的账户名.
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                  ControlToValidate="TextBox7" ErrorMessage="×邮箱格式不正确" 
                                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                  Display="Dynamic"></asp:RegularExpressionValidator>
                              <span class="clear"></span></span>
                            </span>                
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox7" 
                                  ErrorMessage="×此项不能为空" Display="Dynamic"></asp:RequiredFieldValidator>
                          </td>
                        </tr>
                        <tr>
                          <th class="style2"><span class="must_input">*</span>密码</th>
                          <td>
                              <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" Width="124px"></asp:TextBox>
&nbsp;<span class="mess_pop_2">
                            <span id="password_notice" class="bg_l ">由6个以上英文字母、数字或符号组成.<span class="clear"></span></span></span><asp:CustomValidator 
                                  ID="CustomValidator1" runat="server" ErrorMessage="密码不能少于6位" 
                                  onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                          </td>
                        </tr>
                        
                        <tr>
                          <th class="style2"><span class="must_input">*</span>确认密码</th>
                          <td>
                              <asp:TextBox ID="TextBox9" runat="server" TextMode="Password" Width="124px"></asp:TextBox>
&nbsp;<span class="mess_pop_2"><span id="conform_password_notice" class="bg_l "><span class="clear">　</span><asp:CompareValidator 
                                  ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" 
                                  ControlToValidate="TextBox9" ErrorMessage="×两次输入不一致"></asp:CompareValidator>
                              </span>
                            </span>
                          </td>
                        </tr>
                        
                        <tr>
                          <th class="style2"><span class="must_input">*</span>昵称</th>
                          <td>
                              <asp:TextBox ID="TextBox8" runat="server" Width="124px"></asp:TextBox>
&nbsp;<span class="mess_pop_2"><span id="username_notice" class="bg_l "><span class="clear"></span></span></span></td>
                        </tr>                    
                         <tr>
                           <th class="style2"><span class="must_input">*</span>QQ</th>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Width="124px"></asp:TextBox></td>
                        </tr>  
                        <tr>
                           <th class="style2"><span class="must_input">*</span>手机号</th>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Width="124px"></asp:TextBox></td>
                        </tr>
                        <tr>
                           <th class="style2"><span class="must_input">*</span>安全问题</th>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Width="235px"></asp:TextBox></td>
                        </tr>
                        <tr>
                           <th class="style2"><span class="must_input">*</span>安全密码</th>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Width="235px"></asp:TextBox></td>
                        </tr>                 
                         <tr>
                          <td class="style2"></td>
                          <td><br/><input name="agreement" value="1" checked="checked" class="checkbox" type="checkbox"  style="width:20px;"/>&nbsp;我已看过并接受《<a href="#" target="_blank" style="text-decoration: underline;">用户协议</a>》 </td>
                        </tr>
                       
                        <tr>
                          <td class="style3"></td>
                          <td class="style1">
                            <%--<input name="Submit" src="images/but_reg.gif" id="submit" type="image" />  --%>            
                              <asp:ImageButton ID="ImageButton1" runat="server" 
                                  ImageUrl="~/images/but_reg.gif"  Height="35px" Width="98px" 
                                  onclick="ImageButton1_Click"/>
                            <input name="act" value="act_register" type="hidden" />
                            <input value="0" type="hidden" />              
                           </td>
                        </tr>
                        <tr>
                          <td class="style2"></td>
                          <td>
                            <br/>
                            <img class="b_5" src="images/ico_04.gif" alt=""/>我已有账号，我要&nbsp;<a href="Login.aspx"style="color: rgb(210,128, 164);">登录<br/>
                           </td>
                        </tr>
                      </tbody></table>
            </div>
            <div class="border1_b"></div>
        </div>
    </div>
</asp:Content>

