<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="ContentPlaceHolderLogin" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">



    <asp:Button runat="server" ID="btnRegistro" CssClass="btn btn-outline-primary" PostBackUrl="~/Login.aspx" Text="Acceder" />
    <asp:Button runat="server" CssClass="btn btn-outline-info" PostBackUrl="~/registro.aspx" Text="Registrarse" />



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

