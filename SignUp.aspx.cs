using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADB.Entities;
using ADB.Services;
using System.Collections;
using DataAccessLayer.DataContext;
using Adb.BusinessLayer;

public partial class SignUp : System.Web.UI.Page
{
    Adb.BusinessLayer.User objUser = new Adb.BusinessLayer.User();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int returnResult = Constant.DefaultZero;

        Users objusers = new Users();
        try
        {
            objusers.UserName = txtUserID.Text.Trim();
            objusers.Password = txtPassword.Text;
            objusers.FirstName = txtFirstName.Text;
            objusers.LastName = txtLastName.Text;

            if (RadioButtonCandidate.Checked)
            {
                objusers.Roles = Constant.Roles.Candidate;
            }
            else
            {
                objusers.Roles = Constant.Roles.Customer;
            }


            returnResult = objUser.UserSignUp(objusers.UserName, objusers.Password, objusers.FirstName, objusers.LastName, objusers.Roles);
            // return Result 1 shows that User Signup successfully
            if (returnResult == Constant.DefaultOne)
            {
                SendEmail();
                Response.Redirect("Login?ReturnUrl=SignUp Successfully");
            }

            else
            {
                lblMessage.Text = Constant.Message.EmailExist;
            }
        }
        catch (Exception ex)
        {

        }


    }
    private void SendEmail()
    {
        try
        {
            EmailHelper objEmail = new EmailHelper();
            objEmail.ToAddress = txtUserID.Text.Trim();
            objEmail.Template = "~/EmailTemplates/UserRegistration.htm";
            objEmail.Subject = "Registration ADB Consulting & CRO Inc.";

            Hashtable objReplacements = new Hashtable();
            objReplacements.Add("#Name#", txtFirstName.Text.Trim() + " " + txtLastName.Text.Trim());
            objReplacements.Add("#User_Name#", txtUserID.Text.Trim());
            objReplacements.Add("#Password#", txtPassword.Text.Trim());

            objEmail.Replacements = objReplacements;
            objEmail.Email();
        }
        catch (Exception ex)
        {

        }
    }
}