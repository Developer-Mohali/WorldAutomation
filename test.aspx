<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Untitled Page</title>

  <script type="text/javascript" src="script/dropmenu.js"></script>
   <script type="text/javascript" src="script/jquery.js"></script>

  <style type="text/css">
    body {
	background:#E5F0FF none repeat scroll 0 0;
	color:#595959;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size: 12px;
}
ul, li{
	padding: 0px;
	margin: 0px;
}
ul.dropmenu{
	position: relative;
	margin: 0px;
	padding: 1px 0px 0px 0px;
	background:transparent url(images/navigation.png) repeat-x scroll 0 0;
	display:block;
	height: 35px;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size: 12px;
}
.dropmenu li{
	position: relative;
	list-style: none;
	float: left;
	margin: 0px;
	padding: 0px;
}
.dropmenu li a{
	height: 22px;
	padding: 9px 30px 0px 15px;
	display: block;
	cursor: point;
	border-right: solid 1px #4a779d;
	color: #FFFFFF;
	text-transform: uppercase;
	text-decoration: none;
}
.dropmenu li span{
	display: block;
	float: right;
	height: 10px;
	width: 10px;
	background:transparent url(images/arrow_up.png) repeat-x scroll 0 0;
	position: absolute;
	top: 12px;
	right: 10px;
}
.dropmenu li  a:hover span{
	background:transparent url(images/arrow_hover.png) repeat-x scroll 0 0;
}
.dropmenu li:hover ul, .dropmenu li:hover div{
	display: block;
}
.dropmenu ul{
	position: absolute;
	display: none;
	width: 140px;
	padding: 0px;
	margin: 0px;
	border-bottom: 1px solid #ccc;
	background: #FFFFFF url(images/gradient.png) repeat-x scroll 0 0;
}
.dropmenu ul li{
	border: 0;
	float: none;
}
.dropmenu ul a {
  border: 1px solid #ccc;
  border-bottom: 0;
  white-space: nowrap;
  display:block;
  color: #0657AD;
  text-decoration: underline;
  text-transform: none;
}
a.selected, a:hover{
	color: #0657AD !important;
	background: #FFFFFF url(images/gradient.png) repeat-x scroll 0 0;
}
a.selected span{
	background:transparent url(images/arrow_hover.png) repeat-x scroll 0 0;
}
.dropmenu ul a:hover {
	color:#F67A00 !important;
	text-decoration: none;
	background-color: #F0F0F0;
	background-image: none;
}
.dropmenu div ul{
	position: relative;
	display: block;
}
.dropmenu li div{
	background: #FFFFFF url(images/gradient.png) repeat-x scroll 0 0;
	border: 1px solid #ccc;
	padding: 5px;
	display: none;
	position: absolute;
}
.dropmenu li div ul{
	border: none;
	background: none;
	position: relative !important;
}
.dropmenu li div a{
	border: none;
	border-bottom: 1px solid #ccc;
}
.dropmenu li div div{
	display: block;
	position: relative;
	background: none;
	border: none;
}
.dropmenu li div div a{
	display: inline;
	border: none;
	color: #666;
	text-decoration: underline;
	padding: 0px;
	margin: 0px;
	text-transform: none;
}
.dropmenu li div div a:hover{
	color: #000;
	text-decoration: none;
}
ul.left{
	float: left;
	width: 145px;
}
ul.right{
	float: right;
	width: 145px;
}
.small{
	color: #666;
	font-size: 10px;
	padding: 10px 5px 8px 5px !important;
	display: block;
	clear: both;
}
.products{
	width: 300px;
	padding: 15px !important;
}
.products ul{
	width: 100%;
}
.products ul li{
	border-bottom: 1px solid #ccc;
	height: 40px;
	padding: 10px 0px;
}
.products h2{
	font-size: 16px;
	padding: 2px 0px 3px 0px;
	margin: 0px;
}
.products p{
	color: #666;
	font-size: 10px;
	padding: 0px;
	margin: 0px;
}
.products img{
	float: left;
	padding-right: 10px;
}
.products  ul li a{
	display: inline;
	border: none;
	color: #666;
	text-decoration: underline;
	padding: 0px;
	margin: 0px;
	text-transform: none;
}
.products  ul li  a:hover{
	color: #000 !important;
	text-decoration: none;
	background: none !important;
}

.tutorials{
	width: 300px;
}

.login{
	padding: 15px !important;
	width: 180px;
}
input{
	border:1px solid #4A779D;
	padding: 3px 8px;
	margin-bottom: 8px;
	width: 164px;
}
label{
	padding: 0px 0px 4px 0px;
	display:block;
}
button{
	background: #4A779D url(images/navigation.png) repeat-x scroll 0 0;
	color: #FFF;
	border:1px solid #4A779D;
	padding: 4px 10px;
	width: 180px;
}
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <ul id="nav-one" class="dropmenu">
    <li><a href="#">Home</a> </li>
    <li><a href="#">Forum</a>
      <ul>
        <li><a href="#">Support</a></li>
        <li><a href="#">Help</a></li>
        <li><a href="#">Examples</a></li>
        <li><a href="#">Your work</a></li>
      </ul>
    </li>
    <li><a href="#item3">Downloads</a>
      <ul>
        <li><a href="#">Tools</a></li>
        <li><a href="#">Office</a></li>
        <li><a href="#">Custom projects</a></li>
      </ul>
    </li>
    <li><a href="#">Products</a>
      <div class="products">
        <ul>
          <li>
            <img src="images/236872.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Featured Box</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
          <li>
            <img src="images/242702.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Mod Rewriter</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
          <li>
            <img src="images/242177.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Byte Scrambler</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
          <li>
            <img src="images/226138.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Image Processor</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
          <li>
            <img src="images/216794.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Registry Class</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
          <li>
            <img src="images/211826.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Data Validation</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
          <li>
            <img src="images/203708.jpg" width="40" height="40" alt="Thumb" border="0" /><h2>
              Ajax Tables</h2>
            <p>
              <a href="#">More information about this product</a></p>
          </li>
        </ul>
        <div class="small">
          At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium
          voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint
          occaecati cupiditate non provident.</div>
      </div>
    </li>
    <li><a href="#">Tutorials</a>
      <div class="tutorials">
        <ul class="left">
          <li><a href="#">Javascript</a></li>
          <li><a href="#">Python</a></li>
          <li><a href="#">PHP</a></li>
        </ul>
        <ul class="right">
          <li><a href="#">HTML/CSS</a></li>
          <li><a href="#">ASP.NET</a></li>
          <li><a href="#">Actionscript</a></li>
        </ul>
        <div class="small">
          View <a href="#">all categories</a> or a <a href="#">list of the best tutorials</a>.</div>
      </div>
    </li>
    <li><a href="#">Links</a>
      <ul>
        <li><a href="#">Programming</a></li>
        <li><a href="#">Inspiration</a></li>
        <li><a href="#">My websites</a></li>
        <li><a href="#">Clients</a></li>
        <li><a href="#">Cool stuff</a></li>
        <li><a href="#">Sitebase</a></li>
        <li><a href="#">Other</a></li>
      </ul>
    </li>
    <li><a href="#">Login</a>
      <div class="login">
        <label for="txtuser">
          Username:
        </label>
        <input type="text" name="txtuser" id="txtuser" />
        <label for="txtuser">
          Password:
        </label>
        <input type="password" name="txtpass" id="txtpass" />
        <button>
          Login</button>
      </div>
    </li>
  </ul>
  </form>
</body>
</html>
