<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="newarrival.aspx.cs" Inherits="newarrival" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form id="form1" runat="server">--%>
        <br />
        <header>
            <h2 class="title">
             
                <span>New Arrivals</span>
            </h2>
        </header>
    <asp:GridView ID="GridView1" runat="server" cssclass="gridview" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="newarriveds" PageSize="6">
        <Columns>
            <asp:TemplateField HeaderText="IMAGE" SortExpression="IMAGE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IMAGE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                      <a href="Product.aspx?ISBN=<%# Eval("ISBN") %>">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "Productimages/"+Eval("IMAGE") %>' /></a>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TITLE") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
     
    </asp:GridView>
    <asp:SqlDataSource ID="newarriveds" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;PRICE&quot;, &quot;TITLE&quot;, &quot;IMAGE&quot; FROM &quot;BOOKS&quot; WHERE (&quot;CATEGORYCATEGORYID&quot; = :CATEGORYCATEGORYID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="CATEGORYCATEGORYID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<%--</form>--%>
</asp:Content>

