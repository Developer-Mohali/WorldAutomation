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

public partial class ServicesandOutSourcing : System.Web.UI.Page
{
  PageManager objPageManager1 = null;
  protected void Page_Load(object sender, EventArgs e)
  {
    load_ServicesOutSourcing();
  }

  private void load_ServicesOutSourcing()
  {
    objPageManager1 = new PageManager();
    PageTable dtPage1 = new PageTable();
    dtPage1 = objPageManager1.FetchServicePage(1);

    if (dtPage1.Rows.Count > 0)
    {
      div_servicesoutsourcing.InnerHtml = dtPage1.Rows[0][PageTable.SERVICECONTENT_FIELD].ToString();
    }
    BindHeaders(dtPage1.Rows[0][PageTable.PAGEMETAKEYWORDS_FIELD].ToString(), dtPage1.Rows[0][PageTable.PAGEMETADESCRIPTION_FIELD].ToString());
    Page.Title = dtPage1.Rows[0][PageTable.PAGETITLE_FIELD].ToString();


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
