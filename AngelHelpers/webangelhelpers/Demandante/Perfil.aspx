<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Demandante_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h2 class="h2">
                <asp:label runat="server" text="Label">Configuración</asp:label>
            </h2>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Ajustes de perfil</h4>
                        <asp:label runat="server" text="Label">Actualiza tu nombre,tu dirección, el correo electrónico o añade idiomas  </asp:label>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:button runat="server" text="Actualizar" cssclass="btn btn-primary" />
                    </div>
                </div>


            </div>



            <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" selectcommand="SELECT Sabe.* FROM Idiomas INNER JOIN Sabe ON Idiomas.Idioma = Sabe.idioma"></asp:sqldatasource>
            <div class="card-body">
                <div class="form-group row">
                    <br />
                    <div class="col-sm-2">
                        <asp:label runat="server" id="lblNombre" associatedcontrolid="txtNombre">Nombre:</asp:label>
                    </div>
                    <div class="col-sm-6">
                        <asp:textbox runat="server" id="txtNombre" cssclass="form-control"></asp:textbox>
                    </div>

                </div>
                <div class="form-group row">
                    <br />
                    <div class="col-sm-2">
                        <asp:label runat="server" id="lblApellido" associatedcontrolid="txtApellido">Apellidos:</asp:label>
                    </div>
                    <div class="col-sm-6">
                        <asp:textbox runat="server" id="txtApellido" cssclass="form-control"></asp:textbox>
                    </div>

                </div>
                <hr />
                <div class="form-group row">
                    <br />
                    <div class="col-sm-2">
                        <asp:label runat="server" id="lblEmail" associatedcontrolid="txtEmail">Dirección de correo electronico:</asp:label>
                    </div>
                    <div class="col-sm-6">
                        <asp:textbox runat="server" id="txtEmail" cssclass="form-control"></asp:textbox>
                    </div>
                </div>
                <div class="form-group row">
                    <br />
                    <div class="col-sm-2">
                        <asp:label runat="server" id="lblTlf" associatedcontrolid="txtTelefono">Número de telefono:</asp:label>
                    </div>
                    <div class="col-sm-6">
                        <asp:textbox runat="server" id="txtTelefono" cssclass="form-control"></asp:textbox>
                    </div>
                </div>
                <hr />
                <h5>Idiomas y especialidad</h5>
                <div class="form-group row">
                    <br />

                    <div class="col-sm-2">
                        <asp:label runat="server" id="Label1" placeholder="Alzheimer.. " associatedcontrolid="txtEspecialidad">Especialidad:</asp:label>
                    </div>
                    <div class="col-sm-6">
                        <asp:dropdownlist runat="server" cssclass="form-control" id="txtEspecialidad">
                            <asp:ListItem Enabled="true" Text="Ninguna"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Minusvalia"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Alzheimer"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Diabetes"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Problemas auditivos"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Hipertension"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Parkinson      "></asp:ListItem>
                        </asp:dropdownlist>
                    </div>
                    <div class="col-sm-4">

                        <asp:button runat="server" text="Idiomas" Width="100%" cssClass="btn btn-primary " OnClick="Unnamed4_Click" />
                        <asp:PlaceHolder runat="server" ID="idiomas" Visible="false">
                            <div class="card">
                                <br />
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlIdiomas">
                                <asp:ListItem Enabled="true">Inglés</asp:ListItem> 
                                <asp:ListItem Enabled="true">Francés</asp:ListItem> 
                                <asp:ListItem Enabled="true">Aleman</asp:ListItem> 
                                <asp:ListItem Enabled="true">Chino</asp:ListItem> 
                                <asp:ListItem Enabled="true">Griego</asp:ListItem> 
                                <asp:ListItem Enabled="true">Itialiano</asp:ListItem> 
                                <asp:ListItem Enabled="true">Noruego</asp:ListItem> 
                                <asp:ListItem Enabled="true">Portugues</asp:ListItem> 
                                <asp:ListItem Enabled="true">Ruso</asp:ListItem> 
                            </asp:DropDownList>
                                <br />
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlNivel">
                                    <asp:ListItem Enabled="true">Básico</asp:ListItem>
                                    <asp:ListItem Enabled="true">Intermedio</asp:ListItem>
                                    <asp:ListItem Enabled="true">Avanzado</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                 <asp:Button runat="server" Text="Añadir" CssClass="btn btn-success" OnClick="Unnamed5_Click1" />
                        </div>
                        </asp:PlaceHolder>
                       
                    </div>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Desactivar perfil" onclientclick=" return confirm('Seguro desea desactrivar su usario?');" OnClick="Unnamed5_Click" />
                    <asp:Label runat="server" ID="lblMensajes"></asp:Label>
                </div>




                <br />


                <asp:textbox runat="server" cssclass="form-control"></asp:textbox>
                <asp:textbox runat="server" cssclass="form-control"></asp:textbox>
                <asp:label runat="server" id="lblPrueba"></asp:label>
            </div>
        </div>
    </div>



    </div>
</asp:Content>

