<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
  CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

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
            <td >
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="left" width="658" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td scope="row" valign="top">
                          <asp:Label ID="lblContent" Text="" runat="server"></asp:Label>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td align="left" valign="top">
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                      <asp:View ID="View1" runat="server">
                        <table cellpadding="2" cellspacing="2" border="0" style="background-color:#F1F1F1">
                          <tr>
                            <td colspan="2">
                              <asp:Label ID="lblMessege" runat="server" EnableViewState="False" Font-Bold="True"
                                ForeColor="Red"></asp:Label>
                              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                ShowSummary="False" />
                            </td>
                          </tr>
                          <tr> 
                            <td align="left" colspan="2">
                              Please! specify who would you like to address your query?
                              <asp:DropDownList ID="ddlDetails" runat="server" TabIndex="1" SkinID="marginDropDown">
                                <asp:ListItem>Technical Support</asp:ListItem>
                                <asp:ListItem>Customer Inquiry</asp:ListItem>
                              </asp:DropDownList>
                            </td>
                          </tr>
                          <tr>
                            <td align="right"  width="100">
                              <span>First Name:</span>
                            </td>
                            <td align="left">
                              <asp:TextBox ID="txtFirstName" runat="server" TabIndex="2"></asp:TextBox>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              <span>Last Name:</span>
                            </td>
                            <td align="left">
                              <asp:TextBox ID="txtLastName" runat="server" TabIndex="3"></asp:TextBox>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              <span>Company:</span>
                            </td>
                            <td align="left">
                              <asp:TextBox ID="txtCompany" runat="server" TabIndex="4"></asp:TextBox>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                              * <span>Email:</span>
                            </td>
                            <td align="left">
                              <asp:TextBox ID="txtEmail" runat="server" TabIndex="5"></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                Display="None" ErrorMessage="Valid Email required." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                Display="None" ErrorMessage="Email required."></asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                             * &nbsp;Message:
                            </td>
                            <td align="left">
                              <asp:TextBox ID="txtMessage" runat="server" Height="99px" TextMode="MultiLine" Width="640px"
                                TabIndex="6"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMessage"
                                Display="None" ErrorMessage="Message required."></asp:RequiredFieldValidator>
                            </td>
                          </tr>
                          <tr>
                            <td align="right">
                            </td>
                            <td align="left">
                              <asp:Button ID="btnSubmit" CssClass="Button" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                                TabIndex="7" />
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
                                Thanks for contacting us.</div>
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
              </table>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
