<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartSummary.ascx.cs" Inherits="CartSummary" %>
<table border="0" cellpadding="0" cellspacing="0" width="200">
    <tr>
        <td class="CartSummary">
            <b>
                <asp:Label ID="cartSummaryLabel" runat="server" /></b>
            <asp:HyperLink ID="viewCartLink" runat="server" NavigateUrl="../ShoppingCart.aspx"
                CssClass="CartLink" Text="(view details)" />
            <asp:DataList ID="list" runat="server">
                <ItemTemplate>
                    <%# Eval("Quantity") %> x <%# Eval("Name") %>
                </ItemTemplate>
            </asp:DataList>
            <!--<img src="Images/line.gif" border="0" width="100%" height="1" />-->

        </td>
    </tr>
    <tr>
        <td class="CartSummary">Total: 
      <span class="ProductPrice">
          <asp:Label ID="totalAmountLabel" runat="server" />
      </span>
        </td>
    </tr>
</table>
