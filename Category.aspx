<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form id="form1" runat="server">--%>
          <header>
            <h2 class="title">
               <span> <asp:Label ID="catlabel" runat="server" Text=""></asp:Label></span>
             
            </h2>
        </header>
        <asp:DataList ID="DataList1" runat="server"  cssclass="gridview" DataSourceID="CategoryDS" RepeatColumns="4" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" CellPadding="40" CellSpacing="40">
            <ItemTemplate>
                 <a href="Product.aspx?ISBN=<%# Eval("ISBN") %>">
                      
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "ProductImages/" + Eval("IMAGE") %>' Height="240px" Width="240px" />
                <br />
                     </a>
                <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                <br />
                <asp:Label ID="AUTHORLabel" runat="server" Text='<%# Eval("AUTHOR") %>' />
                <br />
                <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                <br />
                <br />
                      
            </ItemTemplate>
        </asp:DataList>
       
        <asp:SqlDataSource ID="CategoryDS" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;IMAGE&quot;, &quot;TITLE&quot;, &quot;AUTHOR&quot;, &quot;PRICE&quot; FROM &quot;BOOKS&quot; WHERE (&quot;CATEGORYCATEGORYID&quot; = :CATEGORYCATEGORYID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CATEGORYCATEGORYID" QueryStringField="CategoryID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
          
        <br />
        <br />
  <%--  </form>--%>
</asp:Content>

