<%@ Page Title="Login" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>


<asp:Content  ID="Content1" ContentPlaceHolderID="cphMain"  runat="Server">
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
                Login</h1>                                                                       
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="Login1" />
            <table id="mytable">
                <tr>
                    <td align="left">
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="mytable1">
                            <tr>
                                <td colspan="3">
                                    <div class="message">
                                        <asp:Label ID="lblMessage" runat="server"  ForeColor="Red" Font-Bold="true" Width="100%"  Text="" EnableViewState="false"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <div id="divLoginUser">
                                        <asp:Login ID="LoginUser" runat="server" OnAuthenticate="LoginUser_Authenticate"
                                            BorderWidth="0">
                                            <LayoutTemplate>
                                                <table cellpadding="5px" cellspacing="5px">
                                                    <tr>
                                                        <td>
                                                            <span>Email Address:</span>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="UserName" Width="250px" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1"
                                                                Display="None">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span>Password:</span>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Password" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1"
                                                                Display="None">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                  <%--  <tr>
                                                        <td>
                                                            Remember me
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="RememberMe" runat="server" Text="" />
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                           <%-- <a class="squarebutton" href="#"><span style="border: 0px">
                                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="button" Text="Log In" ValidationGroup="Login1" /></span></a>
--%>
                                                                 <a style="padding-right:0px" class="squarebutton4"
                                        href="#"><span><asp:Button ID="LoginButton" runat="server" BorderStyle="None"  CommandName="Login" CssClass="button"  Text="Log In" ValidationGroup="Login1"  /> </span></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <a class="forget" href="Forget-Password">Forgot password? </a>
                                                            Not a user? <a href="Sign-Up">
                                                                Sign up</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:Login>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
