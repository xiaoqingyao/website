<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomFormEdit.aspx.cs"
    Inherits="KingTop.Web.Admin.CustomFormEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加表单</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/validationEngine.jquery.css" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true, //是否即时验证，false为提交表单时验证,默认true
                success: false, //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
        window.onload = function() {
            if (type > -1) {
                showEditMessage("自定义表单", "CustomFormList.aspx<%=StrPageParams %>", "CustomFormEdit.aspx?NodeCode=<%=NodeCode %>", "CustomFormEdit.aspx?NodeCode=<%=NodeCode %>&action=edit&id=<%=ID %>");
            }
        }

        // 模型名是否重复
        function CheckModelRepeat(txtID, msgContainer) {
            var jsonParam;

            jsonParam = "{tbName:'" + $("#" + txtID).val() + "'}";
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/sysadmin/Model/ModelAjaxDeal.asmx/CheckModelRepeat",
                dataType: "json",
                data: jsonParam,
                success: function(msg) {
                    if (msg.d) {
                        $("#" + msgContainer).html("对不起，已经存在此模型名。");
                    }
                    else {
                        $("#" + msgContainer).html("恭喜您，通过检测！");
                    }
                }
            });
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> > <a href="CustomFormList.aspx?NodeCode=<%=NodeCode %>">自定义表单管理</a>&gt;
            <span style="color: Blue">添加表单</span></h4>
            <ul id="tags">
            <li class="selectTag"><a href="javascript:;">基本属性</a> </li>
            <li><a href="javascript:;">高级属性</a> </li>
        </ul>
        <div id="panel">
        <fieldset style="display:block;">
        <dl>
            <dt>
                <%=Resources.Model.ModelFieldGroupName%></dt>
            <dd style="color:Red">
                <asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]"></asp:TextBox>*</dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.TableName%></dt>
            <dd style="color:Red">
                K_F_<asp:TextBox ID="txtTableName" runat="server" CssClass="validate[required,length[5,12]"></asp:TextBox>
                 <input type="button" value="检测是否重复" onclick=" CheckModelRepeat('txtTableName','CheckNameISRepeatMSG')" />
  <span style="color:#ff0000;" id="CheckNameISRepeatMSG"></span>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.Summary%></dt>
            <dd>
                <asp:TextBox ID="txtsummary" runat="server" TextMode="MultiLine" Height="110px" Width="283px"></asp:TextBox>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.FrontModelAdd%></dt>
            <dd>
                <asp:DropDownList ID="ddlpageModel" runat="server">
                    <asp:ListItem Selected="dlue">前台表单模板(form_index.html)</asp:ListItem>
                </asp:DropDownList>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.FrontModelList%><br />
                <span style="color:#7A8B8B">如果前台不需要显示用户提交的表单信息，则不用设置</span>
                </dt>
            <dd>
                <asp:DropDownList ID="ddllistModel" runat="server">
                    <asp:ListItem Selected="dlue" Value="FormModel/Template/List/列表1.htm">列表1.htm</asp:ListItem>
                </asp:DropDownList>
            </dd>
        </dl>
        </fieldset>
        <fieldset style="display:none;">
        <!--2010-10-19去掉时间限制设置，暂时用不到此设置-->
        <dl style="display:none">
            <dt>
                <%=Resources.Model.TimeLimmit%></dt>
            <dd>
                <asp:CheckBox ID="cbTime" runat="server" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.BeginTime%></dt>
            <dd>
                <asp:TextBox ID="txtBeginTime" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.EndTime%></dt>
            <dd>
                <asp:TextBox ID="txtEndTime" runat="server"></asp:TextBox>
            </dd>
        </dl>
        
        <dl>
            <dt>
                <%=Resources.Model.Authcode%>
                <br />
                </dt>
            <dd>
                <asp:CheckBox ID="cbIsAuthcode" runat="server" Checked="true"/>
                <%=Resources.Common.OnTitle%> 
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsReply%>
                <br />
                <span style="color:#7A8B8B">后台管理员对用户提交的表单信息进行回复，如果表单信息不提交到后台则不用设置</span>
                </dt>
            <dd>
                <asp:CheckBox ID="cbIsReply" runat="server" />
                <%=Resources.Common.OnTitle%> 
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsRelease%>
                <br /><span style="color:#7A8B8B">设置会员提交的表单信息是否在前台显示</span>
                </dt>
            <dd>
                <asp:CheckBox ID="cbIsRelease" runat="server" />
                <%=Resources.Common.OnTitle%> 
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.ReplyType%>
                <br /> <span style="color:#7A8B8B">设置前台用户查看回复信息方式</span>
                </dt>
            <dd>
                <asp:DropDownList ID="ddlbrowseType" runat="server">
                    <asp:ListItem Value="1" Text='<%$Resources:Model,Everyone %>'></asp:ListItem>
                    <asp:ListItem Value="2" Text='<%$Resources:Model,IsUser %>'></asp:ListItem>
                    <asp:ListItem Value="3" Text='<%$Resources:Model,PasswordCode %>'></asp:ListItem>
                </asp:DropDownList>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsReview%>
                <br /> <span style="color:#7A8B8B">提交和回复的表单信息是否需要审核才发布到前台，如果表单信息不在前台显示则不用设置</span>
                </dt>
            <dd>
                <asp:DropDownList ID="ddlReview" runat="server">
                    <asp:ListItem Value="1" Text='<%$Resources:Model,NoReview %>'></asp:ListItem>
                    <asp:ListItem Value="2" Text='<%$Resources:Model,UserNoReview %>'></asp:ListItem>
                    <asp:ListItem Value="3" Text='<%$Resources:Model,Review %>'></asp:ListItem>
                </asp:DropDownList>
            </dd>
        </dl>
        <!--20101019暂时不做多级审核-->
        <dl style="display:none">
            <dt>
                <%=Resources.Model.ReviewFlow%></dt>
            <dd>
                <asp:DropDownList ID="ddlReviewFlow" runat="server">
                </asp:DropDownList>
            </dd>
        </dl>
        
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsSendUserPhone%></dt>
            <dd>
                <asp:CheckBox ID="cbIsSendUserPhone" runat="server" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsSendAdminEmail%>
                <br /> <span style="color:#7A8B8B">设置用户提交的表单信息发送到指定的邮箱中</span>
                </dt>
            <dd>
                <asp:CheckBox ID="cbIsSendAdminEmail" runat="server" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.AdminEmail%></dt>
            <dd>
                <asp:TextBox ID="txtEmails" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsSendAdminPhone%></dt>
            <dd>
                <asp:CheckBox ID="cbIsSendAdminPhone" runat="server" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.Phones%></dt>
            <dd>
                <asp:TextBox ID="txtPhones" runat="server"></asp:TextBox>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SubmitLimitTime%></dt>
            <dd>
                <asp:TextBox ID="txtSubmitLimitTime" runat="server" CssClass="validate[required,custom[onlyNumber]">0</asp:TextBox>
                0秒为不限制提交时间
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.SubmitLimitIP%></dt>
            <dd>
                <asp:TextBox ID="txtSubmitLimitIP" runat="server" Height="110px" TextMode="MultiLine"
                    Width="327px"></asp:TextBox>
                例如 192.168.0.*|192.168.1.50-198.168.1.100
            </dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsSaveDataBase%><br />
                </dt>
            <dd>
                <asp:CheckBox ID="cbIsSaveDataBase" runat="server" Checked="true" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsUserAnswer%></dt>
            <dd>
                <asp:CheckBox ID="cbIsUserAnswer" runat="server" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl>
        <dt>字段值来源于URL参数值的字段：</dt>
        <dd><asp:TextBox ID="txtFieldFromUrlParamValue" runat="server"></asp:TextBox></dd>
        </dl>
        <dl style="display:none">
            <dt>
                <%=Resources.Model.IsSendUserEmail%>
                
                <br /><span style="color:#7A8B8B">启用了会员才能提交表单后设置此项有效</span>
                </dt>
            <dd>
                <asp:CheckBox ID="cbIsSendUserEmail" runat="server" />
                <%=Resources.Common.OnTitle%>
            </dd>
        </dl>
        <dl>
            <dt>
                <%=Resources.Model.IsEnable %></dt>
            <dd>
                <asp:CheckBox ID="IsEnable" runat="server" /></dd>
        </dl>
        </fieldset>
        </div>
        <div style="clear: left">
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" Class="subButton"
                OnClick="btnSave_Click" />
            &nbsp;<input type="button" name="Submit422" class="subButton" value="<%= Resources.Common.Back %>"
                onclick='location.href="CustomFormList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
