using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;  
using Adb.BusinessLayer;
using System.Collections;
using System.Configuration;

public partial class contact_us : System.Web.UI.Page
{
  PageManager objPageManager;
  protected void Page_Load(object sender, EventArgs e)
  {
    try
    {
      objPageManager = new PageManager();
      PageTable objTable = null;
      objTable = objPageManager.FetchPage(8);
      if (objTable.Rows.Count > 0)
      {
        lblContent.Text = objTable.Rows[0][PageTable.PAGECONTENT_FIELD].ToString();
      }
      BindHeaders(objTable.Rows[0][PageTable.PAGEMETAKEYWORDS_FIELD].ToString(), objTable.Rows[0][PageTable.PAGEMETADESCRIPTION_FIELD].ToString());
      Page.Title = objTable.Rows[0][PageTable.PAGETITLE_FIELD].ToString();

    }

    catch (Exception ex)
    {
      throw ex;
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
  protected void btnSubmit_Click(object sender, EventArgs e)
  {
    SendEmail();
    //lblMessege.Text = "Thank you for submitting your query.";
    MultiView1.ActiveViewIndex += 1;
    Reset();
  }

  private void Reset()
  {
    txtFirstName.Text = "";
    txtLastName.Text = "";
    txtCompany.Text = "";
    txtEmail.Text = "";
    txtMessage.Text = "";
  }

  private void SendEmail()
  {
    try
    {
      EmailHelper objEmail = new EmailHelper();
      objEmail.ToAddress = ConfigurationManager.AppSettings["ToMailAddress"].ToString();
      
      
      objEmail.Template = "~/EmailTemplates/ContactUs.htm";
      objEmail.Subject = "Customer query";

      Hashtable objReplacements = new Hashtable();
      objReplacements.Add("#FirstName#", txtFirstName.Text.Trim());
      objReplacements.Add("#LastName#", txtLastName.Text.Trim());
      objReplacements.Add("#Company#", txtCompany.Text.Trim());
      objReplacements.Add("#Email#", txtEmail.Text.Trim());
      objReplacements.Add("#Message#", txtMessage.Text.Trim());
      objReplacements.Add("#Details#", ddlDetails.SelectedValue.ToString());

      objEmail.Replacements = objReplacements;
      objEmail.Email();
    }
    catch (Exception ex)
    {

    }
  }

}
