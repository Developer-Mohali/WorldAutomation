using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adb.BusinessLayer;
using System.Web.UI.HtmlControls;
using System.Web.Routing; 
public partial class ServiceDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageManager objPageManager;
        if (!Page.IsPostBack)
        {



            objPageManager = new PageManager();

            if (Page.RouteData.Values["Service"] != null)
            {
                string PageName = Page.RouteData.Values["Service"].ToString();

                PageTable objTable = null;
                objTable = objPageManager.FetchServicePage(PageName);
                if (objTable.Rows.Count > 0)
                {
                    lblServiceHeading.Text = objTable.Rows[0][PageTable.SERVICENAME_FIELD].ToString();
                    lblContent.Text = objTable.Rows[0][PageTable.SERVICECONTENT_FIELD].ToString();
                    BindHeaders(objTable.Rows[0][PageTable.PAGEMETAKEYWORDS_FIELD].ToString(), objTable.Rows[0][PageTable.PAGEMETADESCRIPTION_FIELD].ToString());
                    Page.Title = objTable.Rows[0][PageTable.PAGETITLE_FIELD].ToString();
                }
             

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
}
