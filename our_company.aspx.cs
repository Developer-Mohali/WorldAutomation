using System;
using System.Collections.Generic; 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adb.BusinessLayer;
using System.Web.UI.HtmlControls;
public partial class our_company : System.Web.UI.Page
{
    PageManager objPageManager;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            objPageManager = new PageManager();
            PageTable objTable = null;
            objTable = objPageManager.FetchPage(7);
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
}
