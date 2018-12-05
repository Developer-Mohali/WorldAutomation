<%@ Page Title="" Language="C#" MasterPageFile="~/AdbMain.master" AutoEventWireup="true"
    CodeFile="Home2.aspx.cs" Inherits="Home" %>
    <%@ Register TagPrefix="UserControl" TagName="Services" Src="~/UserControls/Services.ascx" %>
<asp:Content ID="IndexContent" ContentPlaceHolderID="cphMain" runat="Server">
    <style type="text/css">
        .border
        {
            border-left: 1px solid #b3b8c3;
            border-right: 1px solid #b3b8c3;
        }
        .border1
        {
            border-left: 1px solid #b3b8c3;
            border-right: 1px solid #b3b8c3;
            border-bottom: 1px solid #b3b8c3;
        }
        .subcontent1
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #8c8f98;
            padding-top: 20px;
        }
        .footercontent
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #52524d;
            text-align: center;
        }
        .footercontent1
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #ffffff;
            text-align: center;
            padding-top: 5px;
        }
        .more
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #e01015;
            padding-right: 5px;
            text-align: right;
        }
        .recentposting
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: 18px;
            color: #ffffff;
            padding-left: 20px;
        }
       
        .servicehead
        {
            color: #E6BE01;
            font-size: 17px;
            font-weight: bolder;
            padding-left: 10px;
            font-family: Arial; /*text-shadow: 0.2em 0.2em 0.3em #CDCDCD;*/
        }
        .servicehead a
        {
            color: #E6BE01;
            font-size: 17px;
            font-weight: bolder;
            padding-left: 10px;
            text-decoration: none;
            font-family: Arial; /*text-shadow: 0.2em 0.2em 0.3em #CDCDCD;*/
        }
        .servicehead a:hover
        {
            text-decoration: underline;
        }
        .services
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: bolder;
            font-size: 14px;
            color: #ffffff;
            padding-left: 30px;
            background: url('Images/submenu.gif');
        }
        
        .contwhitebg
        {
            background: #FFF;
            border: solid #a9c7e0;
            border-width: 0 1px 0 1px;
            padding: 0px 6px;
        }
    </style>
    <style type="text/css">
        ul.thumb
        {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        ul.thumb li
        {
            margin: 0;
            float: left;
            position: relative;
            width: 317px;
            height: 175px;
            padding: 0;
        }
        ul.thumb li img
        {
            width: 316px;
            height: 174px;
            position: absolute;
            padding: 0;
            border: none;
        }
        ul.thumb li img.hover
        {
            background: url(thumb_bg.png) no-repeat center center;
            border: none;
        }
        #main_view
        {
            float: left;
            padding: 9px 0;
            margin-left: -10px;
        }
    </style>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="left" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td scope="row" valign="top" align="center">
                            <div id="topcontent">
                                <div class="topcontent1">
                                    <table width="98%" id="roundedTable">
                                        <tr>
                                            <td rowspan="5" valign="top">
                                                <p>
                                                    <asp:Label ID="lblCompanyProfile" Text="" runat="server"></asp:Label></p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="rightTable" style="float: right">
                                    <table width="98%" id="RightTable">
                                        <tr>
                                            <td rowspan="5" valign="top">
                                                <h1>
                                                    Recent Positions:</h1>
                                                <div>
                                                <br />
                                                    <asp:Label ID="lblJobPositions" runat="server"></asp:Label></div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                           <table width="98%" id="roundedTable">
                                        <tr>
                                            <td rowspan="5" valign="top">
                                            <h1>Services</h1>
                                            <br />
                                                <p>
                                                  <UserControl:Services ID="ServicesList" runat="server" /></p>
                                            </td>
                                        </tr>
                                    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-- The notes themselves are implemented as footnotes in a document -->
    <asp:DataList ID="dlCountry" runat="server" RepeatColumns="2">
        <ItemTemplate>
            <div id="supernote-note-demo<%# Eval("ServiceID")%>" class="snp-mouseoffset pinnable notedefault"
                style="width: 500px; height: 300px; overflow: scroll">
                <a name="demo<%# Eval("ServiceID")%>"></a>
                <h5>
                    <a href="#" class="note-close">X</a> <a href="ServiceDetails.aspx?ServiceId=<%# Eval("ServiceID")%>&Id=3">
                        <%# Eval("ServiceName")%></a>
                </h5>
                <%# Eval("ServiceDescription")%>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
