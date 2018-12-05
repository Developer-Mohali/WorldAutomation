<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
    CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

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
    <table width="1008" border="0" align="" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <h1 style="width:94%">Forget Password</h1>
            </td>
        </tr>
        <tr>
            <td class="contentbg" align=center">
                <table width="97%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                ShowSummary="False" />
                            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                <asp:View ID="View1" runat="server">
                                    <div class="message">
                                        <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="false"></asp:Label>
                                    </div>
                                    <br />
                                    <div class="pbar">
                                        
                                           Want to log in? <a href="Login">Log in</a>
                                       
                                    </div>
                                    <br />
                                    
                                        <div style="margin-left: 139px;"><span>User Name:</span>
                                            <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserID"
                                                Display="None" ErrorMessage="Valid Email address required." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID"
                                                Display="None" ErrorMessage="Email address required."></asp:RequiredFieldValidator>
                                            &nbsp; eg: abc@example.com </div>
                                        <div style="margin-right: 690px; margin-top: 12px;"><span></span>
                                             <a class="squarebutton"
                                        href="#"><span><asp:Button ID="btnSubmit" style="padding-right:3px" runat="server" CssClass="button"  Text="Send" OnClick="btnSubmit_Click" /> </span></a>
                                        </div>
                                   
                                    <br />
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
                                                    Your password is emailed to you.</div>
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
</asp:Content>
