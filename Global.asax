<%@ Application Language="C#" %>
<%@ Import Namespace="System.Security.Principal" %>
<%@ Import Namespace="Adb.BusinessLayer" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">

    PageManager objPageManager;
    void RegisterRoutes(RouteCollection routes)
    {

        routes.Ignore("js/{*pathInfo}");
        routes.Ignore("css/{*pathInfo}");
        routes.Ignore("images/{*pathInfo}");
        routes.Ignore("fckeditor/{*pathInfo}");
        routes.Ignore("{resource}.jpg/{*pathInfo}");
        routes.Ignore("{resource}.png/{*pathInfo}");
        objPageManager = new PageManager();
        PageTable objTable = null;
        objTable = objPageManager.FetchPage();

//        for (int i = 0; i < objTable.Rows.Count; i++)
//        {
//            string strActualPageName = objTable.Rows[i]["ActualPageName"].ToString();
//            string strPageName = objTable.Rows[i]["PageName"].ToString();
//            routes.MapPageRoute(
//objTable.Rows[i]["PageName"].ToString(),  //Name of the Route (can be anyuthting)
//strPageName, // URL with parameters
//"~/" + strActualPageName); //Page which will handles and process the request

//        }

        routes.MapPageRoute("Default", string.Empty,"~/V2/default.aspx" );
        routes.MapPageRoute("Default1", "Home", "~/V2/default.aspx");
        routes.MapPageRoute("Services", "Services", "~/V2/Services.aspx");
        routes.MapPageRoute("Company", "Company", "~/V2/Company.aspx");
        routes.MapPageRoute("ContactUS", "Contact-Us", "~/V2/Contact-Us.aspx");
        routes.MapPageRoute("Mission", "Mission", "~/V2/Mission.aspx");
        routes.MapPageRoute("Standards", "Standards", "~/V2/Standards.aspx");
        routes.MapPageRoute("Team", "Team", "~/V2/Team.aspx");
        routes.MapPageRoute("Technology", "Technology", "~/V2/Technology.aspx");
        routes.MapPageRoute("Events", "Events", "~/V2/Events.aspx");
        routes.MapPageRoute("Search-Result", "Search-Result", "~/V2/Search-Result.aspx");
        routes.MapPageRoute("SiteMap", "Sitemap", "~/V2/Sitemap.aspx");
       
       
//        routes.MapPageRoute(
//"ServiceHandler",  //Name of the Route (can be anyuthting)
//"Services/{service}", // URL with parameters
//"~/" + "ServiceDetails.aspx"); //Page which will handles and process the request

//        routes.MapPageRoute(
//"Login",  //Name of the Route (can be anyuthting)
//"Login", // URL with parameters
//"~/" + "V2/Default.aspx"); //Page which will handles and process the request


//        routes.MapPageRoute(
//"ForgetPassword",  //Name of the Route (can be anyuthting)
//"Forget-Password", // URL with parameters
//"~/" + "V2/Default.aspx"); //Page which will handles and process the request

//        routes.MapPageRoute(
//"SignUP",  //Name of the Route (can be anyuthting)
//"Sign-Up", // URL with parameters
//"~/" + "V2/Default.aspx"); //Page which will handles and process the request
    }


    void Application_Start()
    {
        RegisterRoutes(RouteTable.Routes);
    }
    protected void Application_Start(object sender, EventArgs e)
    {

        Application_Start();
    }


    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        if (HttpContext.Current.User != null)
        {
            //if (HttpContext.Current.User.Identity.IsAuthenticated)
            //{

            //    FormsIdentity id = (FormsIdentity)(HttpContext.Current.User.Identity);
            //    FormsAuthenticationTicket ticket = id.Ticket;

            //    //'// Get the stored user-data, in this case, our roles
            //    String userData = ticket.UserData;
            //    String[] roles = userData.Split(',');

            //    HttpContext.Current.User = new GenericPrincipal(id, roles);
            //}
        }
    }
    
</script>
