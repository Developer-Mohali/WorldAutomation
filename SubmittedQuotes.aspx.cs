using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;
using ADB.Data;

using System.Web.Security;
public partial class Quote_SubmittedQuotes : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      lblUserName.Text = Common.GetUserName();
    }
    BindGrid();
  }

  private void BindGrid()
  {
    SqlDatabase database = new SqlDatabase(DataRepository.ConnectionStrings["ADB.Data.ConnectionString"].ConnectionString);
    DbCommand command = database.GetStoredProcCommand("GetQuoteRequests");

    database.AddInParameter(command, "@UserID", DbType.Int32, Common.GetUserID());

    DataSet dataset = ADB.Data.Utility.ExecuteDataSet(database, command);
    GVQuotes.DataSource = dataset;
    GVQuotes.DataBind();
  }

  protected void GVCandidates_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    GVQuotes.PageIndex = e.NewPageIndex;
    BindGrid();
  }

  protected void lnkSignOut_Click(object sender, EventArgs e)
  {
    Session.Clear();
    FormsAuthentication.SignOut();
    Response.Redirect("~/Login");
  }

}
