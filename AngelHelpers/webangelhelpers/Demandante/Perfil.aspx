<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Demandante_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h2 class="h2"><asp:label runat="server" id="lblNombre" text="Label"></asp:label></h2>
        </div>
    </div>
    <asp:textbox id="txtNombre" runat="server"></asp:textbox>
    <asp:textbox id="txtApellidos" runat="server"></asp:textbox>
    <asp:textbox id="txtEspecialidad" runat="server"></asp:textbox>
    <asp:textbox runat="server"></asp:textbox>
    <asp:textbox runat="server"></asp:textbox>
    <asp:textbox runat="server"></asp:textbox>
    <asp:label runat="server" id="lblPrueba"></asp:label>
    

    </asp:Content>

