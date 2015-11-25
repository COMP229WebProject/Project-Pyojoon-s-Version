<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DepartmentsList.ascx.cs" Inherits="DepartmentsList" %>
<asp:DataList ID="list" Width="92%" runat="server" CssClass="DepartmentListContent" RepeatColumns="6">
  <ItemTemplate>
    &nbsp;&raquo;
    <asp:HyperLink ItemStyle-VerticalAlign="Top"
      ID="HyperLink1" 
      Runat="server" 
      NavigateUrl='<%# "../Catalog.aspx?DepartmentID=" + Eval("DepartmentID")%>'
      Text='<%# Eval("Name") %>'
      ToolTip='<%# Eval("Description") %>'
      CssClass='<%# Eval("DepartmentID").ToString() == Request.QueryString["DepartmentID"] ? "DepartmentSelected" : "DepartmentUnselected" %>'
      >
    </asp:HyperLink>
    &nbsp;&laquo;
 </ItemTemplate>
  <HeaderTemplate>
    Choose a Department
  </HeaderTemplate>
  <HeaderStyle CssClass="DepartmentListHead" />
</asp:DataList>
