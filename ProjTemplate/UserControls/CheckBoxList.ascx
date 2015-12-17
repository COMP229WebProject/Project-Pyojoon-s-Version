<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CheckBoxList.ascx.cs" Inherits="UserControls_CheckBoxList" %>

<header class="PriceRangeHead">
    Choose Pricerange
</header>
<asp:CheckBoxList ID="CheckBoxList1" Width="200px" runat="server" CssClass="PriceRangeContent">
    <asp:ListItem Text="~ $200.00" Value="second"></asp:ListItem>
    <asp:ListItem Text="~ $300.00" Value="third"></asp:ListItem>
    <asp:ListItem Text="~ $400.00" Value="fourth"></asp:ListItem>
    <asp:ListItem Text="~ $500.00" Value="fifth"></asp:ListItem>
    <asp:ListItem Text="~ $600.00" Value="sixth"></asp:ListItem>
    <asp:ListItem Text="~ $700.00" Value="seventh"></asp:ListItem>
</asp:CheckBoxList>
