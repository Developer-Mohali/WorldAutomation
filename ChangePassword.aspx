<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
  CodeFile="ChangePassword.aspx.cs" Inherits="Quote_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
  <style type="text/css">
    .servicehead
    {
      color: #E6BE01;
      font-size: 17px;
      font-weight: bolder;
      padding-left: 0px;
      font-family: Arial;
    }
    
    .contwhitebg
    {
      background: #FFF;
      border: solid #a9c7e0;
      border-width: 0 1px 0 1px;
      padding: 20px;
    }
  </style>
  <table width="1008" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="contentbg" align="center">
        <table width="980" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <img src="images/cont_top_bg.jpg" alt="" />
            </td>
          </tr>
          <tr>
            <td class="contwhitebg" align="center">
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
              <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                  <b>Change Password</b>
                  <table cellpadding="2" cellspacing="2" border="0" style="background-color:#F1F1F1">
                    <tr>
                      <td colspan="2" align="left">
                        <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="false"></asp:Label>
                      </td>
                    </tr>
                    <tr>
                      <td align="right" width="130">
                        <span>User Name:</span>
                      </td>
                      <td align="left">
                        <asp:TextBox ID="txtUserID" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserID"
                          Display="None" ErrorMessage="Valid Email address required." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID"
                          Display="None" ErrorMessage="Email address required."></asp:RequiredFieldValidator>
                        &nbsp; eg: abc@example.com
                      </td>
                    </tr>
                    <tr>
                      <td align="right" width="100">
                        <span>Old Password:</span>
                      </td>
                      <td align="left">
                        <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOldPassword"
                          Display="None" ErrorMessage="Old password required."></asp:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr>
                      <td align="right" width="100">
                        <span>New Password:</span>
                      </td>
                      <td align="left">
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPassword"
                          Display="None" ErrorMessage="New password required."></asp:RequiredFieldValidator>
                      </td>
                    </tr>
                    <tr>
                      <td align="right" width="100">
                        <span>Confirm Password: </span>
                      </td>
                      <td align="left">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
                          ControlToValidate="txtConfirmPassword" Display="None" ErrorMessage="Passwords must match."></asp:CompareValidator>
                      </td>
                    </tr>
                    <tr>
                      <td align="right" width="100">
                      </td>
                      <td align="left">
                        <asp:Button ID="btnSubmit" runat="server" Text="Change" OnClick="btnSubmit_Click" />
                      </td>
                    </tr>
                  </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                  <table class="msg">
                    <tr>
                      <td>
                        &nbsp;
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        &nbsp;
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td class="bigFont">
                        <div class="bigFont">
                          Your password changed successfully.</div>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        &nbsp;
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        &nbsp;
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
                </asp:View>
              </asp:MultiView>
            </td>
          </tr>
          <tr>
            <td>
              <img src="images/cont_bottom_bg.jpg" alt="" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
