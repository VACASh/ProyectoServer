<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmpresa.master" AutoEventWireup="true" CodeFile="publicarOferta.aspx.cs" Inherits="Empresa_publicarOferta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="info" runat="server" ContentPlaceHolderID="infoUser">
    <asp:Label runat="server" ID="lblUserInfo" ForeColor="White"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h3 class="h3">Publica tu oferta </h3>
            <p>Tu oferta sera revisada y en un plazo de 24h estara activa</p>
        </div>
        <div class="card" style="border-color: #007bff; padding: 1em">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-8">
                        <asp:Label ID="lblDescripcion" AssociatedControlID="txtDescripcion" runat="server">Descripción de la oferta:</asp:Label>

                        <asp:TextBox CssClass="form-control" TextMode="MultiLine" Columns="20" Rows="6" ID="txtDescripcion" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="Label2" AssociatedControlID="txtDescripcion" runat="server">Duracion de la oferta:</asp:Label>

                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlDuracion">
                            <asp:ListItem Enabled="true">1 mes</asp:ListItem>
                            <asp:ListItem Enabled="true">3 meses</asp:ListItem>
                            <asp:ListItem Enabled="true">6 meses</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label runat="server" AssociatedControlID="txtCiudad">Ciudad:</asp:Label>
                        <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control"></asp:TextBox>
                        <asp:Label runat="server" AssociatedControlID="txtPersonas">Puestos a cubrir:</asp:Label>
                        <asp:TextBox TextMode="Number" runat="server" ID="txtPersonas" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label runat="server" AssociatedControlID="txtJornada">Tipo de contrato (en horas semanales): </asp:Label>
                        <asp:TextBox runat="server" ID="txtJornada" CssClass="form-control" placerholder="40h..."></asp:TextBox>

                        <asp:Label runat="server" ID="Label1" placeholder="Alzheimer.. " AssociatedControlID="txtEspecialidad">Si fuera necesario seleccione alguna especialidad necesaria:</asp:Label>

                        <asp:DropDownList runat="server" CssClass="form-control" ID="txtEspecialidad">
                            <asp:ListItem Enabled="true" Text="Ninguna"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Minusvalia"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Alzheimer"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Diabetes"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Problemas auditivos"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Hipertension"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Parkinson"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <br />
                <div class="text-center">
                     <asp:Button runat="server" CssClass="btn btn-success" ID="lblOferta" Text="Publicar" OnClick="lblOferta_Click" />
                </div>
               
            </div>
           
        </div>
    </div>
    <br />
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    <br />
</asp:Content>

