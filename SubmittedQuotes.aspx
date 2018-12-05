<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
  CodeFile="SubmittedQuotes.aspx.cs" Inherits="Quote_SubmittedQuotes" %>

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
              <div id="sub-menu">
                <p>
                  Welcome <a href="#my-profile">
                    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></a>!</p>
                <ul>
                  <li><a href="#my-profile">
                    <asp:LinkButton ID="lnkSignOut" runat="server" OnClick="lnkSignOut_Click" CausesValidation="false">Sign Out</asp:LinkButton>
                  </a></li>
                  <li><a href="SubmittedQuotes.aspx">My Quote Requests</a></li>
                  <li><a href="QuoteRequest.aspx">Request Quote</a></li>
                </ul>
              </div>
              <h1>
                My Quote Requests</h1>
              <asp:GridView ID="GVQuotes" runat="server" AutoGenerateColumns="False" Width="100%"
                AllowPaging="True" OnPageIndexChanging="GVCandidates_PageIndexChanging">
                <Columns>
                  <asp:BoundField DataField="PositionTitle" HeaderText="Position" ReadOnly="True" SortExpression="PositionTitle" />
                  <asp:BoundField DataField="Min_Years_Experience" HeaderText="Experience" ReadOnly="True"
                    SortExpression="Min_Years_Experience" />
                  <asp:BoundField DataField="Req_Therapeutic_Experience" HeaderText="Therapeutic Experience"
                    ReadOnly="True" SortExpression="Req_Therapeutic_Experience" />
                  <asp:BoundField DataField="Field_Type_Experience" HeaderText="Field Type Experience"
                    ReadOnly="True" SortExpression="Field_Type_Experience" />
                  <asp:BoundField DataField="Job_Duties" HeaderText="Job Duties" ReadOnly="True" SortExpression="Job_Duties" />
                  <asp:BoundField DataField="Tentative_Start_Date" HeaderText="Tentative Date" ReadOnly="True"
                    SortExpression="Tentative_Start_Date" DataFormatString="{0:d}" />
                  <asp:BoundField DataField="Duration_Contract" HeaderText="Contract Duration" ReadOnly="True"
                    SortExpression="Duration_Contract" />
                  <asp:TemplateField>
                    <ItemTemplate>
                      <a href='<%# "QuoteRequest.aspx?QuoteID=" + Eval("QuoteRequest_Id") %>'>
                        <img alt="Edit" src="../Images/notebook.png" style="border: none;" /></a>
                    </ItemTemplate>
                  </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                  <div class="centeralign">
                    No quote requests found.</div>
                </EmptyDataTemplate>
              </asp:GridView>
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
