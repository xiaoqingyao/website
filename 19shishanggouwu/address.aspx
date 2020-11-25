<%@ Page Language="C#" MasterPageFile="~/AccountCenter.master" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="address" Title="收货地址管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="user_right_body">
    <div class="main">
          <div class="part">
            <div class="h"><span>收货地址管理</span></div>
            
            <div class="c" >
                <table class="table_user no_border">
                  <tbody><tr>
                    <th class="tab_l_width">　　&nbsp;&nbsp;&nbsp; 邮编号：</th>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="TextBox7" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                    <th>　　真实姓名：</th>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBox8" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                    <th>　　手机号码：</th>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                    <th>　　固定电话：</th>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                    <th>　　地　　址：</th>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="275px"></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td>              
                    
                        <span class="button_2">
                          <asp:Button ID="Button2" runat="server" Text="提交信息" 
                            onclick="Button2_Click"  />
                           
                     </span>　　<input name="act" value="act_edit_profile" 
type="hidden"/>
					
					<input name="other[schoolAreaId]" id="schoolAreaId" value="" 
type="hidden"/>
					<input name="schoolarea" id="schoolarea" value="" type="hidden"/>
					
                    </td>
                  </tr>
                </tbody></table>
              
            </div>
            <div class="login_r"  style="margin-left:20px;">
                <img src="images/yqtx.gif" alt="" />友情提示：（*号必填）<br />
                　　1. 填写的收货地址必须是真实，有效的<br />
                　　2. 收货地址的所有内容都必须填写<br />
                　　3. 如果信息不准确，将导致货物发送有误<br />
            </div>
            
          </div>
          
        </div>
</div>
</asp:Content>

