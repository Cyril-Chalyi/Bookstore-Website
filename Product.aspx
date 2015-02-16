<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form id="form1" runat="server">--%>
        <asp:Label runat="server" ID="lblTitle" Text=""></asp:Label>
            <br />
        <div class="wrapper">
          <div class="productimg">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="Sqlimage">
                <ItemTemplate>
                    <asp:Image ID="Image1" cssclass="img-responsive imgclass" runat="server" ImageUrl='<%# "ProductImages/" +Eval("IMAGE") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Sqlimage" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;IMAGE&quot; FROM &quot;BOOKS&quot; WHERE (&quot;ISBN&quot; = :ISBN)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ISBN" QueryStringField="ISBN" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="testclass">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="sqllistview" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <span style="">PRICE:
                <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                <br />
                QUANTITY:
                <asp:Label ID="QUANTITYLabel" runat="server" Text='<%# Eval("QUANTITY") %>' />
                <br />
                <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">PRICE:
                <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' />
                <br />
                QUANTITY:
                <asp:TextBox ID="QUANTITYTextBox" runat="server" Text='<%# Bind("QUANTITY") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">PRICE:
                <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' />
                <br />
                QUANTITY:
                <asp:TextBox ID="QUANTITYTextBox" runat="server" Text='<%# Bind("QUANTITY") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">PRICE:
                <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                <br />
                QUANTITY:
                <asp:Label ID="QUANTITYLabel" runat="server" Text='<%# Eval("QUANTITY") %>' />
                <br />
                <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                </div style="">
                
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">PRICE:
                <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                <br />
                QUANTITY:
                <asp:Label ID="QUANTITYLabel" runat="server" Text='<%# Eval("QUANTITY") %>' />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
           <asp:SqlDataSource ID="sqllistview" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;PRICE&quot;, &quot;QUANTITY&quot; FROM &quot;BOOKS&quot; WHERE (&quot;ISBN&quot; = :ISBN)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ISBN" QueryStringField="ISBN" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
         
            <div class="stars">
  <div class="rating" id="rate" runat="server"  >
 
<asp:RadioButtonList ID="rbtLstRating" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" AutoPostBack="true" OnSelectedIndexChanged="star5_CheckedChanged">
<asp:ListItem  Text="5"  Value="5" runat="server" CssClass="backgroundcolor:red;"/> 
 <%-- <asp:Label AssociatedControlID ="star5" runat="server"></asp:Label>--%>
  <asp:ListItem  Text="4" Value="4" runat="server"/>
 <%-- <asp:Label AssociatedControlID ="star4" runat="server" ></asp:Label>--%>
 <asp:ListItem Text="3" Value="3" runat="server"/>
     <%--<asp:Label   AssociatedControlID ="star3" runat="server"></asp:Label> --%>
     <asp:ListItem   Text="2" Value="2" runat="server"/>
     <%--<asp:Label   AssociatedControlID ="star2" runat="server"></asp:Label>--%>
     <asp:ListItem  Text="1" Value="1" runat="server"/>
  <%-- <asp:Label   AssociatedControlID ="star1" runat="server"></asp:Label>--%>
      </asp:RadioButtonList>  
   </div>                              
</div>

        <p>
            &nbsp;</p>
            </div>
      <div class="booktitle">
          <asp:DataList ID="DataList2" runat="server" DataSourceID="Sqlbooktitle">
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("TITLE") %>'></asp:Label>
              </ItemTemplate>
              </asp:DataList>
          <asp:SqlDataSource ID="Sqlbooktitle" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;TITLE&quot; FROM &quot;BOOKS&quot; WHERE (&quot;ISBN&quot; = :ISBN)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="ISBN" QueryStringField="ISBN" Type="String" />
              </SelectParameters>
          </asp:SqlDataSource>
      </div>
        <div class="addtocartdiv">
            <asp:Button runat="server" CssClass="addtocart" ID="addtocart" Text="Add to Cart" OnClick="addtocart_Click"/>
            <!--<input type="button" id="addtocart" class="addtocart" value="Add to Cart"/>-->
        </div>
        <div class="bookdecs">
            
            <asp:DataList ID="DataList4" runat="server" DataSourceID="Sqlbookdesc">
                <ItemTemplate>
                    &nbsp;<asp:Label ID="BOOKDESCRLabel" runat="server" Text='<%# Eval("BOOKDESCR") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Sqlbookdesc" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;BOOKDESCR&quot; FROM &quot;BOOKS&quot; WHERE ((&quot;ISBN&quot; = :ISBN) AND (&quot;ISBN&quot; = :ISBN2))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ISBN" QueryStringField="ISBN" Type="String" />
                    <asp:QueryStringParameter Name="ISBN2" QueryStringField="ISBN" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
            </div>
        <div class="recommnded">
              <header>
            <h2 class="title">
               <span> Top Rated</span>
            </h2>
        </header>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="gridview" DataSourceID="Sqlcategoryprod" PageSize="4">
                <Columns>
                    <asp:TemplateField HeaderText="IMAGE" SortExpression="IMAGE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IMAGE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                              <a href="Product.aspx?ISBN=<%# Eval("ISBN") %>">
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%# "Productimages/"+Eval("IMAGE") %>' />
                                  <a />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# "Productimages/"+Eval("IMAGE") %>' />
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="Sqlcategoryprod" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;IMAGE&quot; FROM &quot;BOOKS&quot;">
            </asp:SqlDataSource>

        </div>
   
       
   <%-- </form>--%>
    
</asp:Content>

