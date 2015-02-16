<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="CategoryList.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <form id="form1" runat="server">--%>
        <p>
            <br />
        </p>
        <ul class="categoryList">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="CATEGORYID" DataSourceID="CategoriesDS">
                <ItemTemplate>
                    <li>
                        <a href="Category.aspx?CategoryID=<%# Eval("CategoryID") %>">
                            <asp:Label ID="CATNAMELabel" runat="server" Text='<%# Eval("CATNAME") %>' />
                            <br />
                        </a>
                    </li>
                </ItemTemplate>
            </asp:DataList>
        </ul>
        <asp:SqlDataSource ID="CategoriesDS" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;CATEGORYID&quot;, &quot;CATNAME&quot; FROM &quot;CATEGORY&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="OracleConnection" runat="server"></asp:SqlDataSource>
    <%--</form>--%>
</asp:Content>

