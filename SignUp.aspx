<%@ Page Title="SignUp" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
    CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
<script type="text/javascript">

    function Clear() {

        $('#aspnetForm')[0].reset();
    }
</script>
    <asp:UpdatePanel runat="server" ID="UpdatePanelSignUp">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgressSignUp" runat="server" DisplayAfter="100" AssociatedUpdatePanelID="UpdatePanelSignUp">
                <ProgressTemplate>
                    <div id="ImageLoader" runat="server">
                        <img src="Images/ajax-loader.gif" style="margin-right: auto; margin-left: auto; position: fixed;
                            top: 50%; left: 50%;" alt="Loading...">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <h1>
                Sign-Up</h1>
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="SignUp" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
            <table id="mytable">
                
                <tr>
                    <td>
                        <table id="mytable1">
                        <tr>
                        <td colspan="3">
                          <div class="message">
                    <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="false"></asp:Label>
                  </div>
                        </td>
                        </tr>
                            <tr>
                                <td width="36%" align="right">
                                    First Name:
                                </td>
                                <td colspan="2">
                               
                                     <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="SignUp" ControlToValidate="txtFirstName"
                        Display="None" ErrorMessage="First name required."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Last Name:
                                </td>
                                <td colspan="2">
                                     <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                  <span class="orangecolor"> Email Address:</span>
                                </td>
                                <td colspan="2">
                                   <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserID"
                        Display="None" ErrorMessage="Valid Email address required." ValidationGroup="SignUp" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="SignUp" ControlToValidate="txtUserID"
                        Display="None" ErrorMessage="Email address required."></asp:RequiredFieldValidator>
                      &nbsp; eg: abc@example.com 
                                </td>
                            </tr>
                        
                            
                            <tr>
                                <td align="right">
                                    <span class="orangecolor">Password:</span>
                                </td>
                                <td colspan="2">
                                     <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ValidationGroup="SignUp"
                        Display="None" ErrorMessage="Password required."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <span class="orangecolor">Confirm Password</span>
                                </td>
                                <td colspan="2">
                                      <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                      <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ValidationGroup="SignUp"
                        ControlToValidate="txtConfirmPassword" Display="None" ErrorMessage="Passwords must match."></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                            <td>
                            
                            </td>
                            <td colspan="2">
                                 <asp:RadioButton ID="RadioButtonCandidate" Text="Candidate" Checked="true" GroupName="Category" runat="server" /> 
                     <asp:RadioButton ID="RadioButtonCustomer" Text="Job Provider" GroupName="Category" runat="server" />
                      
                            </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td width="31%">
                                    <a class="squarebutton"  onclick="Clear()" href="#"><span>Cancel </span></a>
                                    
                                    <a class="squarebutton"
                                        href="#"><span> <asp:Button ID="btnSubmit"  ValidationGroup="SignUp"  CssClass="button" style="padding-right:0px" runat="server" Text="REGISTER" OnClick="btnSubmit_Click" /> </span></a>

                                          
                      
                                </td>
                                <td width="33%">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
