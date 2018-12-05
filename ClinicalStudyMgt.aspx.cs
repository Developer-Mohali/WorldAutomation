using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Adb.BusinessLayer;

public partial class ClinicalStudyMgt : System.Web.UI.Page
{
  PageManager objPageManager1 = null;
  protected void Page_Load(object sender, EventArgs e)
  {
    load_ClinicalStudyMgt();
  }

  private void load_ClinicalStudyMgt()
  {
    objPageManager1 = new PageManager();
    PageTable objTable = new PageTable();
    objTable = objPageManager1.FetchServicePage(3);

    if (objTable.Rows.Count > 0)
    {
        div_clinicalstudymgt.InnerHtml = objTable.Rows[0][PageTable.SERVICECONTENT_FIELD].ToString();
    }
   BindHeaders(objTable.Rows[0][PageTable.PAGEMETAKEYWORDS_FIELD].ToString(), objTable.Rows[0][PageTable.PAGEMETADESCRIPTION_FIELD].ToString());
   Page.Title = objTable.Rows[0][PageTable.PAGETITLE_FIELD].ToString();
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
}
