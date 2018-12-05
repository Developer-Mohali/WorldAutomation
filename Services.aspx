<%@ Page Title="" Language="C#" MasterPageFile="AdbMain.master" AutoEventWireup="true"
    CodeFile="Services.aspx.cs" Inherits="Services" %>

<%@ Register TagPrefix="UserControl" TagName="Services" Src="~/UserControls/Services.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
    <style type="text/css">
        .border
        {
            border-left: 1px solid #b3b8c3;
            border-right: 1px solid #b3b8c3;
        }
        .border1
        {
            border-left: 1px solid #b3b8c3;
            border-right: 1px solid #b3b8c3;
            border-bottom: 1px solid #b3b8c3;
        }
        .subcontent1
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #8c8f98;
            padding-top: 20px;
        }
        .footercontent
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #52524d;
            text-align: center;
        }
        .footercontent1
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #ffffff;
            text-align: center;
            padding-top: 5px;
        }
        .more
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #e01015;
            padding-right: 5px;
            text-align: right;
        }
        .recentposting
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: 18px;
            color: #ffffff;
            padding-left: 20px;
        }
        .recent1
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: normal;
            font-size: 12px;
            color: #000000;
            padding-left: 20px;
        }
        .servicehead
        {
            color: #E6BE01;
            font-size: 17px;
            font-weight: bolder;
            padding-left: 10px;
            font-family: Arial; /*text-shadow: 0.2em 0.2em 0.3em #CDCDCD;*/
        }
        .servicehead a
        {
            color: #E6BE01;
            font-size: 17px;
            font-weight: bolder;
            padding-left: 10px;
            text-decoration: none;
            font-family: Arial; /*text-shadow: 0.2em 0.2em 0.3em #CDCDCD;*/
        }
        .servicehead a:hover
        {
            text-decoration: underline;
        }
        .services
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: bolder;
            font-size: 14px;
            color: #ffffff;
            padding-left: 30px;
            background: url('Images/submenu.gif');
        }
        
        .contwhitebg
        {
            background: #FFF;
            border: solid #a9c7e0;
            border-width: 0 1px 0 1px;
            padding: 0px 10px;
        }
    </style>
    <style type="text/css">
        ul.thumb
        {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        ul.thumb li
        {
            margin: 0;
            float: left;
            position: relative;
            width: 317px;
            height: 175px;
            padding: 0;
        }
        ul.thumb li img
        {
            width: 316px;
            height: 174px;
            position: absolute;
            padding: 0;
            border: none;
        }
        ul.thumb li img.hover
        {
            background: url(thumb_bg.png) no-repeat center center;
            border: none;
        }
        #main_view
        {
            float: left;
            padding: 9px 0;
            margin-left: -10px;
        }
    </style>
    <script type="text/javascript" src="zoom/supernote.js"></script>
    <link rel="stylesheet" type="text/css" href="zoom/supernote.css" />
    <script src="script/jqueryzoom.js" type="text/javascript"></script>
    <link href="Includes/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var supernote = new SuperNote('supernote', {});

        function animFade(ref, counter) {
            //counter = Math.min(counter, 0.9); // Uncomment to make notes translucent.
            var f = ref.filters, done = (counter == 1);
            if (f) {
                if (!done && ref.style.filter.indexOf("alpha") == -1)
                    ref.style.filter += ' alpha(opacity=' + (counter * 100) + ')';
                else if (f.length && f.alpha) with (f.alpha) {
                    if (done) enabled = false;
                    else { opacity = (counter * 100); enabled = true }
                }
            }
            else ref.style.opacity = ref.style.MozOpacity = counter * 0.999;
        };
        supernote.animations[supernote.animations.length] = animFade;
        addEvent(document, 'click', function (evt) {
            var elm = evt.target || evt.srcElement, closeBtn, note;

            while (elm) {
                if ((/note-close/).test(elm.className)) closeBtn = elm;
                if ((/snb-pinned/).test(elm.className)) { note = elm; break }
                elm = elm.parentNode;
            }

            if (closeBtn && note) {
                var noteData = note.id.match(/([a-z_\-0-9]+)-note-([a-z_\-0-9]+)/i);
                for (var i = 0; i < SuperNote.instances.length; i++)
                    if (SuperNote.instances[i].myName == noteData[1]) {
                        setTimeout('SuperNote.instances[' + i + '].setVis("' + noteData[2] +
     '", false, true)', 100);
                        cancelEvent(evt);
                    }
            }
        });
        addEvent(supernote, 'show', function (noteID) {
            // Do cool stuff here!
        });
        addEvent(supernote, 'hide', function (noteID) {
            // Do cool stuff here!
        }); 
    </script>
    <table width="100%">
        <tr>
            <td align="center">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top" align="center">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <h1>
                                            Services</h1>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" valign="top" align="center">
                                        <UserControl:Services ID="ServicesList" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
