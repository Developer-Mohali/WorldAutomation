using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADB.Entities;
using ADB.Services;

public partial class Quote_ChangePassword : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      txtUserID.Text = Common.GetLoginName();
    }
  }

  protected void btnSubmit_Click(object sender, EventArgs e)
  {
    UsersService objUserMaster = new UsersService();
    TList<Users> objUserMasterList = objUserMaster.Find("User_Name=" + Common.GetLoginName());
    if (objUserMasterList.Count > 0)
    {
      if (txtOldPassword.Text == objUserMasterList[0].Password)
      {
        objUserMasterList[0].Password = txtNewPassword.Text;
        objUserMaster.Save(objUserMasterList[0]);
        //lblMessage.Text = "Password changed successfully.";
        MultiView1.ActiveViewIndex = MultiView1.ActiveViewIndex + 1;
      }
      else
      {
        lblMessage.Text = "Invalid old password.";
      }
    }
    else
    {
      lblMessage.Text = "User name does not exists.";
    }
  }

}
