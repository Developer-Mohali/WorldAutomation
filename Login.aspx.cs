using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ADB.Entities;
using ADB.Services;
using Adb.BusinessLayer;
using DataAccessLayer.DataContext;

public partial class Login : System.Web.UI.Page
{
    Adb.BusinessLayer.User objUser = new Adb.BusinessLayer.User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string returnUrl = Request.QueryString["ReturnUrl"];
            if ((returnUrl != null && Common.GetUserName() != ""))
            {
                lblMessage.Text = "Access Denied. Please login.";
            }
            else if (returnUrl == "SignUp Successfully")
            {
                lblMessage.Text = "<font color=green>SignUp Successfully.</font>";
            }
            else if (returnUrl != null)
            {
                lblMessage.Text = "Session Expired. Please Re-login.";
            }
            this.LoginUser.FindControl("LoginButton").Focus();

            if (Session["roles"] != null)
            {
                RedirectUser(Session["roles"].ToString());
            }
        }
    }

    protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
    {
        UsersService objUserMaster = new UsersService();
        List<ValidateUserResult> objValidateUser = null;
        string roles = string.Empty;       


                         
        objValidateUser = objUser.ValidateUserLogin(LoginUser.UserName, LoginUser.Password);
               

        if (objValidateUser.Count > 0)
        {
            string UserRole = "";                                    

            //// Initialize FormsAuthentication, for what it's worth
            FormsAuthentication.Initialize();
                                                                                       
            //// Create a new ticket used for authentication
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, LoginUser.UserName, DateTime.Now, DateTime.Now.AddMinutes(30), true, UserRole, FormsAuthentication.FormsCookiePath);
                           
            //// Encrypt the cookie using the machine key for secure transport
            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

            //// Set the cookie's expiration time to the tickets expiration time
            if ((ticket.IsPersistent))
            {         
                cookie.Expires = ticket.Expiration;   
            }


            //// Add the cookie to the list for outgoing response
            Response.Cookies.Add(cookie);

            // Redirect to requested URL, or homepage if no previous page
            // requested
            string returnUrl = Request.QueryString["ReturnUrl"];
            if (returnUrl == null) returnUrl = FormsAuthentication.DefaultUrl;

            // Don't call FormsAuthentication.RedirectFromLoginPage since it
            // could
            // replace the authentication ticket (cookie) we just added
            foreach (var data in objValidateUser)
            {
                roles = data.Roles;
                Session["UserId"] = data.User_Id;
                Session["roles"] = roles;
            }

            RedirectUser(roles);        
           

            e.Authenticated = true;

        }
        else
        {
            e.Authenticated = false;
            lblMessage.Text = "<font color=red > UserName/Password is wrong.</font>";
        }
    }

    /// <summary>
    /// <CreatedBy>Radhey Murari</CreatedBy>
    /// <CreatedDate>17-Jan-2013</CreatedDate>
    /// <Description>This method is used to redirect  user </Description>
    /// </summary>
    /// <param name="roles"></param>
    private void RedirectUser(string roles)
    {
        if (roles == Constant.Roles.Candidate)
        {
            Response.Redirect("~/Candidate/Profile.aspx");
        }
        else if (roles == Constant.Roles.Customer)
        {
            Response.Redirect("~/Customer/OpenJobs.aspx");
        }
    }
}
