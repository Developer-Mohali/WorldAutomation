using System;
using System.Collections.Generic; 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adb.BusinessLayer;
using System.Web.UI.HtmlControls;  
public partial class Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      loadAllService();
    }

    private void loadAllService()
    {
      PageManager objPageManager1 = new PageManager();
      PageTable dtPage1 = new PageTable();
      dtPage1 = objPageManager1.FetchPage(9); 

      //dlCountry.DataSource = dtPage1;
      //dlCountry.DataBind();

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
