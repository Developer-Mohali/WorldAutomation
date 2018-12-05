using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADB.Entities;
using ADB.Services;
using ADB.Data;
using System.Data;
using System.Collections;
using System.Web.UI.HtmlControls ;  
using System.Web.Security;
public partial class Quote_QuoteRequest : System.Web.UI.Page
{
  #region events

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      lblUserName.Text = Common.GetUserName();
      BindCountries();
      BindStates();

      if (QuoteRequestID != 0)
      {
        BindPageFields();
      }
    }
  }

    
    

    
  private void BindHeaders(string strMetaKeywords, string strMetaDescription)
  {
      AddMeta(Page.Header, "Keywords", strMetaKeywords);
      AddMeta(Page.Header, "Description", strMetaDescription);
  }
  private static void AddMeta(HtmlHead head, string name, string content)
  {
      // Prepare the meta tag 
      HtmlMeta metaTag = new HtmlMeta();
      metaTag.Name = name;
      metaTag.Content = content;

      // Add the meta tag to the head 
      head.Controls.Add(metaTag);
  }
  protected void btnNextRequestInfo_Click(object sender, EventArgs e)
  {
    MultiViewQuoteRequest.ActiveViewIndex = MultiViewQuoteRequest.ActiveViewIndex + 1;
  }

  protected void btnFinish_Click(object sender, EventArgs e)
  {
    //update cache with selected candidates
    UpdateCandidatesSelection();
    if (QuoteRequestID == 0)
      AddQuoteRequest();
    else
      UpdateQuoteRequest();
  }

  protected void MultiViewQuoteRequest_ActiveViewChanged(object sender, EventArgs e)
  {
    if (MultiViewQuoteRequest.ActiveViewIndex == 2)
    {
      BindCandidatesGrid();
    }
  }

  protected void GVCandidates_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    UpdateCandidatesSelection();
    GVCandidates.PageIndex = e.NewPageIndex;
    BindCandidatesGrid();
  }

  #endregion

  #region properties
  /// <summary>
  /// Returns list of selected candidates in the form of QuoteCandidates 
  /// </summary>
  /// <returns></returns>
  private TList<QuoteCandidates> GetSelectedCandidates()
  {
    TList<QuoteCandidates> selectedCandidatesList = new TList<QuoteCandidates>();
    QuoteCandidates objQuoteCandidates;
    DataSet ds = CachedCandidates;
    foreach (DataRow dr in ds.Tables[0].Rows)
    {
      if (dr["Selected"] != DBNull.Value)
      {
        if (bool.Parse(dr["Selected"].ToString()) == true)
        {
          objQuoteCandidates = new QuoteCandidates();
          objQuoteCandidates.CandidateId = int.Parse(dr["CandidateId"].ToString());
          selectedCandidatesList.Add(objQuoteCandidates);
        }
      }
    }

    //foreach (GridViewRow gr in GVCandidates.Rows)
    //{
    //    CheckBox CheckBox1 = (CheckBox)gr.FindControl("CheckBox1");
    //    if (CheckBox1.Checked)
    //    {
    //        objQuoteCandidates = new QuoteCandidates();
    //        HiddenField HiddenField1 = (HiddenField)gr.FindControl("HiddenField1");
    //        objQuoteCandidates.CandidateId = int.Parse(HiddenField1.Value);
    //        selectedCandidatesList.Add(objQuoteCandidates);
    //    }
    //}

    return selectedCandidatesList;
  }

  private Int64 QuoteRequestID
  {
    get { return Request.QueryString["QuoteID"] == null ? 0 : Int64.Parse(Request.QueryString["QuoteID"].ToString()); }
  }
  #endregion

  #region "functions"

  private void UpdateQuoteRequest()
  {
    QuoteRequestService objQuoteService = new QuoteRequestService();
    JobDetailsService objJobDetailsService = new JobDetailsService();

    QuoteRequest objQuoteReq = DataRepository.QuoteRequestProvider.GetByQuoteRequestId(QuoteRequestID);
    objQuoteService.DeepLoad(objQuoteReq, true, DeepLoadType.IncludeChildren
       , typeof(TList<JobDetails>), typeof(TList<CraQualifications>), typeof(TList<QuoteCandidates>));

    objJobDetailsService.DeepLoad(objQuoteReq.JobDetailsCollection[0], true,
        DeepLoadType.IncludeChildren, typeof(TList<JobDetailsStates>), typeof(TList<JobDetailsCountries>));

    JobDetails objJobDetails = objQuoteReq.JobDetailsCollection[0];
    CraQualifications objCRAQual = objQuoteReq.CraQualificationsCollection[0];

    objJobDetails.JobDuties = txtJobDuties.Text.Trim();
    if (txtTentativeDate.Text.Trim() != "")
      objJobDetails.TentativeStartDate = DateTime.Parse(txtTentativeDate.Text);
    else
      objJobDetails.TentativeStartDate = null;

    objJobDetails.DurationContract = txtDurationContract.Text;
    objJobDetails.AvgDays = txtAvgDays.Text;

    objJobDetails.JobDetailsCountriesCollection.Clear();
    for (int i = 0; i < lstBoxCountries.Items.Count; i++)
    {
      if (lstBoxCountries.Items[i].Selected)
      {
        //JobDetailsCountries objJobDetailsSearched = objJobDetails.JobDetailsCountriesCollection.Find(JobDetailsCountriesColumn.CountryId, lstBoxCountries.Items[i].Value);
        //if (objJobDetailsSearched == null)
        //{
        JobDetailsCountries objJobDetailsCountries = new JobDetailsCountries();
        objJobDetailsCountries.CountryId = int.Parse(lstBoxCountries.Items[i].Value);
        objJobDetails.JobDetailsCountriesCollection.Add(objJobDetailsCountries);
        //}
      }
    }

    objJobDetails.JobDetailsStatesCollection.Clear();
    for (int i = 0; i < lstStates.Items.Count; i++)
    {
      if (lstStates.Items[i].Selected)
      {
        JobDetailsStates objJobDetailsStates = new JobDetailsStates();
        objJobDetailsStates.StateId = int.Parse(lstStates.Items[i].Value);
        objJobDetails.JobDetailsStatesCollection.Add(objJobDetailsStates);
      }
    }

    objCRAQual.MinYearsExperience = txtMinimumExp.Text;
    objCRAQual.ReqTherapeuticExperience = txtTherapicExp.Text;
    if (ddlFieldExp.SelectedIndex != 0)
      objCRAQual.FieldTypeExperience = ddlFieldExp.SelectedValue;
    objCRAQual.PositionTitle = txtPositionTitle.Text.Trim();

    //objQuoteReq.JobDetailsCollection.Add(objJobDetails);
    //objQuoteReq.CraQualificationsCollection.Add(objCRAQual);

    objQuoteReq.QuoteCandidatesCollection.Clear();
    TList<QuoteCandidates> selectedCandidatesList = GetSelectedCandidates();
    if (selectedCandidatesList.Count > 0)
    {
      objQuoteReq.QuoteCandidatesCollection = selectedCandidatesList;
    }

    bool result = objQuoteService.DeepSave(objQuoteReq, ADB.Data.DeepSaveType.IncludeChildren,
        typeof(TList<JobDetails>), typeof(TList<CraQualifications>), typeof(TList<QuoteCandidates>));

    if (result)
    {
      objJobDetailsService.DeepSave(objJobDetails, DeepSaveType.IncludeChildren, typeof(TList<JobDetailsStates>), typeof(TList<JobDetailsCountries>));
    }

    //bool result = false;
    //objQuoteService.Save(objQuoteReq);

    MultiViewQuoteRequest.ActiveViewIndex = MultiViewQuoteRequest.ActiveViewIndex + 1;

    if (result)
    {
      lblSuccessfull.Text = "Your quote request is updated.";
    }
    else
    {
      lblSuccessfull.Text = "A problem accurred while trying to save your quote request.";
    }
  }

  private void AddQuoteRequest()
  {
    //Users objUser = DataRepository.UsersProvider.GetByUserId(Common.GetUserID());
    QuoteRequestService objQuoteService = new QuoteRequestService();
    JobDetailsService objJobDetailsService = new JobDetailsService();
    QuoteRequest objQuoteReq = new QuoteRequest();
    JobDetails objJobDetails = new JobDetails();
    CraQualifications objCRAQual = new CraQualifications();

    objQuoteReq.UserId = Common.GetUserID();
    //objQuoteReq.UserIdSource = objUser;

    objJobDetails.JobDuties = txtJobDuties.Text.Trim();
    if (txtTentativeDate.Text.Trim() != "")
      objJobDetails.TentativeStartDate = DateTime.Parse(txtTentativeDate.Text);
    objJobDetails.DurationContract = txtDurationContract.Text;
    objJobDetails.AvgDays = txtAvgDays.Text;

    for (int i = 0; i < lstBoxCountries.Items.Count; i++)
    {
      if (lstBoxCountries.Items[i].Selected)
      {
        JobDetailsCountries objJobDetailsCountries = new JobDetailsCountries();
        objJobDetailsCountries.CountryId = int.Parse(lstBoxCountries.Items[i].Value);
        objJobDetails.JobDetailsCountriesCollection.Add(objJobDetailsCountries);
      }
    }

    for (int i = 0; i < lstStates.Items.Count; i++)
    {
      if (lstStates.Items[i].Selected)
      {
        JobDetailsStates objJobDetailsStates = new JobDetailsStates();
        objJobDetailsStates.StateId = int.Parse(lstStates.Items[i].Value);
        objJobDetails.JobDetailsStatesCollection.Add(objJobDetailsStates);
      }
    }


    objCRAQual.MinYearsExperience = txtMinimumExp.Text;
    objCRAQual.ReqTherapeuticExperience = txtTherapicExp.Text;
    if (ddlFieldExp.SelectedIndex != 0)
      objCRAQual.FieldTypeExperience = ddlFieldExp.SelectedValue;
    objCRAQual.PositionTitle = txtPositionTitle.Text.Trim();

    objQuoteReq.JobDetailsCollection.Add(objJobDetails);
    objQuoteReq.CraQualificationsCollection.Add(objCRAQual);
    TList<QuoteCandidates> selectedCandidatesList = GetSelectedCandidates();
    if (selectedCandidatesList.Count > 0)
    {
      objQuoteReq.QuoteCandidatesCollection = selectedCandidatesList;
    }

    bool result = objQuoteService.DeepSave(objQuoteReq, ADB.Data.DeepSaveType.IncludeChildren,
        typeof(TList<JobDetails>), typeof(TList<CraQualifications>), typeof(TList<QuoteCandidates>));

    if (result)
    {
      objJobDetailsService.DeepSave(objJobDetails, DeepSaveType.IncludeChildren, typeof(TList<JobDetailsStates>), typeof(TList<JobDetailsCountries>));
    }

    //bool result = false;
    //objQuoteService.Save(objQuoteReq);
    SendEmail(objQuoteReq.QuoteRequestId.ToString());
    MultiViewQuoteRequest.ActiveViewIndex = MultiViewQuoteRequest.ActiveViewIndex + 1;

    if (result)
    {
      lblSuccessfull.Text = "Thank you for submitting your quote request.";
    }
    else
    {
      lblSuccessfull.Text = "A problem accurred while trying to save your quote request.";
    }
  }

  private void SendEmail(string quoteRequestID)
  {
    try
    {
      EmailHelper objEmail = new EmailHelper();
      objEmail.ToAddress = Common.GetLoginName();
      objEmail.Template = "~/EmailTemplates/RequestQuote.htm";
      objEmail.Subject = "Quote Request ADB Consulting & CRO Inc.";

      Hashtable objReplacements = new Hashtable();
      objReplacements.Add("#Name#", Common.GetUserName());
      objReplacements.Add("#URL#", "http://www.GCPMonitors.com/Quote/QuoteRequest.aspx?QuoteID=" + quoteRequestID);

      objEmail.Replacements = objReplacements;
      objEmail.Email();
    }
    catch (Exception ex)
    {

    }
  }

  private void BindPageFields()
  {
    QuoteRequestService objQuoteService = new QuoteRequestService();
    JobDetailsService objJobDetailsService = new JobDetailsService();

    QuoteRequest objQuoteReq = DataRepository.QuoteRequestProvider.GetByQuoteRequestId(QuoteRequestID);
    objQuoteService.DeepLoad(objQuoteReq, true, DeepLoadType.IncludeChildren
       , typeof(TList<JobDetails>), typeof(TList<CraQualifications>), typeof(TList<QuoteCandidates>));

    objJobDetailsService.DeepLoad(objQuoteReq.JobDetailsCollection[0], true,
        DeepLoadType.IncludeChildren, typeof(TList<JobDetailsStates>), typeof(TList<JobDetailsCountries>));

    JobDetails objJobDetails = objQuoteReq.JobDetailsCollection[0];
    CraQualifications objCRAQual = objQuoteReq.CraQualificationsCollection[0];

    txtJobDuties.Text = objJobDetails.JobDuties;
    if (objJobDetails.TentativeStartDate != null)
      txtTentativeDate.Text = DateTime.Parse(objJobDetails.TentativeStartDate.ToString()).ToString("MM-dd-yyyy");
    txtDurationContract.Text = objJobDetails.DurationContract;
    txtAvgDays.Text = objJobDetails.AvgDays;

    foreach (JobDetailsCountries objJobDetailsCountries in objJobDetails.JobDetailsCountriesCollection)
    {
      lstBoxCountries.Items.FindByValue(objJobDetailsCountries.CountryId.ToString()).Selected = true;
    }

    foreach (JobDetailsStates objJobDetailsStates in objJobDetails.JobDetailsStatesCollection)
    {
      lstStates.Items.FindByValue(objJobDetailsStates.StateId.ToString()).Selected = true;
    }

    txtMinimumExp.Text = objCRAQual.MinYearsExperience;
    txtTherapicExp.Text = objCRAQual.ReqTherapeuticExperience;
    ddlFieldExp.SelectedValue = objCRAQual.FieldTypeExperience;
    txtPositionTitle.Text = objCRAQual.PositionTitle;

    TList<QuoteCandidates> selectedCandidatesList = objQuoteReq.QuoteCandidatesCollection;
    //CachedCandidates = selectedCandidatesList.ToDataSet(false);
    BindCandidatesGrid();
    DataSet ds = CachedCandidates;

    foreach (QuoteCandidates qc in selectedCandidatesList)
    {
      ds.Tables[0].Rows.Find(qc.CandidateId);
      DataRow dr = ds.Tables[0].Rows.Find(qc.CandidateId);
      if (dr != null)
        dr["Selected"] = true;
    }
    CachedCandidates = ds;
    BindCandidatesGrid();//again bind grid
  }

  private void BindStates()
  {
    StateService objStateService = new StateService();
    TList<State> stateList = objStateService.GetAll();
    lstStates.DataSource = stateList;
    lstStates.DataTextField = "StateName";
    lstStates.DataValueField = "StateId";
    lstStates.DataBind();
  }

  private void BindCountries()
  {
    CountryService objCountryService = new CountryService();
    TList<Country> countryList = objCountryService.GetAll();
    lstBoxCountries.DataSource = countryList;
    lstBoxCountries.DataTextField = "Name";
    lstBoxCountries.DataValueField = "CountryId";
    lstBoxCountries.DataBind();
  }

  private void BindCandidatesGrid()
  {
    if (CachedCandidates == null)
    {
      string searchString = "";
      if (txtMinimumExp.Text != "")
        searchString += "YearsExperience='" + txtMinimumExp.Text + "'";

      if (txtTherapicExp.Text != "")
        searchString += (searchString == "" ? "" : " OR ") + "TherapeuticExperience='" + txtTherapicExp.Text + "'";

      if (ddlFieldExp.SelectedIndex != 0)
        searchString += (searchString == "" ? "" : " OR ") + "FieldTypeExperience='" + ddlFieldExp.SelectedValue + "'";

      CandidatesService objCandidatesService = new CandidatesService();

      if (searchString != "")
      {
        TList<Candidates> objCandidatesList = objCandidatesService.Find(searchString);

        DataSet ds = objCandidatesList.ToDataSet(false);
        ds.Tables[0].Columns.Add(new DataColumn("Selected", System.Type.GetType("System.Boolean")));
        ds.Tables[0].PrimaryKey = new DataColumn[] { ds.Tables[0].Columns["CandidateID"] };
        CachedCandidates = ds;//caching data becuase we want to track candidates user select
        GVCandidates.DataSource = ds;
        GVCandidates.DataBind();
      }
      else
      {
        GVCandidates.DataBind();
      }
    }
    else
    {
      GVCandidates.DataSource = CachedCandidates;
      GVCandidates.DataBind();
    }
  }

  /// <summary>
  /// return candidates dataset
  /// </summary>
  private DataSet CachedCandidates
  {
    get { return ViewState["dsCandidates"] == null ? null : (DataSet)(ViewState["dsCandidates"]); }
    set { ViewState["dsCandidates"] = value; }
  }

  /// <summary>
  /// updates dataset, with the candidates user selected
  /// </summary>
  private void UpdateCandidatesSelection()
  {
    DataSet ds = CachedCandidates;

    foreach (GridViewRow gr in GVCandidates.Rows)
    {
      CheckBox CheckBox1 = (CheckBox)gr.FindControl("CheckBox1");
      HiddenField HiddenField1 = (HiddenField)gr.FindControl("HiddenField1");
      int id = int.Parse(HiddenField1.Value);
      DataRow dr = ds.Tables[0].Rows.Find(id);
      dr["Selected"] = CheckBox1.Checked;
    }

    CachedCandidates = ds;
  }

  #endregion

  protected void lnkSignOut_Click(object sender, EventArgs e)
  {
    Session.Clear();
    FormsAuthentication.SignOut();
    Response.Redirect("~/Login");
  }
}
