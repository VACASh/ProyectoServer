<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmpresa.master" AutoEventWireup="true" CodeFile="PerfilEmpresa.aspx.cs" Inherits="Empresa_PerfilEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="info" runat="server" ContentPlaceHolderID="infoUser">
    <asp:Label runat="server" ID="lblUserInfo" ForeColor="White"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="jumbotron">
           <h3 class="h3"> Perfil de empresa</h3>
             <asp:Label runat="server" ID="lblMensaje" ForeColor="Red"></asp:Label>
        </div>
        <div class="card" style="border-color: #007bff; padding: 1em">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Ajustes de perfil</h4>
                        <asp:Label runat="server" Text="Label">Actualiza tu nombre,tu dirección, el correo electrónico...  </asp:Label>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:Button runat="server" Text="Actualizar" CssClass="btn btn-outline-primary" OnClick="Unnamed2_Click"  />
                    </div>
                </div>


            </div>
            <div class="card-body">
                <asp:Label runat="server" AssociatedControlID="txtNombre">Nombre:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre"></asp:TextBox>
                <asp:Label runat="server" AssociatedControlID="txtCiudad">Ciudad:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtCiudad"></asp:TextBox>
                <asp:Label runat="server" AssociatedControlID="txtDireccion">Dirección:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion"></asp:TextBox>
                <asp:Label runat="server" AssociatedControlID="txtTelefono">teléfono</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono"></asp:TextBox>
                <asp:Label runat="server" AssociatedControlID="txtEmail">E-mail</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail"></asp:TextBox>
            </div>
            <div class="text-center">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Desactivar perfil" OnClientClick=" return confirm('Seguro desea desactrivar su usario?');" OnClick="Unnamed8_Click"  />
                   
                </div>
        </div>
    </div>
    <br />
</asp:Content>

