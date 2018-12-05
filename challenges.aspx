<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
    CodeFile="challenges.aspx.cs" Inherits="challenges" %>

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
            <td align="center">
                <table width="980" border="0" cellspacing="0" cellpadding="0">
                    
                    <tr>
                        <td>
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
                            </table>
                        </td>
                    </tr>
                 
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
