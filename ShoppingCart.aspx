<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form id="form1" runat="server">--%>
        <h3><span>Your Shopping Cart</span></h3>

        <asp:GridView ID="grdShoppingCart" CssClass="table" runat="server" DataSourceID="ShoppingCartDS" AutoGenerateColumns="False">
            <Columns>

                <asp:TemplateField HeaderText="ITEM" SortExpression="IMAGE">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IMAGE") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image CssClass="imgShopCart" runat="server" ImageUrl='<%# "ProductImages/" + Eval("IMAGE") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <div><%#Eval("TITLE")%></div> 
                        <div><%#Eval("AUTHOR")%></div>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="BOOKQUANT" HeaderText="QUANTITY" SortExpression="BOOKQUANT" />
                
                <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                
                <asp:BoundField DataField="TOTALPRICE" HeaderText="TOTAL" SortExpression="TOTALPRICE" />
            
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="ShoppingCartDS" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;SHOPPINGCARTCARTID&quot;, &quot;IMAGE&quot;, &quot;TITLE&quot;, &quot;AUTHOR&quot;, &quot;BOOKQUANT&quot;, &quot;PRICE&quot;, &quot;TOTALPRICE&quot; FROM &quot;SHOPPING_CART_VIEW&quot; WHERE (&quot;SHOPPINGCARTCARTID&quot; = :SHOPPINGCARTCARTID)">
            <SelectParameters>
                <asp:SessionParameter Name="SHOPPINGCARTCARTID" SessionField="cartID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="btnCheckOut" runat="server" OnClick="btnCheckOut_Click" Text="Check Out" CssClass= "btn-margin"/>

   <%-- </form>--%>



</asp:Content>

