<%@ Page Language="C#" MasterPageFile="~/AdbMain.master" AutoEventWireup="true" CodeFile="ServicesandOutSourcing.aspx.cs"
	Inherits="ServicesandOutSourcing" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
	<style type="text/css">
		.servicehead
		{
			color: #E6BE01;
			font-size: 17px;
			font-weight: bolder;
			padding-left: 0px;
			font-family: Arial;
		}
		
		.contwhitebg
		{
			background: #FFF;
			border: solid #a9c7e0;
			border-width: 0 1px 0 1px;
			padding: 20px;
		}
	</style>
	<table width="1008" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td class="contentbg" align="center">
				<table width="980" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<img src="images/cont_top_bg.jpg" alt="" />
						</td>
					</tr>
					<tr>
						<td class="contwhitebg">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<div id="div_servicesoutsourcing" runat="server" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<img src="images/cont_bottom_bg.jpg" alt="" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
