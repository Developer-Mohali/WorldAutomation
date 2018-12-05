using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adb.BusinessLayer;
using System.Web.UI.HtmlControls;
public partial class Home : System.Web.UI.Page
{
    PageManager objPageManager;
    public string recentTitle = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            objPageManager = new PageManager();
            PageTable objTable = null;
            objTable = objPageManager.FetchPage(1);
            if (objTable.Rows.Count > 0)
            {
                lblCompanyProfile.Text = objTable.Rows[0][PageTable.PAGECONTENT_FIELD].ToString();
            }
            BindHeaders(objTable.Rows[0][PageTable.PAGEMETAKEYWORDS_FIELD].ToString(), objTable.Rows[0][PageTable.PAGEMETADESCRIPTION_FIELD].ToString());
            Page.Title = objTable.Rows[0][PageTable.PAGETITLE_FIELD].ToString();
            objTable = objPageManager.FetchPage(2);
            if (objTable.Rows.Count > 0)
            {
                lblJobPositions.Text = objTable.Rows[0][PageTable.PAGECONTENT_FIELD].ToString();
            }
            loadAllService();

           }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void BindHeaders(string strMetaKeywords,string strMetaDescription )
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
    protected void ddd_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("www.google.com");
    }

    private void loadAllService()
    {
        PageManager objPageManager1 = new PageManager();
        PageTable dtPage1 = new PageTable();
   dtPage1 = objPageManager1.FetchServicePages();
  

    }

    
}