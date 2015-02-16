<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<%--    <form id="form1" runat="server">--%>

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner carousel-example-generic-inner">
    <div class="item active">
      <img src="images/1.jpg" alt="..."/>
    </div>
    <div class="item">
      <img src="images/2.jpg"  alt="..."/>
    </div>
    <div class="item">
      <img src="images/3.jpg" alt="..."/>
    </div>
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> <!-- Carousel -->

<script>
    $('.carousel').carousel({
        interval: 3000
    })
</script>

<br />
  <header><h2 class="title"><span>Top Rated</span></h2></header>

  <div id="list-carousel" class="carousel slide" data-ride="carousel" data-interval="50000">
  <div class="carousel-inner list-carousel-inner">
      
    <asp:Repeater ID="ProductRepeater" runat="server" DataSourceID="BookStoreOracleSource" OnPreRender="ProductRepeater_PreRender">
    <ItemTemplate>   
        <asp:Literal ID="ltDivPrefix" runat="server"></asp:Literal>         
                        <a href="Product.aspx?ISBN=<%# Eval("ISBN") %>">
                            <img src="<%# "ProductImages/" + Eval("Image") %>"/>
                        </a>
        <asp:Literal ID="ltDivSuffix" runat="server"></asp:Literal>
     </ItemTemplate>
     </asp:Repeater>

     <asp:SqlDataSource ID="BookStoreOracleSource" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;IMAGE&quot;, &quot;ISBN&quot; FROM &quot;BOOKS&quot; WHERE (&quot;RATINGTOTAL&quot; &gt; :RATINGTOTAL) ORDER BY &quot;RATINGTOTAL&quot; DESC">
         <SelectParameters>
             <asp:Parameter DefaultValue="3.5" Name="RATINGTOTAL" Type="Single" />
         </SelectParameters>
      </asp:SqlDataSource>
        
  </div>

 <!-- Controls -->
  <a class="left carousel-control" href="#list-carousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#list-carousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> <!-- Carousel -->

    <br/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    <div id="list-carousel2" class="carousel slide" data-ride="carousel" data-interval="50000">
    <div class="carousel-inner list-carousel-inner">

      <header><h2 class="title"><span>New Arrivals</span></h2></header>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="NewArrivalsDS" OnPreRender="ProductRepeater_PreRender2">
            <ItemTemplate>   
                <asp:Literal ID="ltDivPrefix2" runat="server"></asp:Literal>         
                        <a href="Product.aspx?ISBN=<%# Eval("ISBN") %>">
                            <img src="<%# "ProductImages/" + Eval("Image") %>"/>
                        </a>
                <asp:Literal ID="ltDivSuffix2" runat="server"></asp:Literal>
            </ItemTemplate>
       </asp:Repeater>
          <asp:SqlDataSource ID="NewArrivalsDS" runat="server" ConnectionString="<%$ ConnectionStrings:OracleConnection %>" ProviderName="<%$ ConnectionStrings:OracleConnection.ProviderName %>" SelectCommand="SELECT &quot;ISBN&quot;, &quot;IMAGE&quot; FROM &quot;BOOKS&quot; WHERE (&quot;DATEADDED&quot; &gt;= :DATEADDED) ORDER BY &quot;DATEADDED&quot; DESC">
              <SelectParameters>
                  <asp:Parameter DefaultValue="14-11-01" Name="DATEADDED" Type="DateTime" />
              </SelectParameters>
          </asp:SqlDataSource>
          
       </div>

        <!-- Controls -->
  <a class="left carousel-control" href="#list-carousel2" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#list-carousel2" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> <!-- Carousel -->

    <br/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  

 <%--   </form>--%>
</asp:Content>

