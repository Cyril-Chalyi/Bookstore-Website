<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <form id="form1" runat="server">--%>
        <asp:Label ID="lblShipMethod" runat="server" Text="Shipping Method"></asp:Label>
        <br />
        <asp:DropDownList ID="dlstShipMethod" runat="server" OnSelectedIndexChanged="dlstShipMethod_SelectedIndexChanged" DataSourceID="ShippingMethodDS" DataTextField="SHIPNAME" DataValueField="SHIPPINGID" AutoPostBack="True">
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="ShippingMethodDS" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;SHIPNAME&quot;, &quot;SHIPPINGID&quot;, &quot;SHIPPRICE&quot; FROM &quot;SHIPPINGMETHOD&quot;"></asp:SqlDataSource>
        
        <asp:DetailsView ID="dViewShipPrice" runat="server" OnDataBound="dViewShipPrice_DataBound" AutoGenerateRows="False" BorderStyle="None" DataSourceID="ShipPriceDS" GridLines="None" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="SHIPPRICE" HeaderText="SHIPPPING PRICE" SortExpression="SHIPPRICE">
                </asp:BoundField>
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="ShipPriceDS" runat="server"  ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;SHIPPRICE&quot; FROM &quot;SHIPPINGMETHOD&quot; WHERE (&quot;SHIPPINGID&quot; = :SHIPPINGID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="dlstShipMethod" Name="SHIPPINGID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />+<br /><br />

        <asp:DetailsView ID="dViewOrderTotal" runat="server" OnDataBound="dViewOrderTotal_DataBound" AutoGenerateRows="False" BorderStyle="None" DataSourceID="OrderTotalDS" GridLines="None" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="ORDERTOTAL" HeaderText="ORDER TOTAL" SortExpression="ORDERTOTAL" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="OrderTotalDS" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ORDERTOTAL&quot; FROM &quot;SHOPPINGCART&quot; WHERE (&quot;CARTID&quot; = :CARTID)">
            <SelectParameters>
                <asp:SessionParameter Name="CARTID" SessionField="CartID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />=<br /><br />

        <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnPayment" runat="server" Text="Proceed to Payment" OnClick="btnPayment_Click" CssClass="btn-margin"/>
        <br />
    <%--</form>--%>
</asp:Content>

