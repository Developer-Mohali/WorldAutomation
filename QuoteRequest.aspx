<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
  CodeFile="QuoteRequest.aspx.cs" Inherits="Quote_QuoteRequest" %>

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
              <asp:MultiView ID="MultiViewQuoteRequest" runat="server" ActiveViewIndex="0" OnActiveViewChanged="MultiViewQuoteRequest_ActiveViewChanged">
                <asp:View ID="ViewCRAQualification" runat="server">
                  <h1>
                    CRA Qualification</h1>
                  <div class="pbar">
                    <ul>
                      <li class="current">CRA Qualification</li>
                      <li>Job Details</li>
                      <li>Candidates Selection</li>
                    </ul>
                  </div>
                  <ul id="formwiz">
                    <li><span>Title of Position:</span>
                      <asp:TextBox ID="txtPositionTitle" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPositionTitle"
                        Display="None" ErrorMessage="Title of position required."></asp:RequiredFieldValidator>
                    </li>
                    <li><span>Minimum Years Experience:</span>
                      <asp:TextBox ID="txtMinimumExp" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMinimumExp"
                        Display="None" ErrorMessage="Minimum years of experience required."></asp:RequiredFieldValidator>
                    </li>
                    <li><span>Required Theraputic Experience:</span>
                      <asp:TextBox ID="txtTherapicExp" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTherapicExp"
                        Display="None" ErrorMessage="Required theraputic experience required."></asp:RequiredFieldValidator>
                    </li>
                    <li><span>Field Type Experience:</span>
                      <label for="select">
                      </label>
                      <asp:DropDownList ID="ddlFieldExp" runat="server">
                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                        <asp:ListItem>Pharma</asp:ListItem>
                        <asp:ListItem>Medical Device</asp:ListItem>
                        <asp:ListItem>Diagnostic</asp:ListItem>
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlFieldExp"
                        Display="None" ErrorMessage="Field type experience required." InitialValue="0"></asp:RequiredFieldValidator>
                      &nbsp;</li>
                    <li><span></span>
                      <asp:Button ID="btnNextRequestInfo0" runat="server" OnClick="btnNextRequestInfo_Click"
                        Text="Next" />
                    </li>
                  </ul>
                </asp:View>
                <asp:View ID="ViewJobDetails" runat="server">
                  <h1>
                    Job Details</h1>
                  <div class="pbar">
                    <ul>
                      <%--<li>Client Information</li>--%>
                      <li>CRA Qualification</li>
                      <li class="current">Job Details</li>
                      <li>Candidates Selection</li>
                    </ul>
                  </div>
                  <ul id="formwiz">
                    <li><span class="datalist">Countries:</span>
                      <asp:ListBox ID="lstBoxCountries" runat="server" SelectionMode="Multiple"></asp:ListBox>
                    </li>
                    <li><span>States:</span>
                      <asp:ListBox ID="lstStates" runat="server" SelectionMode="Multiple"></asp:ListBox>
                    </li>
                    <li><span>General Job Duties:</span>
                      <asp:TextBox ID="txtJobDuties" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtJobDuties"
                        Display="None" ErrorMessage="General job duties required."></asp:RequiredFieldValidator>
                      &nbsp;</li>
                    <li id="imgbtn"><span>Tentitive Start Date:</span>
                      <asp:TextBox ID="txtTentativeDate" runat="server"></asp:TextBox><asp:ImageButton
                        ID="cal_dataTentativeStartDate" runat="server" SkinID="CalendarImageButton" OnClientClick="javascript:showCalendarControl(this.previousSibling);return false;" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTentativeDate"
                        Display="None" ErrorMessage="Tentative start date required."></asp:RequiredFieldValidator>
                      &nbsp;</li>
                    <li><span>Durration of Contract:</span>
                      <asp:TextBox ID="txtDurationContract" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDurationContract"
                        Display="None" ErrorMessage="Duration of contract required."></asp:RequiredFieldValidator>
                      &nbsp;</li>
                    <li><span>Avg. # of days needed per week: </span>
                      <asp:TextBox ID="txtAvgDays" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAvgDays"
                        Display="None" ErrorMessage="Average no of days required."></asp:RequiredFieldValidator>
                      &nbsp;</li>
                    <li><span></span>
                      <asp:Button ID="btnNext2" runat="server" OnClick="btnNextRequestInfo_Click" Text="Next" />
                      <%--<asp:Button ID="btnFinish" runat="server" OnClick="btnFinish_Click" Text="Finish" />--%>
                    </li>
                  </ul>
                </asp:View>
                <asp:View ID="ViewCandidates" runat="server">
                  <h1>
                    Select Candidates</h1>
                  <div class="pbar">
                    <ul>
                      <%--<li>Client Information</li>--%>
                      <li>CRA Qualification</li>
                      <li>Job Details</li>
                      <li class="current">Candidates Selection</li>
                    </ul>
                  </div>
                  <div>
                    <br />
                    <asp:GridView ID="GVCandidates" runat="server" AutoGenerateColumns="False" Width="100%"
                      AllowPaging="True" OnPageIndexChanging="GVCandidates_PageIndexChanging">
                      <Columns>
                        <asp:TemplateField HeaderText="Select">
                          <ItemTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("CandidateID") %>' />
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Selected").ToString()== "True"? true:false %>' />
                          </ItemTemplate>
                        </asp:TemplateField>
                        <%--  <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                    <asp:Label ID="sdvasd" runat="server" Text='<%# Eval("Selected").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="YearsExperience" HeaderText="Experience" />
                        <asp:BoundField DataField="TherapeuticExperience" HeaderText="Therapeutic Experience" />
                        <asp:BoundField DataField="FieldTypeExperience" HeaderText="Field Type Experience" />
                      </Columns>
                      <EmptyDataTemplate>
                        <div class="centeralign">
                          No candidates found matching these CRA qualifications.</div>
                      </EmptyDataTemplate>
                    </asp:GridView>
                    <br />
                    <div class="rightalign">
                      <asp:Button ID="Button1" runat="server" OnClick="btnFinish_Click" Text="Finish" />
                    </div>
                    <br />
                  </div>
                  <!--rnd_content-->
                </asp:View>
                <asp:View ID="ViewMessage" runat="server">
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
                      <td>
                        <asp:Label ID="lblSuccessfull" runat="server" Text="" CssClass="bigFont"></asp:Label>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                        Click <a href="QuoteRequest.aspx">here</a> to submit new quote request.
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
