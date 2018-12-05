<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
    CodeFile="ServiceDetails.aspx.cs" Inherits="ServiceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">


    <table width="100%">
        <tr>
            <td align="center">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top" align="center">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <h1>
                                             <asp:Label ID="lblServiceHeading" runat="server" CssClass="servicehead"></asp:Label>
                                                </h1>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" valign="top" >
                                       <asp:Label ID="lblContent" Text="" runat="server"></asp:Label>
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
