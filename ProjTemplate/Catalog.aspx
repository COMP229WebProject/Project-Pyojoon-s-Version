<%@ Page Language="C#" MasterPageFile="~/BalloonShop.master" 
AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" 
Title="BalloonShop - The Product Catalog" %>

<%@ Register Src="UserControls/ProductsList.ascx" TagName="ProductsList" TagPrefix="uc1" %>
<asp:Content ID="content" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <asp:Label ID="catalogTitleLabel" CssClass="CatalogTitle" Runat="server" />
    <div float="right"> <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Enabled="False" Value="price1">0 to 100</asp:ListItem>
        <asp:ListItem Value="2">200 to 400</asp:ListItem>
        </asp:DropDownList></div>
  <br />
  <asp:Label ID="catalogDescriptionLabel" CssClass="CatalogDescription" Runat="server" />
  <br />
  <uc1:ProductsList ID="ProductsList1" runat="server" />
</asp:Content>
