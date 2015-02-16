<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<form id="loginForm" runat="server">--%>

<div class="container center-block" id="login-container">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <div class="input-group">
      Your email address
      <input type="text" class="form-control" placeholder="example@email.com" id="txtEmail" runat="server" />
    </div>
    
    <div class="input-group">
      Your password
      <input type="password" class="form-control" placeholder="Your Pasword" id="txtPassword" runat="server" />
    </div>

    <asp:Button runat="server"  CssClass="btn btn-default" Text="Login>>" OnClick="LoginBtn_Click" ID="btnLogin" />
</div>

<br />
<br />
<br />
<br />

<%--</form>--%>

</asp:Content>

