<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Resume.aspx.cs" Inherits="Resume" %>
<%@ Register TagPrefix="UserControl" TagName="PostJobs" Src="~/UserControls/Profile.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resume</title>
   
    <link href="css/Customer/style.css" rel="stylesheet" type="text/css" />
 

<link href="css/Profile/style.css" rel="stylesheet" type="text/css" />
<link href="css/Profile/osx.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<style type="text/css">
#resume .resumecontent
{
	width:786px;
    margin-top:6px;
}
</style>
<![endif]-->
</head>
<body>
 <div id="page_wrap1">
<div id="page_wrap2">
  <div id="page_wrap">
    <form id="form1" runat="server">
    <div>
     <asp:ScriptManager ID="ScriptManagerAdmin" runat="server">
    </asp:ScriptManager>
    <div class="topimg">
      <div class="resumelogo"><img src="images/resume_logo.png" width="425" height="120" alt=""></div>
    </div>
     <UserControl:PostJobs ID="PostJobs" runat="server" />
    </div>
    </form>
      </div>
        </div>
    </div>
</body>
</html>
