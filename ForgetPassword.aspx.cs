using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADB.Entities;
using ADB.Services;
using System.Collections;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        UsersService objUserMaster = new UsersService();
        TList<Users> objUserMasterList = objUserMaster.Find("User_Name=" + txtUserID.Text.Trim());
        if (objUserMasterList.Count > 0)
        {
            //Email the password objUserMasterList[0].Password
            SendEmail(objUserMasterList[0].Password, objUserMasterList[0].FirstName + " " + objUserMasterList[0].LastName);
            MultiView1.ActiveViewIndex = MultiView1.ActiveViewIndex + 1;
        }
        else
        {
            lblMessage.Text = "User name does not exists.";
        }
    }

    private void SendEmail(string password, string name)
    {
        try
        {
            EmailHelper objEmail = new EmailHelper();
            objEmail.ToAddress = txtUserID.Text.Trim();
            objEmail.Template = "~/EmailTemplates/ForgetPassword.htm";
            objEmail.Subject = "Password Retrieval ADB Consulting & CRO Inc.";

            Hashtable objReplacements = new Hashtable();
            objReplacements.Add("#Name#", name);
            objReplacements.Add("#Password#", password);

            objEmail.Replacements = objReplacements;
            objEmail.Email();
        }
        catch (Exception ex)
        {

        }
    }

}
